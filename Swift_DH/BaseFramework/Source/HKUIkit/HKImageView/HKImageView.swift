//
//  HKImageView.swift
//  BaseFramework
//
//  Created by mac on 2019/12/10.
//  Copyright © 2019DH add LK.. All rights reserved.
//

import UIKit
import Foundation


func HKImageView(radius:CGFloat,isRadius:Bool) -> UIImageView{
    let imageview = UIImageView()
    imageview.layer.cornerRadius = radius
    imageview.layer.masksToBounds = isRadius
    imageview.contentMode = .scaleAspectFill
    return imageview;
}
