//
//  HKTool.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/12.
//  Copyright © 2019 HK. All rights reserved.
//

import Foundation
import HandyJSON

class HKTool :NSObject {
   
    //创建一个私有的静态变量
    private static let hkTool = HKTool();
    class var shardTool: HKTool {
        return hkTool;
    }
    //使用单例
    func userModel() -> UserModel {

        
        
        let dic = MyControl.getObjectForKey(HKUserKey as String)
               
        if dic == nil {
            return UserModel()
        }
        else{
                   
            let dic1 :NSDictionary = MyControl.getObjectForKey(HKUserKey as String) as! NSDictionary
            let userModel = UserModel.deserialize(from: dic1)
            return userModel!
        }
        
        
      
      
    }
    
    //使用单例
    func islogin() -> Bool {

//        let dic :NSDictionary = MyControl.getObjectForKey(HKUserKey as String) as! NSDictionary
        
        let dic = MyControl.getObjectForKey(HKUserKey as String)
        
        if dic == nil {
             return false
        }
        else{
            
            let dic1 :NSDictionary = MyControl.getObjectForKey(HKUserKey as String) as! NSDictionary
            let userModel = UserModel.deserialize(from: dic1)
            if userModel?.userid?.count == 0 {
                return false
            }
            else
            {
                return true
            }
        }

    }
    
    
    
}
