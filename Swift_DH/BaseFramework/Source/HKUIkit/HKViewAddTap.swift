//
//  HKViewAddTap.swift
//  BaseFramework
//
//  Created by mac on 2019/12/9.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import UIKit


var blockActionDict: [String : (() -> ())] = [:]

extension UIView {
    private func whenTouch(NumberOfTouche touchNumbers: Int,NumberOfTaps tapNumbers: Int) -> Void {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.numberOfTouchesRequired = touchNumbers
        tapGesture.numberOfTapsRequired = tapNumbers
        tapGesture .addTarget(self, action: Selector("tapActions"))
        self.addGestureRecognizer(tapGesture)
    }
    
    func whenTapped(action :@escaping (() -> Void)) {
        // 手势-一次点击
        _addBlock(NewAction: action)
        whenTouch(NumberOfTouche: 1, NumberOfTaps: 1)
    }

    
    func tapActions() {
        // 执行action
        _excuteCurrentBlock()
    }


    private func _addBlock(NewAction newAction:@escaping ()->()) {
        let tempKey = NSValue(nonretainedObject: self)
        let key = String(format: "%@", tempKey)
        blockActionDict[key] = newAction
    }

    private func _excuteCurrentBlock(){
         let tempKey = NSValue(nonretainedObject: self)
        let key = String(format: "%@", tempKey)
        let block = blockActionDict[key]
        block!()
    }

}


/*



private var kActionHandlerTapBlockKey = 0
private var kActionHandlerTapGestureKey = 0
private var kActionHandlerLongPressBlockKey = 0
private var kActionHandlerLongPressGestureKey = 0

extension UIView {
    
    typealias GestureActionBlock = (UIGestureRecognizer?) -> Void

    func addTapAction(with block: GestureActionBlock) {
        var gesture = objc_getAssociatedObject(self, &kActionHandlerTapGestureKey)
        if gesture == nil {
            gesture = UITapGestureRecognizer(target: self, action: #selector(handleAction(forTapGesture:)))
            if let gesture = gesture {
                addGestureRecognizer(gesture as! UIGestureRecognizer)
            }
            objc_setAssociatedObject(self, &kActionHandlerTapGestureKey, gesture, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
        objc_setAssociatedObject(self, &kActionHandlerTapBlockKey, GestureActionBlock.self, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
    }

    @objc func handleAction(forTapGesture gesture: UITapGestureRecognizer?) {
        if gesture?.state == .recognized {
            let block = objc_getAssociatedObject(self, &kActionHandlerTapBlockKey)
            if block != nil {
                
                (Any).self; block
               
            }
        }
    }

//    func addLongPressAction(with block: GestureActionBlock) {
//        var gesture = objc_getAssociatedObject(self, &kActionHandlerLongPressGestureKey)
//        if gesture == nil {
//            gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleAction(forLongPressGesture:)))
//            if let gesture = gesture {
//                addGestureRecognizer(gesture as! UIGestureRecognizer)
//            }
//            objc_setAssociatedObject(self, &kActionHandlerLongPressGestureKey, gesture, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
//        }
//        objc_setAssociatedObject(self, &kActionHandlerLongPressBlockKey, GestureActionBlock.self, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY)
//    }
//
//    @objc func handleAction(forLongPressGesture gesture: UITapGestureRecognizer?) {
//        if gesture?.state == .recognized {
//            let block = objc_getAssociatedObject(self, &kActionHandlerLongPressBlockKey)
//            if block != nil {
//                block(gesture)
//            }
//        }
//    }

}

 */
