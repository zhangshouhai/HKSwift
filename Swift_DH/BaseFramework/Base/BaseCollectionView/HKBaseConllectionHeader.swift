//
//  HKBaseConllectionHeader.swift
//  BaseFramework
//
//  Created by mac on 2020/3/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit

class HKBaseConllectionHeader: UICollectionReusableView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)

        loadViews()
        layoutView()
    }
    
    func loadViews(){
    }
       
    func layoutView(){
    }
       
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
