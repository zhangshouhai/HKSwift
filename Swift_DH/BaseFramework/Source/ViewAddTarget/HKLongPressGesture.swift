//
//  HKLongPressGesture.swift
//  NiceGesture
//
//  Created by DH Add LK on 2018/5/2.
//  Copyright © 2018 12 04 DH Add LK. All rights reserved.
//

import UIKit
typealias HKLongpressHandler = (UILongPressGestureRecognizer) -> Void
class HKLongPressGesture: UILongPressGestureRecognizer {
    
    var gestureAction = HKGestureAction<UILongPressGestureRecognizer>()
    
    init(config: HKLongpressHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.gestureAction(gesture:)))
        config(self)

    }
    
}
