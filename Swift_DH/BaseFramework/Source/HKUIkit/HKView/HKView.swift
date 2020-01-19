//
//  HKView.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

func HKView(BackGroundColor:UIColor,BackGroundImgStr:String) -> UIView{
    let temp = UIView()
    if BackGroundImgStr.count > 0 {
        temp.backgroundColor = UIColor.init(patternImage: UIImage(named: BackGroundImgStr)!)
    } else {
        temp.backgroundColor = BackGroundColor
    }
    return temp;
}
