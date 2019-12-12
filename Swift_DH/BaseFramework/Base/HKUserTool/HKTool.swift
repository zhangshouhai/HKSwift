//
//  HKTool.swift
//  BaseFramework
//
//  Created by mac on 2019/12/12.
//  Copyright © 2019 贾则栋. All rights reserved.
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

        let dic :NSDictionary = MyControl.getObjectForKey(HKUserKey as String) as! NSDictionary
        let userModel = UserModel.deserialize(from: dic)
        return userModel!
    }
}
