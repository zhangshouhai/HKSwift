//
//  HKAppManager.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import UIKit


class HKAppManager: NSObject {
    
    static let sharedInstance = HKAppManager()
    
    // 选择根控制器
    func chooseRootVC(window: UIWindow) {
        window.rootViewController = HKTabBarController()
    }
    
    // APP初始化
    func initAppWithApplication(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
    }
    // 跳转到主页
    func jumpToMainVC(window: UIWindow) {
        window.rootViewController = HKTabBarController()
    }
    
    // 跳转到登录
    func jumpToLoginVC(window: UIWindow) {
        window.rootViewController = LoginViewController()
    }
    
}
