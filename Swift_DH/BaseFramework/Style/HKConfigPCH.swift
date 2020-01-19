//
//  HKConfigPCH.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import Kingfisher


// MARK: - 系统相关 =================================================

public let kAppBundleInfoVersion = Bundle.main.infoDictionary ?? Dictionary()
public let kAppBundleVersion = (kAppBundleInfoVersion["CFBundleShortVersionString" as String] as? String ) ?? ""
public let kAppBundleBuild = (kAppBundleInfoVersion["CFBundleVersion"] as? String ) ?? ""
public let kAppDisplayName = (kAppBundleInfoVersion["CFBundleDisplayName"] as? String ) ?? ""

public let kiOSBase = 8.0
public let kOSGreaterOrEqualToiOS8 = ( (Double(UIDevice.current.systemVersion) ?? kiOSBase) > 8.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS9 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 9.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS10 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 10.0 ) ? true : false;
public let kOSGreaterOrEqualToiOS11 = ((Double(UIDevice.current.systemVersion) ?? kiOSBase) >= 11.0 ) ? true : false;

public let kStatusBarheight = UIApplication.shared.statusBarFrame.size.height
public let kNavBarHeight_StatusHeight: ((UIViewController)-> CGFloat) = {(vc : UIViewController ) -> CGFloat in
    weak var weakVC = vc;
    var navHeight = weakVC?.navigationController?.navigationBar.bounds.size.height ?? 0.0
    return (navHeight + kStatusBarheight)
}

public func isIphoneX() -> Bool {
    if UIScreen.main.bounds.height == 812 {
        return true
    }
    return false
}

// 判断iPhoneX
public let kDevice_Is_iPhoneX :Bool! = (UIScreen.main.bounds.size.height == 812.0 || UIScreen.main.bounds.size.height == 896.0) ? true : false
// 设备宽高、机型
public let kMainScreen_height           = UIScreen.main.bounds.size.height
public let kMainScreen_width            = UIScreen.main.bounds.size.width
public let kMainTopHeight: CGFloat       = kDevice_Is_iPhoneX ? 88 : 64
public let kMainBottomHeight: CGFloat    = kDevice_Is_iPhoneX ? 83 : 49
public let kIPhoneXMargin: CGFloat       = 34


public var isDebug: Bool {
    #if DEBUG
    return true
    #else
    return false
    #endif
}

public var isSimulator: Bool {
    #if targetEnvironment(simulator)
    return true
    #else
    return false
    #endif
}



// MARK: - 图片、颜色 =================================================
/* 根据imageName创建一个UIImage*/
public let imageNamed:((String) -> UIImage? ) = { (imageName : String) -> UIImage? in
    return UIImage.init(named: imageName)
}

/* 通过 十六进制与alpha来设置颜色值（ 样式：0xff00ff ）*/
public let HexRGBAlpha:((Int,Float) -> UIColor) = { (rgbValue : Int, alpha : Float) -> UIColor in
    return UIColor(red: CGFloat(CGFloat((rgbValue & 0xFF0000) >> 16)/255), green: CGFloat(CGFloat((rgbValue & 0xFF00) >> 8)/255), blue: CGFloat(CGFloat(rgbValue & 0xFF)/255), alpha: CGFloat(alpha))
}

/* 通过 red 、 green 、blue 颜色数值*/
public let RGB:((Float,Float,Float) -> UIColor) = { (r: Float, g: Float , b: Float) -> UIColor in
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: 1.0)
}

/* 通过 red 、 green 、blue 、alpha 颜色数值*/
public let RGBAlpa:((Float,Float,Float,Float) -> UIColor) = { (r: Float, g: Float , b: Float , a: Float ) -> UIColor in
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
}



// MARK: - 本地存储 Key ===================================================

public let HKUserKey: NSString            = "user" //登录用户信息





// MARK: - 自定义颜色 ===================================================

// 颜色
public let HKNavBgColor: NSString                    = "#22B9C8" //导航颜色
public let HKNavTitleColor: NSString                 = "#FFFFFF" //导航Title颜色
public let HKTabbarTextColor: NSString               = "#000000" //tabbarTextColor
public let HKTabbarImageColor: NSString              = "#000000"//tabbarImageColor
public let HKTabbarTextSeledColor: NSString          = "#CB011D"//tabbarTextSeledColor
public let HKTabbarImageSeledColor: NSString         = "#CB011D"//tabbarImageSeledColor
public let HKLineViewColor: NSString                 = "#EFEFEF" //cell 分割线 Color



// MARK: - 全局自定义字号大小===================================================
public let fontSize8: UIFont        = UIFont.systemFont(ofSize: HKFixHeightFlaot(8.0)) //8.0号字
public let fontSize10: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(10.0)) //10.0号字
public let fontSize11: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(11.0)) //11.0号字
public let fontSize12: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(12.0)) //12.0号字
public let fontSize13: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(13.0)) //13.0号字
public let fontSize14: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(14.0)) //14.0号字
public let fontSize15: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(15.0)) //15.0号字
public let fontSize16: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(16.0)) //16.0号字
public let fontSize17: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(17.0)) //17号字

public let fontSize24: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(24.0)) //24号字
public let fontSize36: UIFont       = UIFont.systemFont(ofSize: HKFixHeightFlaot(36.0)) //36号字






// MARK: - 过滤 null ===================================================
///过滤null对象
public let kFilterNullOfObj:((Any)->Any?) = {(obj: Any) -> Any? in
    if obj is NSNull {
        return nil
    }
    return obj
}

///过滤null的字符串，当nil时返回一个初始化的空字符串
public let kFilterNullOfString:((Any)->String) = {(obj: Any) -> String in
    if obj is String {
        return obj as! String
    }
    return ""
}

/// 过滤null的数组，当nil时返回一个初始化的空数组
public let kFilterNullOfArray:((Any)->Array<Any>) = {(obj: Any) -> Array<Any> in
    if obj is Array<Any> {
        return obj as! Array<Any>
    }
    return Array()
}

/// 过滤null的字典，当为nil时返回一个初始化的字典
public let kFilterNullOfDictionary:((Any) -> Dictionary<AnyHashable, Any>) = {( obj: Any) -> Dictionary<AnyHashable, Any> in
    if obj is Dictionary<AnyHashable, Any> {
        return obj as! Dictionary<AnyHashable, Any>
    }
    return Dictionary()
}

