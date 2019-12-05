//
//  HKTabBar.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import UIKit

class HKTabBar: UITabBar {

    var tabBarView: HKTabBarView!

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tabBarView = HKTabBarView(frame: CGRect(x: 0, y: 0, width: kMainScreen_width , height: kMainBottomHeight))
        self.addSubview(tabBarView)
    }
    
    // 重写hitTest方法，让超出tabBar部分也能响应事件
//    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        if self.clipsToBounds || self.isHidden || self.alpha == 0.0 {
//            return nil
//        }
//        var result: UIView? = super.hitTest(point, with: event)
//        // 如果事件发生在tabbar里面直接返回
//        if result != nil {
//            return result
//        }
//        // 这里遍历那些超出的部分就可以了，不过这么写比较通用
//        for subView: UIView? in self.tabBarView.subviews {
//            // 把这个坐标从tabbar的坐标系转为subview的坐标系
//            let subPoint: CGPoint = subView!.convert(point, from: self)
//            result = subView?.hitTest(subPoint, with: event)
//            // 如果事件发生在subView里就返回
//            if result != nil {
//                return result
//            }
//        }
//        return nil
//    }
}
