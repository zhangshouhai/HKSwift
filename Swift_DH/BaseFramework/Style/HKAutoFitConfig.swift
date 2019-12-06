//
//  HKAutoFitConfig.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/6.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import Foundation

public func HKFixWidthFlaot(_ width: CGFloat) -> CGFloat {
    var width = width
    let mainFrme = UIScreen.main.bounds
    if mainFrme.size.height / 1136 * 2 < 1 {
        return width
    }
    width = width * mainFrme.size.width / 640 * 2
    return width
}

public func HKFixHeightFlaot(_ height: CGFloat) -> CGFloat {
    var height = height
    let mainFrme = UIScreen.main.bounds
    if mainFrme.size.height / 1136 * 2 < 1 {
        return height
    }
    if UIScreen.main.bounds.size.height == 812.0 {
        height = (height * (mainFrme.size.height - 145)) / 1136 * 2
    } else {
        height = height * mainFrme.size.height / 1136 * 2
    }
    return height
}

public func FontWithStr(_ font:CGFloat) -> CGFloat {
    return HKFixWidthFlaot(font)
}
