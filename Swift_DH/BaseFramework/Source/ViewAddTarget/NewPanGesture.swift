//
//  NewPanGesture.swift
//  NiceGesture
//
//  Created by 周正飞 on 2018/5/2.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import UIKit
typealias PanGestureHandler = (UIPanGestureRecognizer) -> Void
class NewPanGesture: UIPanGestureRecognizer {
    
    var gestureAction = NewGestureAction<UIPanGestureRecognizer>()
    
    init(config: PanGestureHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.gestureAction(gesture:)))
        config(self)
    }
}
