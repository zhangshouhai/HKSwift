//
//  MyControl.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/12.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import Foundation
import UIKit

class MyControl {
    
    /*
    添加本地缓存
    */
    public class func setObject(_ object: Any?, key: String?) {
        if object != nil {
            UserDefaults.standard.set(object, forKey: key ?? "")
            UserDefaults.standard.synchronize()
        }

    }
    
    
    /*
    获取本地缓存
    */
    public class func getObjectForKey(_ key: String?) -> Any? {
        if UserDefaults.standard.object(forKey: key ?? "") != nil {
            return UserDefaults.standard.object(forKey: key ?? "")
        } else {
            return nil
        }
    }
    
    /*
    移除本地缓存
    */
    public class func removeObject(forKey key: String?) {
        if UserDefaults.standard.object(forKey: key ?? "") != nil {
            return UserDefaults.standard.removeObject(forKey: key ?? "")
        }
    }


}
