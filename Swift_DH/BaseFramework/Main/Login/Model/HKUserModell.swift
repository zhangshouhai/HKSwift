//
//  HKUserModel.swift
//  BaseFramework
//
//  Created by mac on 2020/3/11.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit
import HandyJSON

class HKUserModell: BaseModel {
    
    var id: Int?
    var email: String?
    var sipCallerName: String?
    var username: String?
    var sipPassword: String?
    var sipName: String?
    var authToken: String?
    
    
   override func mapping(mapper: HelpingMapper) {
         mapper <<<
             sipCallerName <-- "sip-caller-name"
        mapper <<<
            sipName <-- "sip-caller-name"
        mapper <<<
            authToken <-- "sip-caller-name"

     }
      
  
    
}
