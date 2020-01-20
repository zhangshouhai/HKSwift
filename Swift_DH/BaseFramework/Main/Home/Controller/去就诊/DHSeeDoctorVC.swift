//
//  DHSeeDoctorVC.swift
//  BaseFramework
//
//  Created by mac on 2020/1/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit


class HKSeeDortorVC: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "健康淄博人"
        
        setupUI()
        self.view.bringSubview(toFront: navView!)
    }
    
    func setupUI() {
        
        let iamgeView = HKImageView(radius: 0, isRadius: false)
        self.view.addSubview(iamgeView)
        
        
        iamgeView.image = UIImage(named: "去就诊")

        iamgeView.frame = CGRect(x: 0, y:kMainTopHeight - 44, width: kMainScreen_width, height:  kMainScreen_width / 750  * 1334 )
        
        iamgeView.contentMode = .scaleAspectFill
     
    }



}
