//
//  HKBaseTableViewController.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2020/1/10.
//  Copyright © 2019 DH add LK. All rights reserved.
//


import UIKit

class BaseTableViewController: HKBaseViewController {

    lazy var tableView : HKBaseTableView = {
        let tableView = HKBaseTableView(frame: .zero, style: style)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = AppStyleConfiguration.colorWithLineColor()
        tableView.estimatedRowHeight = 0
        tableView.estimatedSectionHeaderHeight = 0
        tableView.estimatedSectionFooterHeight = 0
        tableView.separatorStyle = .none
        tableView.rowHeight = 0
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var style: UITableView.Style = .grouped
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let temp : String = tableView.backgroundImgStr
        if temp.count > 0 {
            tableView.backgroundColor = UIColor.init(patternImage: UIImage(named: tableView.backgroundImgStr)!)
        } else {
            tableView.backgroundColor = .white
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0);
            make.top.equalTo(kMainTopHeight)
            make.bottom.equalTo(0);
        }
    }
}

extension BaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
}
