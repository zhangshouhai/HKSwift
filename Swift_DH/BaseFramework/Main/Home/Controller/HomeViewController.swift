//
//  HomeViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import SnapKit


class HomeViewController: HKBaseViewController {

    
    //导航栏标题
    lazy var navSeacheView:DHNavSeachView = {
        let navView = DHNavSeachView()
        return navView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.titleLabel.text = "导航栏"
        self.navView?.isHidden = true
        
        self.view.addSubview(navSeacheView)
        navSeacheView.frame = CGRect(x: 0, y: 0, width: kMainScreen_width, height: kMainTopHeight)
 
        


    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
