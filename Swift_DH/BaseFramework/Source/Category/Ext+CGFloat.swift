//
//  Ext+CGFloat.swift
//  BaseFramework
//
//  Created by DH add LK on 2018/8/9.
//  Copyright © 2018 12 04 DH add LK. All rights reserved.
//

import UIKit

public extension CGFloat {

    /// EZSE: Returns a random floating point number between 0.0 and 1.0, inclusive.
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    /// EZSE: Returns a random floating point number in the range min...max, inclusive.
    static func random(within: Range<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }
    
    /// EZSE: Returns a random floating point number in the range min...max, inclusive.
    static func random(within: ClosedRange<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }
    
}
