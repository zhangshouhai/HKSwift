//
//  HKDarkModeConfig.swift
//  BaseFramework
//
//  Created by mac on 2020/3/11.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit



class HKDarkModeConfig {
    
    /**
        *   判断 “暗黑模式”  以及 ”正常模式“
        *
        *     false ：正常模式
        *     true： 夜间模式
        */
    public class func darkStyle ()->Bool
    {
        if #available(iOS 13, *) {
            if UITraitCollection.current.userInterfaceStyle == .dark {
                    return true
            }
            else
            {
                return false
            }
        }
        else {
            return false
        }
    }

    /**
     *     适配 “暗黑模式”  以及 ”正常模式“ 下的 颜色显示
     *
     *     LightColor ：正常模式
     *     darkColor： 夜间模式
     */
    public class func darkModeColor( LightColor: UIColor?, darkColor: UIColor?) -> UIColor {
        
        if #available(iOS 13, *) {
            if HKDarkModeConfig.darkStyle() {
                return darkColor!
            }
            else
            {
                return LightColor!
            }
        } else {
            return LightColor!
        }
    }
}
