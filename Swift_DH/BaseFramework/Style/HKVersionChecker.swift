//
//  HKVersionChecker.swift
//  BaseFramework
//
//  Created by mac on 2020/3/24.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HKVersionChecker:NSObject {
    
   public class func checkUpdateForAppID() {
        let path = "https://itunes.apple.com/cn/lookup?id="+"\(APPID)"
        
        var releaseNotes:String = ""
        var trackViewUrl:String = ""
        var version:String = ""
        let thisVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)
        
        Alamofire.request(path, method: .post).response { (responseObj) in
            if responseObj.error == nil {
                let dic:Dictionary = try! JSONSerialization.jsonObject(with: responseObj.data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,Any>
                if  dic["resultCount"] as! Int > 0 {
                    let results:Array = dic["results"] as! Array<Any>
                    if results.count > 0 {
                        let resultsDic:Dictionary = results.first as! Dictionary<String,Any>
                        version = resultsDic["version"] as! String
                        if thisVersion == version {
                  
                            SVProgressHUD.showSuccess(withStatus: "当前已经是最新版本")
                            
                            return
                        }
                        // 本次版本更新的内容
                        releaseNotes = resultsDic["releaseNotes"] as! String
                        // 在APP Store中的链接
                        trackViewUrl = resultsDic["trackViewUrl"] as! String
                        
                        self.showAlartController(version: version, releaseNotes: releaseNotes)
                        
                        
                    }
                }
                
                else
                {
                    SVProgressHUD.showError(withStatus: "未检测到应用版本信息")
                }
            }
        }
    }
    
    
    
   public class func showAlartController(version:String, releaseNotes:String)
    {
        
        let message :String = "最新版本:V\(version)"+"\n【更新内容】:\n\(releaseNotes)" + "是否前往更新?"
        
        let alertController = UIAlertController(title: "版本更新",
                                   message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "前往更新", style: .default, handler: { action in
            self.openAppStore()
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        let VC :UIViewController = AppStyleConfiguration.getCurrentVC1()!
        VC.present(alertController, animated: true, completion: nil)
        
        
    }

   public class func openAppStore() {
        if let URL = NSURL(string: "https://itunes.apple.com/us/app/id\(APPID)?ls=1&mt=8") {
            UIApplication.shared.openURL(URL as URL)
        }
    }
    
    
}
