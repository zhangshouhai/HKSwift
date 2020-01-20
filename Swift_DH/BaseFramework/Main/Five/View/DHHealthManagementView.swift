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
        
        
        self.backgroundColor = UIColor.white
        self.backView = HKBaseView()
        
        self.titleButton = HKButton(backColor: UIColor.black, text: "育儿", image: "right_white", isRadius: true)
        self.titleButton?.titleLabel?.font = fontSize15
        self.titleButton?.layoutButton(with: .right, imageTitleSpace: 15)
        
        self.titleLabel = HKLabel(font: fontSize15, color: UIColor.black, text: "")
 
        self.subTitleLabel = HKLabel(font: fontSize13, color: UIColor.gray, text: "")

        self.numLabel = HKLabel(font: fontSize12, color: UIColor.gray, text: "")
       
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
            make.left.equalTo(HKFixWidthFlaot(0))
            make.right.equalTo(HKFixWidthFlaot(0))
            make.top.equalTo(HKFixHeightFlaot(0))
            make.bottom.equalTo(HKFixHeightFlaot(-10))
        })
        
        
        self.titleButton?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.top.equalTo(HKFixWidthFlaot(20))
            make.height.equalTo(HKFixHeightFlaot(30))
            make.width.equalTo(HKFixHeightFlaot(70))
        })
        
        self.leftHeaderView?.snp.makeConstraints({ (make) in
            make.right.top.bottom.equalTo(0)
            make.left.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(10))
        })
        

        
        self.titleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.top.equalTo(self.titleButton!.snp_bottom).offset(HKFixHeightFlaot(10))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })
        
        
        self.subTitleLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.top.equalTo(self.titleLabel!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })
  
        self.numLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.top.equalTo(self.subTitleLabel!.snp_bottom).offset(HKFixHeightFlaot(10))
            make.height.equalTo(HKFixWidthFlaot(20))
            make.right.equalTo(self.backView!.snp_centerX).offset(HKFixWidthFlaot(-5))
        })

    
    }
    
    
    func loadDataHealthHomeCell(titleString: String) -> Void {
        
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FAFAFA")
        
        self.titleButton?.layer.cornerRadius = HKFixHeightFlaot(15)
        self.titleButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: "#B85535"), forState: .normal)
        self.titleButton?.setTitleColor(UIColor.white, for: .normal)
        self.titleButton?.setTitle("育儿", for: .normal)
        self.leftHeaderView?.image = UIImage(named: "我的健康_03")

        self.titleLabel?.text = "宝宝刚出生"
        self.numLabel?.text = "1356万人正在使用"
        self.subTitleLabel?.text = "3月13号该打疫苗啦"
        self.titleLabel?.textColor = UIColor.colorWithHexString(colorString: "#B85535")
        self.subTitleLabel?.textColor = UIColor.colorWithHexString(colorString: "#B85535")

    }
    
    func loadDataHealthHomeCell1(titleString: String) -> Void {
        
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FAFAFA")
        
        self.titleButton?.layer.cornerRadius = HKFixHeightFlaot(15)
        self.titleButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: "#CCCCCC"), forState: .normal)
        self.titleButton?.setTitleColor(UIColor.white, for: .normal)
        self.titleButton?.setTitle("经期", for: .normal)
        self.leftHeaderView?.image = UIImage(named: "我的健康_05")

        self.titleLabel?.text = "妇幼健康管理"
        self.numLabel?.text = "488万人再用"
        self.subTitleLabel?.text = "您的贴身妇幼管家"
        self.titleLabel?.textColor = UIColor.black
        self.subTitleLabel?.textColor = UIColor.gray

    }
    
    func loadDataHealthHomeCell2(titleString: String) -> Void {
        
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FAFAFA")
               
               self.titleButton?.layer.cornerRadius = HKFixHeightFlaot(15)
               self.titleButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: "#CCCCCC"), forState: .normal)
               self.titleButton?.setTitleColor(UIColor.white, for: .normal)
               self.titleButton?.setTitle("慢病", for: .normal)
               self.leftHeaderView?.image = UIImage(named: "我的健康_07")

               self.titleLabel?.text = "慢病健康管理"
               self.numLabel?.text = "578万人再用"
               self.subTitleLabel?.text = "管住嘴、迈开腿、按时吃药"
               self.titleLabel?.textColor = UIColor.black
               self.subTitleLabel?.textColor = UIColor.gray

    }
    
    func loadDataHealthHomeCell3(titleString: String) -> Void {
        
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#FAFAFA")
               
               self.titleButton?.layer.cornerRadius = HKFixHeightFlaot(15)
               self.titleButton?.setBackgroundColor(UIColor.colorWithHexString(colorString: "#CCCCCC"), forState: .normal)
               self.titleButton?.setTitleColor(UIColor.white, for: .normal)
               self.titleButton?.setTitle("养生", for: .normal)
               self.leftHeaderView?.image = UIImage(named: "我的健康_09")

               self.titleLabel?.text = "健康大讲堂"
               self.numLabel?.text = "156万人再用"
               self.subTitleLabel?.text = "您不知道的那些事情"
               self.titleLabel?.textColor = UIColor.black
               self.subTitleLabel?.textColor = UIColor.gray

    }
    
    

}
