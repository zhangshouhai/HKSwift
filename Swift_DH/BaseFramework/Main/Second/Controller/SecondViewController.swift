//
//  SecondViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import Photos
import CLImagePickerTool

class SecondViewController: HKBaseViewController {

    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = ""
        self.setHideLeftBtn()
        
        let button = HKButton(backColor: .blue, text: "选择照片", image: "", isRadius: true)
        self.view.addSubview(button)
        button.snp_makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        
        button.addTapAction { (tap) in
            self.setupPhoto1()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 异步原图
    private func setupPhoto1() {
        let imagePickTool = CLImagePickerTool()
        
        imagePickTool.isHiddenVideo = true
        
        imagePickTool.cl_setupImagePickerWith(MaxImagesCount: 10) { (assetArr,cutImage) in
            print("返回的asset数组是\(assetArr)")
            
            PopViewUtil.share.showLoading()
            
//            self.PhotoScrollView.picArr.removeAll()
//            self.PhotoScrollView.picArr.append(UIImage(named: "takePicture")!)
            
            var imageArr = [UIImage]()
            var index = assetArr.count // 标记失败的次数
            
            // 获取原图，异步
            // scale 指定压缩比
            // 内部提供的方法可以异步获取图片，同步获取的话时间比较长，不建议！，如果是iCloud中的照片就直接从icloud中下载，下载完成后返回图片,同时也提供了下载失败的方法
            CLImagePickerTool.convertAssetArrToOriginImage(assetArr: assetArr, scale: 0.1, successClouse: {[weak self] (image,assetItem) in
                imageArr.append(image)
//                self?.PhotoScrollView.picArr.append(image)
                
                self?.dealImage(imageArr: imageArr, index: index)
                
                }, failedClouse: { () in
                    index = index - 1
                    self.dealImage(imageArr: imageArr, index: index)
            })
            
        }
    }
    
    @objc func dealImage(imageArr:[UIImage],index:Int) {
        // 图片下载完成后再去掉我们的转转转控件，这里没有考虑assetArr中含有视频文件的情况
        if imageArr.count == index {
            PopViewUtil.share.stopLoading()
        }
        // 图片显示出来以后可能还要上传到云端的服务器获取图片的url，这里不再细说了。
    }

}

