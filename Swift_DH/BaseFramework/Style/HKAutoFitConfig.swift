//
//  HKAutoFitConfig.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/6.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import Foundation

var autoSizeScaleW: CGFloat?
var autoSizeScaleH: CGFloat?

public func HKFixWidthFlaot(_ width: CGFloat) -> CGFloat {
    var autoWidth : CGFloat?
    //屏幕宽度自适配
    autoSizeScaleW = kMainScreen_width/375;
    autoWidth = width * autoSizeScaleW!
    return autoWidth!
}

public func HKFixHeightFlaot(_ height: CGFloat) -> CGFloat {
    var autoHeight : CGFloat?
    //屏幕高度自适配
    autoSizeScaleH = kMainScreen_height/667;
    autoHeight = height * autoSizeScaleH!
    return autoHeight!
}

public func FontWithStr(_ font:CGFloat) -> CGFloat {
    
    if (kMainScreen_width==320)
    {
        return font - 1;
    }
    else if(kMainScreen_width==375)
    {
        return font;
    }
    else {
        return font + 1;
    }
    

}
