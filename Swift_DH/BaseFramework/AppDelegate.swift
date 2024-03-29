//
//  AppDelegate.swift
//  BaseFramework
//
//  Created by DH add LK on 2018/7/26.
//  Copyright © 2018 12 04 DH add LK. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    internal func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initDarkTheme()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        
        // 设置启动页面时间
        Thread.sleep(forTimeInterval: 1.0)
        
        // 设置状态栏的样式
        application.statusBarStyle = UIStatusBarStyle.default
        // 程序启动完后显示状态栏
        application.isStatusBarHidden = false

        
        self.window?.makeKeyAndVisible()
       
        
        if !UserDefaults.standard.bool(forKey: "FIRSTSTART") {
            HKAppManager.sharedInstance.jumpToWelcomeVC(window: window!)
        } else {
            HKAppManager.sharedInstance.chooseRootVC(window: window!)
        }

//        addLaunchImageView(window: window!)

        // 初始化第三方应用
//        HKAppManager.sharedInstance.initAppWithApplication(application: application, launchOptions: launchOptions)
        
        return true
    }
    
    func addLaunchImageView(window: UIWindow) {
//           self.window?.makeKeyAndVisible()
        let launchImageView = LaunchImageView.init(frame: CGRect.init(x: 0, y: 0, width: kMainScreen_width, height: kMainScreen_height))
        launchImageView.backgroundColor = UIColor.white
        self.window?.addSubview(launchImageView)
        self.window?.bringSubviewToFront(launchImageView)
        

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 0.0, animations: {
                launchImageView.alpha = 0
                launchImageView.removeFromSuperview()
                //广告页
                HKAppManager.sharedInstance.launchExample04(window: window)
         }, completion: {[weak self] (finished:Bool) in

           })

        }
       }
   


    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
         HKThemes.saveLastTheme()
    }

    /**
     *     Theme初始化
     */
    
    func initDarkTheme() {
        
        HKThemes.restoreLastTheme()
    }
   

}

