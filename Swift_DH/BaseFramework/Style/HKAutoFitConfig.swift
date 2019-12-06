//
//  HKAutoFitConfig.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/6.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import Foundation

let appDelegate = (UIApplication.shared.delegate) as! AppDelegate

public func HKFixWidthFlaot(_ width: CGFloat) -> CGFloat {
    var width = width
    width = width*appDelegate.autoSizeScaleW!
    return width
}

public func HKFixHeightFlaot(_ height: CGFloat) -> CGFloat {
    var height = height
    height = height*appDelegate.autoSizeScaleH!
    return height
}

public func FontWithStr(_ font:CGFloat) -> CGFloat {
    return HKFixWidthFlaot(font)
}
