//
//  ThreeViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit

class ThreeViewController: HKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "消息"
        self.setHideLeftBtn()
//        setupUI()
    }
    
//    func setupUI() {
//        tableView.snp.makeConstraints { (make) in
//            make.left.right.equalTo(0);
//            make.top.equalTo(kMainTopHeight)
//            make.bottom.equalTo(0);
//        }
//
//        Cell<HKAccontCell>.registerClass(tableView)
//    }



}


//extension ThreeViewController {
//
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//        view.backgroundColor = UIColor.white
//        return view
//    }
//
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 10
//        } else {
//            return 5
//        }
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = Cell<HKAccontCell>.tableView(tableView)
//
//        cell.setAccontCellToTitle(titleString: "titelabel1",subtitle: "subtitle1",leftimageStr: "Accont_Iocn")
//        cell.hidenRightImageView()
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//
//}
//
