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
    //字体自适配
    autoSizeScaleW = kMainScreen_width/375;
    autoSizeScaleH = kMainScreen_height/667;
    autoWidth = width * autoSizeScaleW!
    return autoWidth!
}

public func HKFixHeightFlaot(_ height: CGFloat) -> CGFloat {
    var autoHeight : CGFloat?
    //字体自适配
    autoSizeScaleW = kMainScreen_width/375;
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

public func initAutoScaleSize() {
    if (kMainScreen_height==480)
    {
        //4s
        autoSizeScaleW = kMainScreen_width/375;
        autoSizeScaleH = kMainScreen_height/667;
    }
    else if(kMainScreen_height==568)
    {
        //5
        autoSizeScaleW = kMainScreen_width/375;
        autoSizeScaleH = kMainScreen_height/667;
    }
    else if(kMainScreen_height==667)
    {
        //6
        autoSizeScaleW = kMainScreen_width/375;
        autoSizeScaleH = kMainScreen_height/667;
    }
    else if(kMainScreen_height==736)
    {
        //6p
        autoSizeScaleW = kMainScreen_width/375;
        autoSizeScaleH = kMainScreen_height/667;
    }
    else {
        autoSizeScaleW = kMainScreen_width/375;
        autoSizeScaleH = kMainScreen_height/667;
    }
}
