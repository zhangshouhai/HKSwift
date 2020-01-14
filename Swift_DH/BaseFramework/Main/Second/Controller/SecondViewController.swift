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
            
            
            
            let addressPicker = EWAddressViewController()
                 /*** 可使用这种init方法自定制选中颜色,不填写selectColor默认颜色为UIColor(red: 79/255, green: 176/255, blue: 255/255, alpha: 1),蓝色
                 let addressPicker = EWAddressViewController(selectColor: UIColor.yellow)
                  */
                 // 返回选择数据,地址,省,市,区
                 addressPicker.backLocationStringController = { (address,province,city,area) in
                     label.text = address
                 }
                 self.present(addressPicker, animated: true, completion: nil)
            
            
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

