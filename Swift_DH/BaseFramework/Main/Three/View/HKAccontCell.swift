//
//  HKAccontCell.swift
//  BaseFramework
//
//  Created by 张寿海 on 2020/1/13.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation
class HKAccontCell: HKBaseTableViewCell {

    var leftHeaderView : UIImageView?
    var titLabel : UILabel?
    var rightImageView : UIImageView?
    var rightLabel : UILabel?
    var lineView : UIView?
    
    override func loadView() {
        
        self.leftHeaderView = UIImageView.init()
        self.rightImageView = UIImageView.init()
        self.rightImageView?.image = UIImage(named: "HK_right_Icon")
        self.rightImageView?.contentMode = .scaleAspectFill
     
   
        self.titLabel = HKLabel(font: fontSize14, color: UIColor.black, text: "This is a Lab")
        self.titLabel?.textAlignment = NSTextAlignment.left
      

        self.rightLabel = HKLabel(font: fontSize12, color: UIColor.gray, text: "this is  a subLabel")
        self.rightLabel?.textAlignment = NSTextAlignment.right
       
        
        self.lineView = UIView.init()
        self.lineView?.backgroundColor = UIColor.colorWithHexString(colorString: HKLineViewColor)
        
        
        self.contentView.addSubview(self.leftHeaderView!)
        self.contentView.addSubview(self.rightImageView!)
        self.contentView.addSubview(self.titLabel!)
        self.contentView.addSubview(self.rightLabel!)
        self.contentView.addSubview(self.lineView!)
        
    }
    
    override func layoutView() {
        
        
        self.leftHeaderView?.snp.makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.centerY.equalTo(self.snp_centerY)
            make.height.width.equalTo(HKFixHeightFlaot(40))
        })
        
        
        
        self.titLabel?.snp.makeConstraints({ (make) in
            make.left.equalTo(self.leftHeaderView!.snp_right).offset(HKFixWidthFlaot(10))
            make.centerY.equalToSuperview()
            make.height.equalTo(HKFixWidthFlaot(20))
        })
        
        
        self.rightImageView?.snp.makeConstraints({ (make) in
            make.right.equalTo(HKFixWidthFlaot(-10))
            make.centerY.equalTo(self.snp_centerY)
            make.height.width.equalTo(HKFixHeightFlaot(20))
        })
  
        self.rightLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(self.rightImageView!.snp_left).offset(HKFixWidthFlaot(-5))
            make.centerY.equalToSuperview()
            make.height.equalTo(HKFixWidthFlaot(20))
        })
        
        self.lineView?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.bottom.equalTo(0)
            make.height.equalTo(1)
            make.right.equalTo(0)
        })
    
    }
    
    
    func setAccontCellToTitle(titleString: String,subtitle:String,leftimageStr:String) -> Void {
        self.titLabel?.text = titleString
        self.leftHeaderView?.image = UIImage(named: leftimageStr)
        self.rightLabel?.text = subtitle
    }
    
    /**
       隐藏 右侧 subTitle
    */
    func hidenRightTitle() -> Void{
        self.rightLabel?.isHidden = true
        
    }
    /**
    隐藏 右侧 图标
    */
    func hidenRightImageView() -> Void{
        self.rightImageView?.isHidden = true
        self.rightLabel?.snp.makeConstraints({ (make) in
            make.right.equalTo(HKFixWidthFlaot(-15))
        })
        
    }
    /**
     隐藏 左侧 图标
     */
    func hidenLeftImageView() -> Void{
           self.leftHeaderView?.isHidden = true
           self.titLabel?.snp.makeConstraints({ (make) in
               make.left.equalTo(HKFixWidthFlaot(20))
           })
           
       }
    
    

}
