//
//  DHLabel.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import Foundation



func HKLabel(font:UIFont,color:UIColor,text:String) -> UILabel{
    let label = UILabel()
    label.text = text
    label.textColor = color
    label.font = font
    label.textAlignment = .left
    label.lineBreakMode = .byTruncatingTail
    label.isUserInteractionEnabled = true
    return label;
    
}
/***
 字体加粗
 */
func HKFontBoldSystem(label:UILabel,font:UIFont) -> Void{
   
    let fontSize : CGFloat = font.pointSize
    label.font = UIFont.boldSystemFont(ofSize: fontSize)
   
}

/***
 字体 不加粗
 */
func HKFontSystem(label:UILabel,font:UIFont) -> Void{
   
    label.font = font
   
}
