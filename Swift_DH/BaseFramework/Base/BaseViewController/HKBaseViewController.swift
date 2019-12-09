//
//  HKBaseViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

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
        let titleStr = HKLabel(font: FontWithStr(18), color: UIColor.white, text: "")
        titleStr.textAlignment = NSTextAlignment.center
        return titleStr
    }()
    
    //导航栏右侧按钮
    lazy var navRightBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.white, text: "", image: "", isRadius: true)
        btn.frame=CGRect(x: kMainScreen_width-50, y: kMainTopHeight-34, width: 40, height: 30)
        btn.addTarget(self, action: #selector(right_click), for: UIControlEvents.touchUpInside)
        return btn
    }()
    //导航栏左侧按钮
    lazy var navLeftBtn:UIButton = {
        let btn = HKButton(backColor: UIColor.white, text: "", image: "", isRadius: true)
        btn.addTarget(self, action: #selector(right_click), for: UIControlEvents.touchUpInside)
        btn.frame = CGRect(x: 0, y: kMainTopHeight - 34, width: 35, height: 22)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
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
       
    }
    
    func setnavViewUI() {
        
        navView = UIView(frame:CGRect(x: 0, y: 0, width:kMainScreen_width, height: kMainTopHeight))

        //当行颜色
        navView?.backgroundColor = UIColor.colorWithHexString(colorString: "#22B9C8")
        navView?.addSubview(self.titleLabel)
        navView?.addSubview(self.navLeftBtn)
        navView?.addSubview(self.navRightBtn)
        
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(kMainTopHeight-44)
            make.height.equalTo(HKFixHeightFlaot(20))
        }
        
       self.view.addSubview(navView!)
        

    }
    
    func setHideLeftBtn() {

        
        self.navLeftBtn.isHidden = true
        
    }

    @objc func left_click(_ sender: UIButton?) {
        
        
        if self.delegate!.responds(to: #selector(HKBaseViewControllerDelegate.left_button_event)){
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
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
