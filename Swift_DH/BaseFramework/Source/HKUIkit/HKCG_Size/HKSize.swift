//
//  HKSize.swift
//  BaseFramework
//
//  Created by mac on 2020/4/9.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit



/**
 CGSize
*/
func HKSize(width:CGFloat,hight:CGFloat) ->CGSize{
    
    let size = CGSize(width: width, height: hight)
    return size
}

/**
 HKRect
*/
func HKRect(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) ->CGRect{
    
    let size = CGRect(x: x, y: y, width: width, height: height)
    return size
}

/**
 HKPoint
*/
func HKPoint(x: CGFloat, y: CGFloat) ->CGPoint{
    
    let size = CGPoint(x: x, y: y)
    return size
}
