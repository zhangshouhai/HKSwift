//
//  HKProgressHUD.swift
//  BaseFramework
//
//  Created by LukeCao on 2019/12/5.
//  Copyright © 2019 DH and LK. All rights reserved.
//

import UIKit

enum HUDType {
    case success
    case error
    case loading
    case info
    case progress
}

class HKProgressHUD: NSObject {
    
    
    class func initHKProgressHUD() {
        SVProgressHUD.setFont(UIFont.systemFont(ofSize: 14.0))
        SVProgressHUD.setBackgroundColor(UIColor.colorWithHexString(colorString: "#3D3D3D", 0.3))
        SVProgressHUD.setDefaultMaskType(.clear)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
    }
    
    class func showSuccess(_ status: String) {
        initHKProgressHUD()
        self.showHKProgressHUD(type: .success, status: status)
    }
    class func showError(_ status: String) {
        initHKProgressHUD()
        self.showHKProgressHUD(type: .error, status: status)
    }
    class func showLoading(_ status: String) {
        initHKProgressHUD()
        self.showHKProgressHUD(type: .loading, status: status)
    }
    class func showInfo(_ status: String) {
        self.showHKProgressHUD(type: .info, status: status)
    }
    class func showProgress(_ status: String, _ progress: CGFloat) {
        self.showHKProgressHUD(type: .success, status: status, progress: progress)
    }
    class func dismissHUD(_ delay: TimeInterval = 0) {
        SVProgressHUD.dismiss(withDelay: delay)
    }
}


extension HKProgressHUD {
    class func showHKProgressHUD(type: HUDType, status: String, progress: CGFloat = 0) {
        switch type {
        case .success:
            SVProgressHUD.showSuccess(withStatus: status)
        case .error:
            SVProgressHUD.showError(withStatus: status)
        case .loading:
            if status == "" {
                SVProgressHUD.show()
            }else {
                SVProgressHUD.show(withStatus: status)
            }
            
        case .info:
            SVProgressHUD.showInfo(withStatus: status)
        case .progress:
            SVProgressHUD.showProgress(Float(progress), status: status)
        }
    }
}
