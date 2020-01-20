//
//  HKLookDoctorVC.swift
//  BaseFramework
//
//  Created by mac on 2020/1/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit



class HKLookDortorVC: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "众阳健康互联网医院"
        
        setupUI()
        self.view.bringSubview(toFront: navView!)
    }
    
    func setupUI() {
        
        let iamgeView = HKImageView(radius: 0, isRadius: false)
        self.view.addSubview(iamgeView)
        
        
        iamgeView.image = UIImage(named: "找医生-1")

        iamgeView.frame = CGRect(x: 0, y:kMainTopHeight - 44, width: kMainScreen_width, height:  kMainScreen_width / 750  * 1920 )
        
        iamgeView.contentMode = .scaleAspectFill
     
    }



}




