//
//  HKPanGesture.swift
//  NiceGesture
//
//  Created by DH Add LK on 2018/5/2.
//  Copyright © 2018 12 04 DH Add LK. All rights reserved.
//

import UIKit
typealias PanGestureHandler = (UIPanGestureRecognizer) -> Void
class HKPanGesture: UIPanGestureRecognizer {
    
    var gestureAction = HKGestureAction<UIPanGestureRecognizer>()
    
    init(config: PanGestureHandler) {
        super.init(target: gestureAction, action: #selector(gestureAction.gestureAction(gesture:)))
        config(self)
    }
}
