//
//  NewGestureAction.swift
//  NiceGesture
//
//  Created by 周正飞 on 2018/4/27.
//  Copyright © 2018年 周正飞. All rights reserved.
//

import UIKit
class NewGestureAction<T: UIGestureRecognizer> {
    typealias NewGestureHandler = (_ gestureRecognizer: T) -> Void

    var beginHandler: NewGestureHandler?
    var cancelledHandler: NewGestureHandler?
    var changeHandler: NewGestureHandler?
    var endedHandler: NewGestureHandler?
    var failedHandler: NewGestureHandler?
    
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
    
    func whenBegan(handler: @escaping NewGestureHandler) -> NewGestureAction<T> {
        beginHandler = handler
        return self
    }
    
    func whenCancelled(handler: @escaping NewGestureHandler) -> NewGestureAction<T> {
        cancelledHandler = handler
        return self
    }
    
    func whenChanged(handler: @escaping NewGestureHandler) -> NewGestureAction<T> {
        changeHandler = handler
        return self
    }
    
    func whenEnded(handler: @escaping NewGestureHandler) -> NewGestureAction<T> {
        endedHandler = handler
        return self
    }
    func whenFailed(handler: @escaping NewGestureHandler) -> NewGestureAction<T> {
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
