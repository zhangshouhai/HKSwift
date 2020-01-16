//
//  SecondPushView.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/9.
//  Copyright © 2019DH add LK.. All rights reserved.
//

import Foundation

class SecondPushView: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
                let label = HKLabel(font: fontSize13, color: UIColor.green, text: "zhangshouahi")
                self.view.addSubview(label)
                label.snp.makeConstraints { (make) in
                    make.top.equalTo(100)
                    make.left.equalTo(20)
                    make.height.equalTo(30)
                    make.width.equalTo(100)
                }
        label.isUserInteractionEnabled = true
//        label.addTapAction { (tap ) in
//            print("cheshisnds")
//        }
        label.addTapAction { (tap) in
            print("zhangksdjkjfksdjflsldkdflds")
        }
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

