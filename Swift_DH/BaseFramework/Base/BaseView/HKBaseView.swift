//
//  HKBaseView.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/9.
//  Copyright © 2019 贾则栋. All rights reserved.
//

import Foundation

class HKBaseView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.loadView()
        self.layoutView()
    }
    
    public func loadView() {
        
    }
    
    public func layoutView() {
        
    }
}
