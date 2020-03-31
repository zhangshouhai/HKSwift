//
//  HomeViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//


import UIKit
import SnapKit
import HandyJSON
import AVFoundation



class HomeViewController: HKBaseViewController
{
    var dark = true
    
    var spectrumView = SpectrumView()
    
    var button = UIButton()
    
    let file_path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first?.appending("/record")
    
    /**
     *  获得录音机对象
     *
     *  @return 录音机对象
     */
    lazy var audioRecorder : AVAudioRecorder = {
        var recorder = AVAudioRecorder()
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSession.Category.playAndRecord)
        } catch let err{
            print("设置类型失败:\(err.localizedDescription)")
        }
        
        //设置session动作
        do {
            try session.setActive(true)
        } catch let err {
            print("初始化动作失败:\(err.localizedDescription)")
        }
        //录音设置,注意,后面需要转换成NSNumber,如果不转换,你会发现,无法录制音频文件,
        let recordSetting:[String:Any] = [AVSampleRateKey:NSNumber(value:8000),//采样集
            AVFormatIDKey:NSNumber(value: kAudioFormatLinearPCM),//音频格式
            AVLinearPCMBitDepthKey:NSNumber(value:8),//采样位数
            AVNumberOfChannelsKey:NSNumber(value: 1),//通道数
            AVEncoderAudioQualityKey:NSNumber(value: AVAudioQuality.min.rawValue)//录音质量
        ]
        do {
            recorder = try AVAudioRecorder(url: URL(fileURLWithPath:file_path!), settings: recordSetting)
        } catch {
        }
        recorder.delegate = self
        recorder.isMeteringEnabled = true
        
        
        return recorder
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppUpdateAlert.sharedInstance.showUpdateAlert(version: "1212", description: "adfasdfasdfasgasgdasdfasdasdf", isupdata: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "导航栏"
        self.view.theme_backgroundColor = HKThemeColor.backgroundColor
        print(HKThemeColor.backgroundColor)
        
        
        //    let dic = [
        //        "authToken":"45bfd868ade83402db4350fa144d6eedc6e00bb4",
        //        "id" : 46,
        //        "sip-name" : "2847",
        //        "username" : "Luke",
        //        "email" : "lukai@gstdev.com",
        //        "sip-caller-name" : "Luke",
        //        "sip-password" : "123456"
        //        ] as [String : Any]
        //
        
        //    let json = AppStyleConfiguration.DataAnyToJson(element: dic)
        //
        //    let model = JSONDeserializer<HKUserModell>.deserializeFrom(json:json)
        
        //        let label = HKLabel(font: fontSize14, color: UIColor.black, text: "darkStyleColor")
        //        label.theme_textColor = HKThemeColor.textColor
        //
        //        self.view.addSubview(label)
        //        label.snp.makeConstraints { (make ) in
        //            make.left.equalTo(20)
        //            make.centerY.equalTo(self.view.centerY)
        //            make.height.equalTo(20)
        //            make.width.equalTo(200)
        //        }
        //
        //        label.isUserInteractionEnabled = true
        //        label.addTapAction { (tap) in
        //
        //            self.dark = !self.dark
        //            HKThemes.switchNight(isToNight: self.dark)
        //        }
        
        
        createView()
        
        
    }
    
    func createView() {
        let view = UIView()
        view.backgroundColor = .white
        self.view.addSubview(view)
        
        button = HKButton(backColor: .systemBlue, text: "录音", image: "", isRadius: true)
//        let Tap = UILongPressGestureRecognizer(target: self, action: #selector(recordStart(button:)))
//        button.addGestureRecognizer(Tap)
        
        button.addTapAction { (tap) in
            if self.button.isSelected {
                //开始
                self.button.removeTarget(self, action: #selector(self.longVoiceBtnClick(sender:)), for:UIControl.Event.touchDown)
                //取消
                self.button.removeTarget(self, action: #selector(self.recordCancel(button:)), for: .touchUpOutside)
                //完成
                self.button.removeTarget(self, action: #selector(self.recordFinish(button:)), for: .touchUpInside)
                //移出
                self.button.removeTarget(self, action: #selector(self.recordTouchDragExit(button:)), for: .touchDragExit)
                //移入
                self.button.removeTarget(self, action: #selector(self.recordTouchDragEnter(button:)), for: .touchDragEnter)
            } else {
                //开始
                self.button.addTarget(self, action: #selector(self.longVoiceBtnClick(sender:)), for:UIControl.Event.touchDown)
                //取消
                self.button.addTarget(self, action: #selector(self.recordCancel(button:)), for: .touchUpOutside)
                //完成
                self.button.addTarget(self, action: #selector(self.recordFinish(button:)), for: .touchUpInside)
                //移出
                self.button.addTarget(self, action: #selector(self.recordTouchDragExit(button:)), for: .touchDragExit)
                //移入
                self.button.addTarget(self, action: #selector(self.recordTouchDragEnter(button:)), for: .touchDragEnter)
            }
            
            self.button.isSelected = !self.button.isSelected
        }
        
        
        
        view.addSubview(button)
        
        weak var weakSelf = self
        
        
        spectrumView = SpectrumView.init(frame: CGRect(x: 0, y: HKFixHeightFlaot(80)/2-HKFixHeightFlaot(25), width: kMainScreen_width - HKFixWidthFlaot(80), height: HKFixHeightFlaot(50)))
        spectrumView.numberOfItems = 150
        spectrumView.itemColor = UIColor.colorWithHexString(colorString: "#43597D")
        weak var weakSpectrum = spectrumView
        spectrumView.itemLevelCallback = {
            
            weakSelf!.audioRecorder.updateMeters()
            //取得第一个通道的音频，音频强度范围是-160到0
            let power = weakSelf!.audioRecorder.averagePower(forChannel: 0)
            weakSpectrum?.level = CGFloat(power)
        }
        
        view.addSubview(spectrumView)
        
        view.snp_makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(HKFixHeightFlaot(80))
            make.center.equalToSuperview()
        }
        
        button.snp_makeConstraints { (make) in
            make.right.equalTo(view.snp_right).offset(HKFixWidthFlaot(-10))
            make.centerY.equalToSuperview()
            make.width.equalTo(HKFixWidthFlaot(80))
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
}

extension HomeViewController: AVAudioRecorderDelegate {
    
    
    //开始录音
    func beginRecord() {
        //录音设置,注意,后面需要转换成NSNumber,如果不转换,你会发现,无法录制音频文件,
        let recordSetting:[String:Any] = [AVSampleRateKey:NSNumber(value:16000),//采样集
            AVFormatIDKey:NSNumber(value: kAudioFormatLinearPCM),//音频格式
            AVLinearPCMBitDepthKey:NSNumber(value:16),//采样位数
            AVNumberOfChannelsKey:NSNumber(value: 1),//通道数
            AVEncoderAudioQualityKey:NSNumber(value: AVAudioQuality.min.rawValue)//录音质量
        ]
        //开始录音
        do {
            let url = URL(fileURLWithPath: file_path!)
            audioRecorder = try AVAudioRecorder(url: url, settings: recordSetting)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            print("开始录音")
        } catch let err {
            print("录音失败:\(err.localizedDescription)")
        }
    }
    
    //结束录音
    func stopRecord() {
        if self.audioRecorder.isRecording {
            print("正在录音,马上结束它,文件保存到了:\(file_path!)")
        }else{
            print("没有录音,但是依然结束它")
        }
        self.audioRecorder.stop()
    }
    
}

extension HomeViewController {
    @objc func recordStart(button: UIButton) {
        print("长按")
        
        
    }
    
    @objc func longVoiceBtnClick(sender:UILongPressGestureRecognizer) {
        if !self.audioRecorder.isRecording {
            print("开始录音")
            audioRecorder.record()
            spectrumView.start()
        }
    }
    
    @objc func recordCancel(button: UIButton) {
        if self.audioRecorder.isRecording {
            print("取消")
            audioRecorder.stop()
        }
    }
    
    @objc func recordFinish(button: UIButton) {
        if self.audioRecorder.isRecording {
            print("完成")
            audioRecorder.stop()
        }
    }
    
    @objc func recordTouchDragExit(button: UIButton) {
        if self.audioRecorder.isRecording {
            print("松开取消")
            self.spectrumView.stop()
        }
    }
    
    @objc func recordTouchDragEnter(button: UIButton) {
        if self.audioRecorder.isRecording {
            print("正在录音")
            self.spectrumView.start()
        }
    }
}
