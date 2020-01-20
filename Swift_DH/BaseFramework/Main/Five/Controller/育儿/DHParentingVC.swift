//
//  DHParentingVC.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class DHParentingVC: HKBaseViewController {


   override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "育儿"
        self.navView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FFBEC1")
        setupUI()
//        self.view.bringSubview(toFront: navView!)

    }
    
    func setupUI() {
        
        let iamgeView = HKImageView(radius: 0, isRadius: false)
        self.view.addSubview(iamgeView)
        
        
        iamgeView.image = UIImage(named: "育儿")

        iamgeView.frame = CGRect(x: 0, y:kMainTopHeight - 44, width: kMainScreen_width, height:  kMainScreen_width / 750  * 1394 )
        
        iamgeView.contentMode = .scaleAspectFill
        
        let leftbutton = HKButton(backColor: UIColor.clear, text: "", image: "icon_fanhui_xiangqing", isRadius: true)
              leftbutton.frame = CGRect(x: 15, y: kMainTopHeight - 35, width: 25, height: 25)
              self.view.addSubview(leftbutton)
              leftbutton.addTapAction { (tap) in
                  self.navigationController?.popViewController(animated: true)
              }
     
    }


}


