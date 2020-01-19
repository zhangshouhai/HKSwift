//
//  FiveController.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class FiveController: BaseTableViewController {


     override func viewDidLoad() {
           super.viewDidLoad()

           setupUI()
       }
       
       func setupUI() {
           tableView.snp.makeConstraints { (make) in
               make.left.right.equalTo(0);
               make.top.equalTo(kMainTopHeight)
               make.bottom.equalTo(0);
           }
         
           Cell<DHHealthManagementView>.registerClass(tableView)
       }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}


extension FiveController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        } else {
            return 5
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = Cell<DHHealthManagementView>.tableView(tableView)

        cell.loadDataHealthHomeCell(titleString: "")

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

