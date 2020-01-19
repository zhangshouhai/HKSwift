//
//  SecondViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

class SecondViewController: HKBaseViewController {

    private var currentDateCom: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())
    
    
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

        label.addTapAction { (tap) in
            print(HKTool.shardTool.userModel().userName!)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

