//
//  HKBaseTableView.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

import UIKit

extension UITableView {
    var backgroundImgStr: String? {
        get {
            return (objc_getAssociatedObject(self, "key") as? String)
        }
        set(newValue) {
            objc_setAssociatedObject(self, "key", newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
}
