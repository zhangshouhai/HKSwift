//
//  DHButton.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import Foundation


func HKButton(backColor:UIColor,text:String,image:String,isRadius:Bool) -> UIButton{
    let button = UIButton()
    button.backgroundColor = backColor
    button.setTitle(text, for: .normal)
    button.setTitleColor(UIColor.black, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    if isRadius {
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
    }
    if  image.count > 0  {
        button.setTitle(text, for: .normal)
        button.setImage(UIImage(named: image), for: .normal)
    }
    return button;
}
