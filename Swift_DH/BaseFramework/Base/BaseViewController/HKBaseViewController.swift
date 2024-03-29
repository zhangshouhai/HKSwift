//
//  HKBaseViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
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
    
    @objc optional func darkLeftButtonImage()
}



class HKBaseViewController: UIViewController,UIGestureRecognizerDelegate {
    
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
        let titleStr = HKLabel(font: fontSize15, color:UIColor.black, text: "")
        titleStr.textAlignment = NSTextAlignment.center
        titleStr.theme_textColor = HKThemeColor.NavTitleColor
        return titleStr
    }()
    
    lazy var lineView :UIView = {
        let lineView1 = UIView.init()
        lineView1.backgroundColor = UIColor.colorWithHexString(colorString: "#F4F4F4")
        return lineView1
    }()
    
    
    //导航栏右侧按钮
    lazy var navRightBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.clear, text: "", image: "", isRadius: true)
        btn.frame=CGRect(x: kMainScreen_width-50, y: kMainTopHeight-40, width: 40, height: 30)
        btn.addTarget(self, action: #selector(right_click), for: UIControl.Event.touchUpInside)
        return btn
    }()
    //导航栏左侧按钮
    lazy var navLeftBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.clear, text: "", image: "dark_back", isRadius: true)
//        btn.addTarget(self, action: #selector(right_click), for: UIControl.Event.touchUpInside)
        btn.frame = CGRect(x: 10, y: kMainTopHeight - 40, width: 30, height: 30)
        btn.addTarget(self, action: #selector(left_click(_:)), for: .touchUpInside)
//        btn.theme_setImage(HKThemeImage.NavLeftImage, forState: .normal)
        return btn
    }()

    var navView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        //解决下移

        self.navigationController?.navigationBar.isTranslucent = false
        self.automaticallyAdjustsScrollViewInsets = false

        self.view.theme_backgroundColor = HKThemeColor.backgroundColor
        self.setnavViewUI()
        navView?.addSubview(self.navLeftBtn)
    

    }
    
    

    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func setnavViewUI() {
        
        navView = UIView(frame:CGRect(x: 0, y: 0, width:kMainScreen_width, height: kMainTopHeight))

        //当行颜色
        navView?.backgroundColor = UIColor.white
        navView?.addSubview(self.titleLabel)
        navView?.addSubview(self.navLeftBtn)
        navView?.addSubview(self.navRightBtn)
        
        navView?.addSubview(self.lineView)
        self.lineView.isHidden = true
        

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
        self.view.bringSubviewToFront(navView!)
        

    }
    func set_noNavView()  {
        self.navView?.isHidden = true
    }
    
    func darkLeftButtonImage()  {
        self.navLeftBtn.setImage(UIImage(named: "icon_fanhui_xiangqing"), for: .normal)
        self.titleLabel.textColor = .white
    }
    
    func setHideLeftBtn() {

        self.navLeftBtn.isHidden = true
    }

    @objc func left_click(_ sender: UIButton?) {
        
        if self.delegate != nil && (self.delegate?.responds(to: #selector(HKBaseViewControllerDelegate.left_button_event)))! {
             self.delegate!.left_button_event?()
        }
        else{
             navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
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
    
    //跳转登录界面

        func showLoginView() {
            
            if !HKTool.shardTool.islogin()
            {
                let loginVC = LoginViewController()
                
                let navigationloginVC = UINavigationController(rootViewController: loginVC)
                navigationloginVC.modalPresentationStyle = .fullScreen
                self.present(navigationloginVC, animated: true, completion: nil)
                
                return
            }
 
        }
    
    
    
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
//        if #available(iOS 13.0, *) {
//            if UITraitCollection.current.userInterfaceStyle == .dark {
//                 HKThemes.switchNight(isToNight: true)
//            }
//            else
//            {
//                 HKThemes.switchNight(isToNight: false)
//            }
//        } else {
//             HKThemes.switchNight(isToNight: false)
//        }

    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
