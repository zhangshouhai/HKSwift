//
//  HKTextField.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/10.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import Foundation

class HKTextField: HKBaseView,UITextFieldDelegate {
    
    open var textfield = UITextField()
    open var rightImgView = UIImageView()
    
    public func createHKTextField(font:CGFloat,text:String,placeholder:String,keyboardType:UIKeyboardType,leftLabStr:String, leftImgStr:String, rightImgStr:String ,showLine:Bool) -> (){
        
        textfield = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        textfield.borderStyle = UITextField.BorderStyle.none
        textfield.placeholder = placeholder
        textfield.adjustsFontSizeToFitWidth = true
        textfield.textAlignment = .left
        textfield.contentVerticalAlignment = .center
        textfield.clearButtonMode = .whileEditing
        textfield.keyboardType = keyboardType
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.font = UIFont.systemFont(ofSize: font)
        textfield.text = text
        textfield.delegate = self
        
        self.addSubview(textfield)
        
    
        textfield.snp.makeConstraints { (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-HKFixWidthFlaot(10))
            make.top.equalToSuperview().offset(HKFixHeightFlaot(5))
        }

        if leftLabStr.count > 0  {
            let label = HKLabel(font: fontSize14, color: UIColor.gray, text: leftLabStr)
            self.addSubview(label)
            let labWidth = AppStyleConfiguration.labelWidth(leftLabStr, CGFloat.greatestFiniteMagnitude)
            label.snp.makeConstraints { (make) in
                make.left.equalTo(HKFixWidthFlaot(10))
                make.centerY.equalToSuperview()
                make.width.equalTo(labWidth)
            }
           textfield.snp_remakeConstraints { (make) in
                make.left.equalTo(label.snp_right).offset(HKFixWidthFlaot(5))
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-HKFixWidthFlaot(10))
                make.top.equalToSuperview().offset(HKFixHeightFlaot(5))
            }
        }
        
        if leftImgStr.count > 0 {
            let leftImgView = HKImageView(radius: 0.0, isRadius: true)
            leftImgView.image = UIImage.init(named: leftImgStr)
            leftImgView.width = (leftImgView.image?.size.width)!+20
            leftImgView.contentMode = UIView.ContentMode.center
            self.addSubview(leftImgView)
            
            leftImgView.snp.makeConstraints { (make) in
                make.left.equalTo(HKFixWidthFlaot(0))
                make.centerY.equalToSuperview()
                make.width.height.equalTo(30)
            }
            
            textfield.snp_remakeConstraints { (make) in
                make.left.equalTo(leftImgView.snp_right).offset(HKFixWidthFlaot(5))
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-HKFixWidthFlaot(10))
                make.top.equalToSuperview().offset(HKFixHeightFlaot(5))
            }
        }
        
        if rightImgStr.count > 0 {
            rightImgView = HKImageView(radius: 0.0, isRadius: true)
            rightImgView.image = UIImage.init(named: rightImgStr)
            rightImgView.width = (rightImgView.image?.size.width)!+20
            rightImgView.contentMode = UIView.ContentMode.center
            textfield.rightView = rightImgView
            
           textfield.snp_remakeConstraints { (make) in
                make.left.equalToSuperview().offset(HKFixWidthFlaot(10))
                make.centerY.equalToSuperview()
                make.right.equalToSuperview().offset(-HKFixWidthFlaot(10))
                make.top.equalToSuperview().offset(HKFixHeightFlaot(5))
            }
        }
        
        if showLine {
            let lineView = HKBaseView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            lineView.backgroundColor = UIColor.colorWithHexString(colorString: "#D5D5D5")
            self.addSubview(lineView)
            lineView.snp.makeConstraints { (make) in
                make.left.right.bottom.equalToSuperview()
                make.height.equalTo(HKFixHeightFlaot(1))
            }
            
        }
        
    }
    
}


