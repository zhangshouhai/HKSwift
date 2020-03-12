//
//  HomeViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//


import UIKit
import SnapKit
import HandyJSON





class HomeViewController: HKBaseViewController
{
    var dark = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "导航栏"
        self.view.theme_backgroundColor = HKThemeColor.backgroundColor
        print(HKThemeColor.backgroundColor)

//    let dic = [
//        "authToken":"45bfd868ade83402db4350fa144d6eedc6e00bb4",
//        "id" : 46,
//        "sip-name" : "2847",
//        "username" : "Luke",
//        "email" : "lukai@gstdev.com",
//        "sip-caller-name" : "Luke",
//        "sip-password" : "123456"
//        ] as [String : Any]
//
       
//    let json = AppStyleConfiguration.DataAnyToJson(element: dic)
//
//    let model = JSONDeserializer<HKUserModell>.deserializeFrom(json:json)

        let label = HKLabel(font: fontSize14, color: UIColor.black, text: "darkStyleColor")
        label.theme_textColor = HKThemeColor.textColor
        
        self.view.addSubview(label)
        label.snp.makeConstraints { (make ) in
            make.left.equalTo(20)
            make.centerY.equalTo(self.view.centerY)
            make.height.equalTo(20)
            make.width.equalTo(200)
        }
        
        label.isUserInteractionEnabled = true
        label.addTapAction { (tap) in
            
            self.dark = !self.dark
            HKThemes.switchNight(isToNight: self.dark)
        }
        

        
 
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
   
    

}
