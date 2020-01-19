//
//  HKAppManager.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import GuidePageView

class HKAppManager: NSObject {
    
    static let sharedInstance = HKAppManager()
    

    
    private var myTabBar: ESTabBarController! {
          let tabBarController = ESTabBarController()
        
            let v1 = LKTestViewController()
            let navi = HKNavigationController(rootViewController:v1)
        
            let v2 = SecondViewController()
            let nav2 = HKNavigationController(rootViewController:v2)
        
            let v3 = ThreeViewController()
            let nav3 = HKNavigationController(rootViewController:v3)
        
            let v4 = FourViewController()
            let nav4 = HKNavigationController(rootViewController:v4)
        
            let v5 = FiveController()
            let nav5 = HKNavigationController(rootViewController: v5)
        
            navi.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "首页", image: UIImage(named: "首页-点击前"), selectedImage: UIImage(named: "首页-点击状态"))
            nav2.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "作品", image: UIImage(named: "作品-点击前"), selectedImage: UIImage(named: "作品-点击状态"))
            nav3.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "技艺", image: UIImage(named: "技艺-点击前"), selectedImage: UIImage(named: "技艺-点击状态"))
            nav4.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "消息", image: UIImage(named: "我的-点击前"), selectedImage: UIImage(named: "我的-点击状态"))
        
        
            nav5.tabBarItem = ESTabBarItem.init(ExampleBouncesContentView(), title: "我的", image: UIImage(named: "我的-点击前"), selectedImage: UIImage(named: "我的-点击状态"))

            tabBarController.viewControllers = [navi, nav2, nav3, nav4,nav5]
            tabBarController.shouldHijackHandler = {
                tabbarController, viewController, index in
//                if index == 3 {
//
//
//                    print(index)
//                    return true
//                }
                return false
            }
            return tabBarController
       }
    
    
    private var myWelcomeVC : UIViewController! {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.white
        
        viewController.view.frame = CGRect(x: 0, y: 0, width: kMainScreen_width, height:kMainScreen_height)

        //满足条件,说明是第一次运行,然后用字典在沙盒中写入文件,并将值改为YES,项目以后再运行,读取到的值均为YES
        UserDefaults.standard.set(true, forKey: "FIRSTSTART")

        let imageGifArray = ["guideImage1.jpg","guideImage6.gif","guideImage7.gif","guideImage3.jpg", "guideImage5.jpg"]
        let guideView = GuidePageView.init(images: imageGifArray, loginRegistCompletion: {
                    print("登录/注册")
                }) {
                    print("开始使用app")
                    let window = UIApplication.shared.keyWindow
                    window?.rootViewController = self.myTabBar!

                }
        //        guideView.isSlipIntoHomeView = true
        viewController.view.addSubview(guideView)
    
        return viewController
    }


    // 选择根控制器
    func chooseRootVC(window: UIWindow) {
        window.rootViewController = myTabBar
        
    }

    
    func jumpToWelcomeVC(window: UIWindow) {
        window.rootViewController = myWelcomeVC
    }
    
    
    
    // APP初始化 第三方应用
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
    
    // 跳转到登录
    func launchExample04(window: UIWindow) {
        
        
        ZLaunchAd.create(showEnterForeground: true, timeForWillEnterForeground: 10, adNetRequest: { adView in
            let buttonConfig = ZLaunchSkipButtonConfig()
            buttonConfig.skipBtnType = .timer
            let imageResource = ZLaunchAdImageResourceConfigure()
            imageResource.imageNameOrImageURL = "http://chatm-icon.oss-cn-beijing.aliyuncs.com/pic/pic_20171109135437541.png"
            imageResource.animationType = .crossDissolve
            imageResource.imageDuration = 3
            imageResource.imageFrame = CGRect(x: 0, y: 0, width: Z_SCREEN_WIDTH, height: Z_SCREEN_HEIGHT-75)
            
            adView.setImageResource(imageResource, buttonConfig: buttonConfig, action: {
                let vc = HKBaseViewController()
                vc.view.backgroundColor = UIColor.red
                window.rootViewController?.navigationController?.pushViewController(vc, animated: true)
            })
            
            
        }).endOfCountDown {
            printLog("倒计时结束了-----")
        }
        
        
    }
    
    
    
    
}


