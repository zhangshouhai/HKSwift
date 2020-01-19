//
//  HKButton+EdgeInsetsStyle.swift
//  BaseFramework
//
//  Created by mac on 2020/1/16.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

extension UIButton {
    
    enum HKButtonEdgeInsetsStyle {
        case ImageTop //图片在上，
        case ImageLeft //图片在左，
        case ImageBottom //图片在下，
        case ImageRight //图片在右，
    }
    

/**
 ># Important:按钮图文位置设置
 知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
 *  如果只有title，那它上下左右都是相对于button的，image也是一样；
 *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
 */
func HKLayoutButtonEdgInsetStyle(_ style: HKButtonEdgeInsetsStyle,_ space:CGFloat){
    guard let titleL = self.titleLabel, let imageV = self.imageView else {
        return
    }
    
    let imageWidth = imageV.frame.size.width
    let imageHeight = imageV.frame.size.height
    
    let labelWidth = titleL.frame.size.width
    let labelHeight = titleL.frame.size.height
    
    let imageX = imageV.frame.origin.x
    let labelX = titleL.frame.origin.x
    
    let margin = labelX - imageX - imageWidth
    
    var imageInsets = UIEdgeInsets.zero
    var labelInsets = UIEdgeInsets.zero
    
    /**
     *  titleEdgeInsets是title相对于其上下左右的inset
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    switch style {
    case .ImageTop:
        imageInsets = UIEdgeInsets(top: -0.5 * labelHeight, left: 0.5 * labelWidth + 0.5 * margin + imageX, bottom: 0.5 * (labelHeight + space), right: 0.5 * (labelWidth - margin))
        labelInsets = UIEdgeInsets(top: 0.5 * (imageHeight + space), left: -(imageWidth - 5), bottom: -0.5 * imageHeight, right: 5)
        
    case .ImageBottom:
        imageInsets = UIEdgeInsets(top: 0.5 * (labelHeight + space), left: 0.5 * labelWidth + imageX, bottom: -0.5 * labelHeight, right: 0.5 * labelWidth)
        labelInsets = UIEdgeInsets(top: -0.5 * imageHeight, left: -(imageWidth - 5), bottom:0.5 * (imageHeight + space), right: 5)
        
    case .ImageRight:
        imageInsets = UIEdgeInsets(top: 0, left: 0.5 * (labelWidth + space), bottom: 0, right: -(labelWidth + 0.5 * space))
        labelInsets = UIEdgeInsets(top: 0, left: -(imageWidth + 0.5 * space), bottom: 0, right: imageWidth + space * 0.5)
        
    default:
        imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0.5 * space)
        labelInsets = UIEdgeInsets(top: 0, left: 0.5 * space, bottom: 0, right: 0)
    }
    
        self.titleEdgeInsets = labelInsets;
        self.imageEdgeInsets = imageInsets;
    
    }

}
