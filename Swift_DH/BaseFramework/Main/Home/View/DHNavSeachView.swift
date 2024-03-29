//
//  DHNavSeachView.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation
class DHNavSeachView: HKBaseTableViewCell {

    var rightButton : UIButton?
    var navTextFiled :HKTextField?
  
    
    override func loadView() {
        
        self.backgroundColor = UIColor.colorWithHexString(colorString: HKNavBgColor)
     
        self.rightButton = HKButton(backColor: UIColor.clear, text: "", image: "home_message", isRadius: true)
//        self.rightButton?.setTitleColor(UIColor.white, for: .normal)
//        self.rightButton?.layer.cornerRadius = 25/2
//        self.rightButton?.layer.borderColor = UIColor.white.cgColor
//        self.rightButton?.layer.borderWidth = 1;
//        self.rightButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: HKNavBgColor), forState: .normal)
        
        
        self.navTextFiled = HKTextField()
        self.navTextFiled?.isUserInteractionEnabled = false
        self.navTextFiled?.createHKTextField(font: 14, text: "", placeholder: "搜索疾病、医生+城市、医院等", keyboardType: .webSearch, leftLabStr: "", leftImgStr: "seach", rightImgStr: "", showLine: false)
        
        
        self.contentView.addSubview(self.rightButton!)
        self.contentView.addSubview(self.navTextFiled!)
       
        
    }
    
    override func layoutView() {
        

        
        self.rightButton?.snp.makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
            make.height.equalTo(25)
            make.width.equalTo(40)
        })
        
        self.navTextFiled?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.rightButton!.snp_left).offset(-10)
            make.centerY.equalTo(self.rightButton!.snp_centerY)
            make.height.equalTo(30)
            make.left.equalTo(20)
        })
        
        self.navTextFiled?.layer.cornerRadius = 15;
        self.navTextFiled?.layer.masksToBounds = true
        self.navTextFiled?.backgroundColor = UIColor.white
       
    }
    

    
    

}
