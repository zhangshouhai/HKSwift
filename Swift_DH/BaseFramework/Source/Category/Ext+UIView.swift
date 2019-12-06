//
//  Ext+UIView.swift
//  BaseFramework
//
//  Created by DH add LK on 2018/7/26.
//  Copyright © 2018 12 04 DH add LK. All rights reserved.
//

import UIKit

public extension UIView {
    
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
    
    var centerX: CGFloat {
        get{
            return self.center.x
        }set{
            self.centerX = newValue
        }
    }
    
    var centerY: CGFloat {
        get {
            return self.center.y
        }
        set {
            self.centerY = newValue
        }
    }
}
