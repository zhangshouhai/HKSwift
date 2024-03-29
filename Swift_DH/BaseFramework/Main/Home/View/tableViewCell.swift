//
//  tableViewCell.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/9.
//  Copyright © 2019DH add LK.. All rights reserved.
//

import Foundation

class TempTableViewCell: HKBaseTableViewCell {
    var titleLab : UILabel?
    
    override func loadView() {
        self.titleLab = HKLabel(font: fontSize14, color: UIColor.black, text: "This is a Lab")
        self.titleLab?.textAlignment = NSTextAlignment.center
        
        self.contentView.addSubview(self.titleLab!)
    }
    
    override func layoutView() {
        
        self.titleLab?.snp.makeConstraints({ (make) in
            make.left.equalToSuperview().offset(HKFixWidthFlaot(20))
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-HKFixWidthFlaot(20))
        })
    }
    
    public func testTitleLab(titleString: String) {
        self.titleLab?.text = titleString
    }
}

class LKTestTableViewCell: HKBaseTableViewCell {
    private lazy var backView : UIView = {
        let temp = UIView()
        temp.backgroundColor = .clear
        
        return temp
    }()
    
    private lazy var titlelab : UILabel = {
        let temp = HKLabel(font: fontSize14,
                           color: .black,
                           text: "这里是标题")
        return temp
    }()
    
    override func loadView() {
        self.backgroundColor = .clear
        self.addSubview(backView)
        backView.addSubview(titlelab)
    }
    
    override func layoutView() {
        backView.snp.makeConstraints { (make) in
            make.left.equalTo(HKFixWidthFlaot(15))
            make.right.equalTo(HKFixWidthFlaot(-15))
            make.top.equalTo(HKFixHeightFlaot(10))
            make.bottom.equalTo(HKFixHeightFlaot(-10))
        }
        
        titlelab.snp.makeConstraints { (make) in
            make.center.equalTo(backView)
        }
    }
}
