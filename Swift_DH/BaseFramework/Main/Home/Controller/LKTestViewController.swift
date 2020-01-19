//
//  LKTestViewController.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class LKTestViewController: BaseTableViewController {
    private let cellIdentifier = Cell<LKTestTableViewCell>.identifier
    
    private var dataArray = NSMutableArray()
    private var ListArray = NSMutableArray()
    
    var type = NSString()
    
    override func viewDidLoad() {
        //如果要定义背景图片，需要写在super.viewDidLoad()前面
        tableView.backgroundImgStr = "guideImage4"
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
//        tableView.backgroundColor = UIColor.init(patternImage: UIImage(named: "guideImage4")!)
    }
    
    
}

extension LKTestViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HKFixHeightFlaot(50)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Cell<LKTestTableViewCell>.tableView(tableView)
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let temp = HomeViewController()
        navigationController?.pushViewController(temp, animated: true)
    }
    
}

