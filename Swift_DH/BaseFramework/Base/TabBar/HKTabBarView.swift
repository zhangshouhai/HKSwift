//
//  HKTabBarView.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

@objc protocol HKTabBarViewDelegate {
    @objc optional func tabBar(_ tabBar: HKTabBarView, didClickedButtonAtIndex index: NSInteger)
}

class HKTabBarView: UIView {

    var delegate: HKTabBarViewDelegate?
    private var buttons: NSMutableArray!
    private var selectedButton: UIButton?
    
    private lazy var centerButton: HKTabBarButton = {
       let btn = HKTabBarButton(type: UIButtonType.custom)
        btn.setImage(UIImage(named: "icon_menu_add"), for: UIControlState.normal)
        btn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        return btn
    }()
    
    var tabBarItems: NSArray! {
        didSet {
            buttons = NSMutableArray.init()
            
            // 遍历模型数组，创建对应tabBarButton
            for i in 0..<tabBarItems.count {
                let btn: HKTabBarButton = HKTabBarButton(type: UIButtonType.custom)
                // 给按钮赋值模型，按钮的内容由模型对应决定
                btn.item = tabBarItems[i] as? UITabBarItem
                // 设置按钮标记
                btn.tag = i
                // 为按钮添加事件
                btn.addTarget(self, action: #selector(btnClicked(_:)), for: UIControlEvents.touchUpInside)

                self.addSubview(btn)
                // 把按钮添加到按钮数组
                self.buttons.add(btn)
                

            }
        }
    }
    
    @objc func btnClicked(_ button: HKTabBarButton) {
//        if button.tag != 2 {
            selectedButton?.isSelected = false  // 前一个button
            button.isSelected = true
            selectedButton = button     // 使当前button变成前一个button
//        }
        
        // 响应代理
        delegate?.tabBar!(self, didClickedButtonAtIndex: button.tag)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w: CGFloat = self.bounds.size.width
        let h: CGFloat = kMainBottomHeight
        
        var btnX: CGFloat = 0
        let btnY: CGFloat = 0
        let btnW = w / CGFloat(self.buttons.count)
        let btnH = isIphoneX() ? (h-kIPhoneXMargin) : h
        
        // 修改系统tabBar上面的按钮的位置
        for i in 0..<self.buttons.count {

                let tabBarButton = self.buttons[i] as! HKTabBarButton
                btnX = CGFloat(i) * btnW
                tabBarButton.isShowTitle = true
                tabBarButton.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)

        }
    }
}

