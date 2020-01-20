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
        
        self.titleLabel.text = "健康管理"
        self.setHideLeftBtn()
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
            return 0.01
        } else {
            return 5
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = Cell<DHHealthManagementView>.tableView(tableView)

        
        if indexPath.row == 0 {
            cell.loadDataHealthHomeCell(titleString: "")
        }
        if indexPath.row == 1 {
            cell.loadDataHealthHomeCell1(titleString: "")
        }
        if indexPath.row == 2 {
            cell.loadDataHealthHomeCell2(titleString: "")
        }
        if indexPath.row == 3 {
            cell.loadDataHealthHomeCell3(titleString: "")
        }
        
        
        cell.titleButton?.addTapAction({ (tap) in

            self.pustParentingvc(indexpath: indexPath)
        })

        return cell
    }
    
    func pustParentingvc(indexpath:IndexPath) -> Void {
        
        if indexpath.row == 0 {
            let parentingVC = DHParentingVC()
            self.navigationController?.pushViewController(parentingVC, animated: true)
        }
        
                
        if indexpath.row == 1 {
            let vc = DHMaternalHealthViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.pustParentingvc(indexpath: indexPath)
    }
    
}

