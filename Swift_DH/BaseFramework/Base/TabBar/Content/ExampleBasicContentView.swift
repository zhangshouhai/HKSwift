//
//  ExampleBasicContentView.swift
//  ESTabBarControllerExample
//
//  Created by lihao on 2017/2/9.
//  Copyright © 2018 12 04 Egg Swift. All rights reserved.
//

import UIKit


class ExampleBasicContentView: ESTabBarItemContentView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = UIColor.gray
        highlightTextColor = UIColor.black
        iconColor = UIColor.black
        highlightIconColor = UIColor.black
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
