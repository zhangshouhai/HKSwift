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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "导航栏"

        let dic = [
            "authToken":"45bfd868ade83402db4350fa144d6eedc6e00bb4",
            "id" : 46,
            "sip-name" : "2847",
            "username" : "Luke",
            "email" : "lukai@gstdev.com",
            "sip-caller-name" : "Luke",
            "sip-password" : "123456"
            ] as [String : Any]
        
       
    let json = AppStyleConfiguration.DataAnyToJson(element: dic)

    let model = JSONDeserializer<HKUserModell>.deserializeFrom(json:json)



        
 
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
   
    

}
