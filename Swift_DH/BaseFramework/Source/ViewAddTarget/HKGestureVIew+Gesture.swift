//
//  UIVIew+Gesture.swift
//  NiceGesture
//
//  Created by DH Add LK on 2018/4/27.
//  Copyright © 2018 12 04 DH Add LK. All rights reserved.
//

import UIKit


extension UIView {
    /// Tap
    func newTapGesture(config: @escaping (UITapGestureRecognizer) -> Void) -> HKGestureAction<UITapGestureRecognizer> {
        let tap = HKTapGesture(config: config)
        
        addGestureRecognizer(tap)
        return tap.gestureAction
    }
    
    func whenTap(handler: @escaping TapGestureHandler) {
        let tap = HKTapGesture(handler: handler)
        addGestureRecognizer(tap)
    }
    
    /// Pan
    func newPanGesture(config: @escaping (UIPanGestureRecognizer) -> Void = {_ in }) -> HKGestureAction<UIPanGestureRecognizer> {
        let pan = HKPanGesture(config: config)
        addGestureRecognizer(pan)
        return pan.gestureAction
    }
    
    /// Longpress
    func newLongpressGesture(config: @escaping (UILongPressGestureRecognizer) -> Void = {_ in}) -> HKGestureAction<UILongPressGestureRecognizer> {
        let longPress = HKLongPressGesture(config: config)
        addGestureRecognizer(longPress)
        return longPress.gestureAction
    }

}






