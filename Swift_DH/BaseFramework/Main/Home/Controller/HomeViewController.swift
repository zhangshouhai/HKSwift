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
import AVFoundation



class HomeViewController: HKBaseViewController
{
    var dark = true
    
    var spectrumView = SpectrumView()
    
    var button = UIButton()


    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        AppUpdateAlert.sharedInstance.showUpdateAlert(version: "1212", description: "adfasdfasdfasgasgdasdfasdasdf", isupdata: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = "导航栏"
        self.view.theme_backgroundColor = HKThemeColor.backgroundColor
        print(HKThemeColor.backgroundColor)
        
    
        
        
    }
    
 
}

extension HomeViewController {
   
}
