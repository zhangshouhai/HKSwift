//
//  Ext+UIButton.swift
//  BaseFramework
//
//  Created by DH add LK on 2018/8/9.
//  Copyright © 2018 12 04 DH add LK. All rights reserved.
//

import UIKit

public extension UIButton {

    func setBackgroundColor(_ color: UIColor, forState: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.setBackgroundImage(colorImage, for: forState)
    }

}
