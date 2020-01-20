//
//  DHHomeFootView.swift
//  BaseFramework
//
//  Created by mac on 2020/1/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class DHHomeFootView: UICollectionReusableView {
    
    var backView : HKBaseView?
    
    var leftImageView : UIImageView?
    var titleLabel : UILabel?
    var moreButton : UIButton?
    var lineView : HKBaseView?
  
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    
    func loadViews() {
        self.backView = HKBaseView()
//        self.backView?.yc_cornerRadius(5)
        self.backView?.backgroundColor = UIColor.white
        
        self.lineView = HKBaseView()
        self.lineView?.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
        
        
        self.leftImageView = HKImageView(radius: 0, isRadius: false)
        self.leftImageView?.image = UIImage(named: "首页_31")
        
        self.titleLabel = HKLabel(font: fontSize12, color: UIColor.black, text: "跑步腿变粗是因为没跑对")
        
        self.moreButton = HKButton(backColor:UIColor.white, text: "更多", image: "HK_right", isRadius: false)
        self.moreButton?.layoutButton(with: .right, imageTitleSpace: 20)
        self.moreButton?.setTitleColor(UIColor.gray, for: .normal)
        
       
        self .addSubview(self.backView!)
        self.backView?.addSubview(self.lineView!)
        self.backView?.addSubview(self.leftImageView!)
        
        self.backView?.addSubview(self.titleLabel!)
        self.backView?.addSubview(self.moreButton!)

 
    }
    
    func layoutView(){
        
        self.backView?.snp_makeConstraints({ (make) in
            make.left.top.equalTo(0)
            make.right.bottom.equalTo(0)
        })
        
        self.lineView?.snp_makeConstraints({ (make) in
            make.left.right.top.equalTo((0))
            make.height.equalTo(1)
        })
        
        self.leftImageView?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(15))
            make.centerY.equalTo(self.backView!.snp_centerY)
            make.width.equalTo(HKFixWidthFlaot(60))
            make.height.equalTo(HKFixHeightFlaot(25))
        })
        
        
        self.titleLabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.leftImageView!.snp_right).offset(5)
            make.centerY.equalTo(self.backView!.snp_centerY)
             make.height.equalTo(HKFixHeightFlaot(30))
        })
        
        self.moreButton?.snp_makeConstraints({ (make) in
            make.right.equalTo(-5)
            make.centerY.equalTo(self.backView!.snp_centerY)
            make.width.equalTo(HKFixWidthFlaot(80))
            make.height.equalTo(HKFixHeightFlaot(30))
        })

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
