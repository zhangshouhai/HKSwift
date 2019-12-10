//
//  HomeViewController.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import SnapKit


class HomeViewController: HKBaseViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setHideLeftBtn()
        
        self.titleLabel.text = "导航栏"
        self.navRightBtn.setTitle("done", for: .normal)
        
        
        let label = HKLabel(font: 13, color: UIColor.green, text: "zhangshouahi")
        self.view.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(20)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        AppStyleConfiguration.messageAction(label: label, changeString: "zhang", allColor:UIColor.red, markColor:UIColor.green, fontSize: 30)
        
        

    }
    
    override func left_click(_ sender: UIButton?) {
        print("返回按钮点击事件")
    }
    
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
