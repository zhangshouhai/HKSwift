//
//  ThreeViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

class ThreeViewController: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
        HKProgressHUD.showLoading("")
        HKHttpManager.manager.requestJSONData(target: HKAPIManager.logout, successClosure: { (json) in
            
//             HKProgressHUD.dismissHUD()
//            print("success" ,json)
            HKProgressHUD.showSuccess("请求成功")
            
            
        }) { (error) in
//            HKProgressHUD.dismissHUD()
            print("er" , error as Any)
        }
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

