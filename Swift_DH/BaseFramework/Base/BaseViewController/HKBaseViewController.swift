//
//  HKBaseViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import UIKit


class HKBaseViewController: UIViewController {
    
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

    var navView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.setnavViewUI()
        
    }
    
    func setnavViewUI() {
        
        navView = UIView(frame:CGRect(x: 0, y: 0, width:kMainScreen_width, height: kMainTopHeight))

        //当行颜色
        navView?.backgroundColor = UIColor.colorWithHexString(colorString: "#22B9C8")
        
       self.view.addSubview(navView!)
        

    }
    
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
