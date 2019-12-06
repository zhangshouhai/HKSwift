//
//  HKTapGesture.swift
//  NiceGesture
//
//  Created by DH Add LK on 2018/4/27.
//  Copyright © 2018 12 04 DH Add LK. All rights reserved.
//

import UIKit
typealias TapGestureHandler = (UITapGestureRecognizer) -> Void

class HKTapGesture: UITapGestureRecognizer {
    var gestureAction = HKGestureAction<UITapGestureRecognizer>()
    
    init(handler: @escaping TapGestureHandler) {
        gestureAction.endedHandler = handler
        super.init(target: gestureAction, action: #selector(gestureAction.tapAction(gesture:)))
    }
    init(config: @escaping TapGestureHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.tapAction(gesture:)))
        config(self)
    }
}
