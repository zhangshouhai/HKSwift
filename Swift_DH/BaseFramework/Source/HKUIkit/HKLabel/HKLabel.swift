//
//  DHLabel.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import Foundation



func HKLabel(font:CGFloat,color:UIColor,text:String) -> UILabel{
    let label = UILabel()
    label.text = text
    label.textColor = color
    label.font = UIFont.systemFont(ofSize: font)
    label.textAlignment = .left
    label.lineBreakMode = .byTruncatingTail
    return label;
    
}
