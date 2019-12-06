//
//  HKGestureAction.swift
//  NiceGesture
//
//  Created by DH Add LK on 2018/4/27.
//  Copyright © 2018 12 04 DH Add LK. All rights reserved.
//

import UIKit
class HKGestureAction<T: UIGestureRecognizer> {
    typealias HKGestureHandler = (_ gestureRecognizer: T) -> Void

    var beginHandler: HKGestureHandler?
    var cancelledHandler: HKGestureHandler?
    var changeHandler: HKGestureHandler?
    var endedHandler: HKGestureHandler?
    var failedHandler: HKGestureHandler?
    
    @objc func gestureAction(gesture: UIGestureRecognizer) {
        switch gesture.state {
        case .began:
            beginHandler?(gesture as! T)
        case .cancelled:
            cancelledHandler?(gesture as! T)
        case .changed:
            changeHandler?(gesture as! T)
        case .ended:
            endedHandler?(gesture as! T)
        case .failed:
            failedHandler?(gesture as! T)
        case .possible:
            break
        }
    }
    
    func whenBegan(handler: @escaping HKGestureHandler) -> HKGestureAction<T> {
        beginHandler = handler
        return self
    }
    
    func whenCancelled(handler: @escaping HKGestureHandler) -> HKGestureAction<T> {
        cancelledHandler = handler
        return self
    }
    
    func whenChanged(handler: @escaping HKGestureHandler) -> HKGestureAction<T> {
        changeHandler = handler
        return self
    }
    
    func whenEnded(handler: @escaping HKGestureHandler) -> HKGestureAction<T> {
        endedHandler = handler
        return self
    }
    func whenFailed(handler: @escaping HKGestureHandler) -> HKGestureAction<T> {
        failedHandler = handler
        return self
    }
    
  
    
    /// Tap手势用
    func whenTaped(handler: @escaping TapGestureHandler) {
        endedHandler = handler as! (T) -> Void
    }
    
    @objc func tapAction(gesture: UITapGestureRecognizer) {
        if T.self is UITapGestureRecognizer.Type {
            (endedHandler as! ((UITapGestureRecognizer) -> Void))(gesture)
        }
    }
}
