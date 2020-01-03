//
//  HKBaseView.swift
//  BaseFramework
//
//  Created by 曹泺恺 on 2019/12/9.
//  Copyright © 2019DH add LK.. All rights reserved.
//

import Foundation
import YCShadowView

class HKBaseView: YCShadowView {
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
