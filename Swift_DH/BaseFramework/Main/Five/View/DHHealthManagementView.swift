//
//  DHHealthManagementView.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class DHHealthManagementView: HKBaseTableViewCell {

    var backView :HKBaseView?
    var titleButton : UIButton?
    var leftHeaderView : UIImageView?
    var titleLabel : UILabel?
    var subTitleLabel : UILabel?
    var numLabel : UILabel?
    
    override func loadView() {
        
        
        self.backView = HKBaseView()
        
        self.titleButton = HKButton(backColor: UIColor.black, text: "", image: "", isRadius: true)
        
        self.titleLabel = HKLabel(font: fontSize17, color: UIColor.black, text: "")
 
        self.subTitleLabel = HKLabel(font: fontSize14, color: UIColor.gray, text: "")

        self.numLabel = HKLabel(font: fontSize13, color: UIColor.gray, text: "")
       
        self.leftHeaderView = UIImageView()
      
        
        self.contentView.addSubview(self.backView!)
        self.backView?.addSubview(self.titleButton!)
        self.backView?.addSubview(self.titleLabel!)
        self.backView?.addSubview(self.subTitleLabel!)
        self.backView?.addSubview(self.numLabel!)
        self.backView?.addSubview(self.leftHeaderView!)
        
    }
    
    override func layoutView() {
        
        
        
        
        self.backView?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.right.equalTo(HKFixWidthFlaot(-10))
            make.top.equalTo(HKFixHeightFlaot(5))
            make.bottom.equalTo(HKFixHeightFlaot(-5))
        })
        
        
        self.titleButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(HKFixWidthFlaot(10))
            make.height.equalTo(HKFixHeightFlaot(30))
            make.width.equalTo(HKFixHeightFlaot(75))
        })
        
        self.leftHeaderView?.snp.makeConstraints({ (make) in
            make.right.top.bottom.equalTo(0)
            make.left.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(10))
        })
        

        
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(self.titleButton!.snp_bottom).offset(HKFixHeightFlaot(10))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })
        
        
        self.subTitleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(self.titleLabel!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })
  
        self.numLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(self.subTitleLabel!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })

    
    }
    
    
    func loadDataHealthHomeCell(titleString: String) -> Void {
        
        self.backView?.yc_shaodw()
        self.backView?.yc_cornerRadius(6)
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FAFAFA")
        
        self.titleButton?.layer.cornerRadius = HKFixHeightFlaot(15)
        self.titleButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: "#B85535"), forState: .normal)
        self.titleButton?.setTitleColor(UIColor.white, for: .normal)
        self.titleButton?.setTitle("育儿 >", for: .normal)
        
        self.leftHeaderView?.image = UIImage(named: "babyCell")
        
        
        self.titleLabel?.text = "宝宝刚出生"
        self.numLabel?.text = "1356万人正在使用"
        self.subTitleLabel?.text = "3月13号该打疫苗啦"
        
        self.titleLabel?.textColor = UIColor.colorWithHexString(colorString: "#EBCDB2")
        self.subTitleLabel?.textColor = UIColor.colorWithHexString(colorString: "#EBCDB2")
        
        
    }
    
    

}
