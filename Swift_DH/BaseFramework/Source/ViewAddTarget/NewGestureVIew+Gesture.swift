//
//  UIVIew+Gesture.swift
//  NiceGesture
//
//  Created by 周正飞 on 2018/4/27.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import UIKit


extension UIView {
    /// Tap
    func newTapGesture(config: @escaping (UITapGestureRecognizer) -> Void) -> NewGestureAction<UITapGestureRecognizer> {
        let tap = NewTapGesture(config: config)
        
        addGestureRecognizer(tap)
        return tap.gestureAction
    }
    
    func whenTap(handler: @escaping TapGestureHandler) {
        let tap = NewTapGesture(handler: handler)
        addGestureRecognizer(tap)
    }
    
    /// Pan
    func newPanGesture(config: @escaping (UIPanGestureRecognizer) -> Void = {_ in }) -> NewGestureAction<UIPanGestureRecognizer> {
        let pan = NewPanGesture(config: config)
        addGestureRecognizer(pan)
        return pan.gestureAction
    }
    
    /// Longpress
    func newLongpressGesture(config: @escaping (UILongPressGestureRecognizer) -> Void = {_ in}) -> NewGestureAction<UILongPressGestureRecognizer> {
        let longPress = NewLongPressGesture(config: config)
        addGestureRecognizer(longPress)
        return longPress.gestureAction
    }

}






