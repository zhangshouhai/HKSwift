//
//  HKBaseTableViewCell.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/9.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import Foundation

class HKBaseTableViewCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style:style,reuseIdentifier:reuseIdentifier)
        
        loadView()
        layoutView()
    }
    
    public func  loadView() {
           //添加到self.contentView上
           
       }
    
    public func layoutView() {
        
    }
    
    override func updateConstraints() {
        layoutView()
        self.updateConstraints()
    }
    
       // layoutSubviews 和OC一样 addSubView 方法自动调用
       override func layoutSubviews() {
           
           
    
       }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
