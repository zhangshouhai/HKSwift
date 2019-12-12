//
//  SecondViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

class SecondViewController: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
                let label = HKLabel(font: 13, color: UIColor.green, text: "zhangshouahi")
                self.view.addSubview(label)
                label.snp.makeConstraints { (make) in
                    make.top.equalTo(100)
                    make.left.equalTo(20)
                    make.height.equalTo(30)
                    make.width.equalTo(100)
                }
        label.isUserInteractionEnabled = true

        label.addTapAction { (tap) in
//            print("zhangksdjkjfksdjflsldkdflds")
//
//            let vc = SecondPushView()
//            self.navigationController?.pushViewController(vc, animated: true)
            
            
            print(HKTool.shardTool.userModel().userName!)
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

