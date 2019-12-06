//
//  HKAppManager.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit


class HKAppManager: NSObject {
    
    static let sharedInstance = HKAppManager()
    
    
    
    
    
    
    private var myTabBar: ESTabBarController! {
          let tabBarController = ESTabBarController()
        
            let v1 = HomeViewController()
            let v2 = SecondViewController()
            let v3 = ThreeViewController()
            let v4 = FourViewController()
        
            v1.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "首页", image: UIImage(named: "首页-点击前"), selectedImage: UIImage(named: "首页-点击状态"))
            v2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "作品", image: UIImage(named: "作品-点击前"), selectedImage: UIImage(named: "作品-点击状态"))
            v3.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "技艺", image: UIImage(named: "技艺-点击前"), selectedImage: UIImage(named: "技艺-点击状态"))
            v4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "我的", image: UIImage(named: "我的-点击前"), selectedImage: UIImage(named: "我的-点击状态"))
           
            tabBarController.viewControllers = [v1, v2, v3, v4]
        
        
            tabBarController.shouldHijackHandler = {
                tabbarController, viewController, index in
                if index == 3 {
                    
                    
                    print(index)
                    return true
                }
                return false
            }
        
        
        

            return tabBarController
       }


    // 选择根控制器
    func chooseRootVC(window: UIWindow) {
        
        window.rootViewController = myTabBar
    }
    
    
    
    // APP初始化
    func initAppWithApplication(application: UIApplication, launchOptions: [UIApplicationLaunchOptionsKey: Any]?) {
        
    }
    
    // 跳转到主页
    func jumpToMainVC(window: UIWindow) {
        window.rootViewController = myTabBar
    }
    
    
    // 跳转到登录
    func jumpToLoginVC(window: UIWindow) {
        window.rootViewController = LoginViewController()
    }
    
}
