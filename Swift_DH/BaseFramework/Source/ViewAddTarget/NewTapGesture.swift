//
//  NewTapGesture.swift
//  NiceGesture
//
//  Created by 周正飞 on 2018/4/27.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import UIKit
typealias TapGestureHandler = (UITapGestureRecognizer) -> Void

class NewTapGesture: UITapGestureRecognizer {
    var gestureAction = NewGestureAction<UITapGestureRecognizer>()
    
    init(handler: @escaping TapGestureHandler) {
        gestureAction.endedHandler = handler
        super.init(target: gestureAction, action: #selector(gestureAction.tapAction(gesture:)))
    }
    init(config: @escaping TapGestureHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.tapAction(gesture:)))
        config(self)
    }
}
