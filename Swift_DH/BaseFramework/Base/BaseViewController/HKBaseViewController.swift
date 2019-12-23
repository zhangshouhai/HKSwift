//
//  HKBaseViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import GuidePageView

@objc protocol HKBaseViewControllerDelegate : NSObjectProtocol {
    @objc optional func left_button_event()
    @objc optional func right_button_event()
    @objc optional func title_click_event()
    @objc optional func set_noNavView()
    @objc optional func set_noLeftButton()
}



class HKBaseViewController: UIViewController {
    
    //设置代理
    var delegate:HKBaseViewControllerDelegate?
   
    
    // 用户信息
    var userInfo: NSDictionary?
    // 字典信息
    var dictionaryInfo: NSDictionary?
    // 数组信息
    var arrayInfo: NSArray?
    // 字符串信息
    var stringInfo: NSString?
    // 整型信息
    var integerInfo: NSInteger?
    // 当前控制器名称
    var ctrlName: NSString?
    // 前一控制器名称
    var preCtrlName: NSString?
    
    //导航栏标题
    lazy var titleLabel:UILabel = {
        let titleStr = HKLabel(font: FontWithStr(17), color:UIColor.colorWithHexString(colorString: HKNavTitleColor), text: "")
        titleStr.textAlignment = NSTextAlignment.center
        return titleStr
    }()
    
    lazy var lineView :UIView = {
        let lineView1 = UIView.init()
        lineView1.backgroundColor = UIColor.lightGray
        return lineView1
    }()
    
    
    //导航栏右侧按钮
    lazy var navRightBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.clear, text: "", image: "", isRadius: true)
        btn.frame=CGRect(x: kMainScreen_width-50, y: kMainTopHeight-40, width: 40, height: 30)
        btn.addTarget(self, action: #selector(right_click), for: UIControlEvents.touchUpInside)
        return btn
    }()
    //导航栏左侧按钮
    lazy var navLeftBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.clear, text: "", image: "", isRadius: true)
        btn.addTarget(self, action: #selector(right_click), for: UIControlEvents.touchUpInside)
        btn.frame = CGRect(x: 10, y: kMainTopHeight - 40, width: 30, height: 30)
        btn.setImage(UIImage(named: "icon_fanhui_xiangqing"), for: .normal)
        btn.setImage(UIImage(named: "icon_fanhui_xiangqing"), for: .highlighted)
        btn.addTarget(self, action: #selector(left_click(_:)), for: .touchUpInside)
        return btn
    }()

    var navView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //解决下移
        self.navigationController?.navigationBar.isTranslucent = false
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        self.view.backgroundColor = UIColor.white
        self.setnavViewUI()
        navView?.addSubview(self.navLeftBtn)
        
//        self.setWelcomeView()
    }
    
    func setnavViewUI() {
        
        navView = UIView(frame:CGRect(x: 0, y: 0, width:kMainScreen_width, height: kMainTopHeight))

        //当行颜色
        navView?.backgroundColor = UIColor.colorWithHexString(colorString: HKNavBgColor)
        navView?.addSubview(self.titleLabel)
        navView?.addSubview(self.navLeftBtn)
        navView?.addSubview(self.navRightBtn)
        
        navView?.addSubview(self.lineView)
        
        
        
        self.navRightBtn.isHidden = true
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(kMainTopHeight-40)
            make.height.equalTo(HKFixHeightFlaot(30))
        }
        
        
        self.lineView.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.left.right.equalTo(0)
            make.height.equalTo(1)
        }
        
       self.view.addSubview(navView!)
        

    }
    
    func setHideLeftBtn() {

        self.navLeftBtn.isHidden = true
    }

    @objc func left_click(_ sender: UIButton?) {
        
        if self.delegate != nil && (self.delegate?.responds(to: Selector.init(("left_button_event"))))! {
             self.delegate!.left_button_event?()
        }
        else{
             navigationController?.popViewController(animated: true)
        }

    }

    
    @objc func right_click() {
        self.delegate?.right_button_event?()
    }
    
    //开启 push视图 右滑手势()
    fileprivate func openSwipe(){
     if(self.navigationController != nil){
        self.navigationController!.interactivePopGestureRecognizer!.delegate = self as? UIGestureRecognizerDelegate;
     }

     }

     func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

         if self.navigationController?.viewControllers.count == 1{
             return false;
         }
         return true;
     }
    
    
    func setWelcomeView() {
        let imageGifArray = ["guideImage1.jpg","guideImage6.gif","guideImage7.gif","guideImage3.jpg", "guideImage5.jpg"]
        let guideView = GuidePageView.init(images: imageGifArray, loginRegistCompletion: {
            print("登录/注册")
        }) {
            print("开始使用app")
        }
//        guideView.isSlipIntoHomeView = true
        self.view.addSubview(guideView)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
