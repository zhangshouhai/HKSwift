//
//  NewLongPressGesture.swift
//  NiceGesture
//
//  Created by 周正飞 on 2018/5/2.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import UIKit
typealias NewLongpressHandler = (UILongPressGestureRecognizer) -> Void
class NewLongPressGesture: UILongPressGestureRecognizer {
    
    var gestureAction = NewGestureAction<UILongPressGestureRecognizer>()
    
    init(config: NewLongpressHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.gestureAction(gesture:)))
        config(self)

    }
    
}
