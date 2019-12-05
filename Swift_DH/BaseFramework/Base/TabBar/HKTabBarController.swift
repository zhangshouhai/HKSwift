//
//  HKTabBarController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import Foundation


class HKTabBarController: UITabBarController,HKTabBarViewDelegate {
    
    var isTabBarHide: Bool = false
    private var myTabBar: HKTabBar! {
        get {
            let myTab = HKTabBar(frame: self.tabBar.bounds)     // 注意frame与bounds的区别
            myTab.backgroundColor = UIColor.colorWithHexString(colorString: "#22B9C8")
            myTab.tabBarView.delegate = self
            myTab.tabBarView.tabBarItems = self.tabBarCItems
            return myTab
        }
        set {
            
        }
    }
    private lazy var tabBarCItems: NSMutableArray = {
        return NSMutableArray()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置子控制器
        setUpAllChildViewController()
        // 自定义tabBar
        addCustTabBar()
    }
    
    // 修改tabbar高度
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = kMainBottomHeight
        tabFrame.origin.y = self.view.frame.size.height - kMainBottomHeight
        self.tabBar.frame = tabFrame
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        removeTabBarButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        removeTabBarButton()
    }
    
    func removeTabBarButton() {
        // 隐藏系统的tabBar子视图（无需删除）
        for view in self.tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                view.isHidden = true
            }
        }
    }
    
    func setUpAllChildViewController() {
        // 首页
        let home: HomeViewController = HomeViewController()
        setUpOneOfChildViewController(home, "首页-点击前", "首页-点击状态", "首页")
        // 生活
        let life: SecondViewController = SecondViewController()
        setUpOneOfChildViewController(life, "作品-点击前", "作品-点击状态", "作品")
        // 消息
        let msg: ThreeViewController = ThreeViewController()
        setUpOneOfChildViewController(msg, "技艺-点击前", "技艺-点击状态", "技艺")
        // 我的
        let mine: FourViewController = FourViewController()
        setUpOneOfChildViewController(mine, "我的-点击前", "我的-点击状态", "我的")
    }
    
    func setUpOneOfChildViewController(_ vc: UIViewController, _ image: String, _ selectedImage: String, _ title: String) {
        // title属性会默认设置tabBarItem.title,如果设置了title，则tabBarItem.title会被覆盖
//        if vc.isKind(of: HKMineViewController.self) {
            vc.tabBarItem.title = title
//        }
//        else {
//            vc.title = title
//        }
        
        // 设置 tabbarItem 选中状态的图片(不被系统默认渲染,显示图像原始颜色)
        vc.tabBarItem.image = UIImage(named: image)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for: UIControlState.normal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.black], for: UIControlState.selected)
        
        // 保存tabBarItem模型到数组
        self.tabBarCItems.add(vc.tabBarItem)
        
        let nav: HKNavigationController = HKNavigationController(rootViewController: vc)
        self.addChildViewController(nav)
    }
    
    // 自定义tabBar
    func addCustTabBar() {
        // 去除tabBar上的黑线
        let originalTabBar = UITabBar.appearance()
        originalTabBar.shadowImage = UIImage()
        originalTabBar.backgroundImage = UIImage()
        
        // 添加自定义tabBar
        self.tabBar.addSubview(myTabBar)
        self.tabBar.isTranslucent = false
    }
    
    // 显示tabbar
    func showTabBar() {
        if isTabBarHide == true {
            var frame: CGRect = self.tabBar.frame
            frame.origin.y -= kMainBottomHeight
            UIView.animate(withDuration: 0.5) {
                self.tabBar.frame = frame
            }
            
            isTabBarHide = false
        }
    }
    
    // 隐藏tabbar
    func hideTabBar() {
        if isTabBarHide == false {
            var frame  = self.tabBar.frame
            frame.origin.y += kMainBottomHeight
            UIView.animate(withDuration: 0.5) {
                self.tabBar.frame = frame
            }
            
            isTabBarHide = true
        }
    }
    
    
    // MARK: - HKTabBarViewDelegate
    func tabBar(_ tabBar: HKTabBarView, didClickedButtonAtIndex index: NSInteger) {
        // 改变UITabBarController中当前显示的viewController
        
        
        print("index ",index)
        
//         if index == 3 {
//            let pubVC: LoginViewController  = LoginViewController()
//            let nav = HKNavigationController(rootViewController: pubVC)
//            self.present(nav, animated: true, completion: nil)
//            return
//        }
  
        self.selectedIndex = index
        
    }
        
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
