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
        self.titleLab = HKLabel(font: HKFixHeightFlaot(14), color: UIColor.black, text: "This is a Lab")
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
