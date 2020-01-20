//
//  DHHomeCell.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class DHHomeCell: UICollectionViewCell {
    
    var titleLabel:UILabel?
    var subtitleLabel:UILabel?
    var iocnImageView:UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    func loadViews(){
        
        self.iocnImageView = HKImageView(radius: 0, isRadius: false)
        
        self.titleLabel = HKLabel(font: fontSize16, color: UIColor.black, text: "标题")
        self.titleLabel?.textAlignment = .center
        
        self.subtitleLabel = HKLabel(font: fontSize10, color: UIColor.gray, text: "标题")
        self.subtitleLabel?.textAlignment = .center
        
        self.addSubview(self.iocnImageView!)
        self.addSubview(self.titleLabel!)
        self.addSubview(self.subtitleLabel!)
        
    }
    func layoutView(){
        
        self.iocnImageView?.snp_makeConstraints({ (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.top.equalTo(HKFixHeightFlaot(10))
            make.height.width.equalTo(HKFixHeightFlaot(40))
        })
        
        
        self.titleLabel?.snp_makeConstraints({ (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.top.equalTo(self.iocnImageView!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixHeightFlaot(20))

        })
        
        self.subtitleLabel?.snp_makeConstraints({ (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.top.equalTo(self.titleLabel!.snp_bottom).offset(HKFixHeightFlaot(0))
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







class DHHomeSecondCell: UICollectionViewCell {
    
    var titleLabel:UILabel?

    var iocnImageView:UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    func loadViews(){
        
        self.iocnImageView = HKImageView(radius: 0, isRadius: false)
        
        self.titleLabel = HKLabel(font: fontSize11, color: UIColor.black, text: "标题")
        self.titleLabel?.textAlignment = .center
        
       
        
        self.addSubview(self.iocnImageView!)
        self.addSubview(self.titleLabel!)
  
        
    }
    func layoutView(){
        
        self.iocnImageView?.snp_makeConstraints({ (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.top.equalTo(HKFixHeightFlaot(10))
            make.height.width.equalTo(HKFixHeightFlaot(30))
        })
        
        
        self.titleLabel?.snp_makeConstraints({ (make) in
            make.centerX.equalTo(self.snp_centerX)
            make.top.equalTo(self.iocnImageView!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixHeightFlaot(20))

        })
 
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



//健康加油站 CELL
class DHHomeThreeCell: UICollectionViewCell {
    
    var backView : HKBaseView?
    var titleView : HKBaseView?
    var titlelabel : UILabel?
    var subtitlelabel : UILabel?
      
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    func loadViews(){
        
        self.backView = HKBaseView()
        self.backView?.yc_cornerRadius(5)
        
        self.titleView = HKBaseView()
       
        self.titlelabel = HKLabel(font: fontSize14, color: UIColor.black, text: "")

        self.subtitlelabel = HKLabel(font: fontSize11, color: UIColor.gray, text: "")
       

        self.addSubview(self.backView!)
        self.backView?.addSubview(self.titleView!)
        self.backView?.addSubview(self.titlelabel!)
        self.backView?.addSubview(self.subtitlelabel!)
  
        
    }
    func layoutView(){
      
        self.backView?.snp_makeConstraints({ (make) in
            make.left.equalTo(5)
            make.top.equalTo(HKFixHeightFlaot(10))
            make.bottom.equalTo(HKFixHeightFlaot(-10))
            make.right.equalTo(-5)
        })
        
        self.titleView?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(HKFixHeightFlaot(15))
            make.height.width.equalTo(HKFixHeightFlaot(6))
        })
        
        self.titlelabel?.snp_makeConstraints({ (make) in
            make.centerY.equalTo(self.titleView!.snp_centerY)
            make.left.equalTo(self.titleView!.snp_right).offset(5)
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.subtitlelabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(10))
            make.top.equalTo(self.titlelabel!.snp_bottom).offset(HKFixHeightFlaot(0))
            make.height.equalTo(HKFixHeightFlaot(20))
        })
 
    }

    
    func loadHomeThreeCell(titleString: String,subtitleStr:String,backColor:String,titleColor:String) -> Void {

        self.titlelabel?.text = titleString
        self.subtitlelabel?.text = subtitleStr
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: backColor as NSString)
        
        self.titleView?.backgroundColor = UIColor.colorWithHexString(colorString:titleColor as NSString)
        self.titleView?.layer.cornerRadius = HKFixHeightFlaot(3);
        self.titleView?.layer.masksToBounds = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//医生专家课 cell
class DHHomefourCell: UICollectionViewCell {
    
    var headerImageView : UIImageView?
    var titlelabel : UILabel?
    var subtitlelabel : UILabel?
    var playNumImageView : UIImageView?
    var playNumlabel : UILabel?
    
    var pricelabel : UILabel?
    var oldpricelabel : UILabel?
    
    var youhuiImageView : UIImageView?
    var youhuilabel : UILabel?
    
    var lineView : HKBaseView?
      
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    func loadViews(){
        
        self.headerImageView  = HKImageView(radius: 5, isRadius: true)
       
        self.titlelabel = HKLabel(font: fontSize15, color: UIColor.black, text: "")

        self.subtitlelabel = HKLabel(font: fontSize10, color: UIColor.gray, text: "")
        
        self.playNumImageView  = HKImageView(radius: 0, isRadius: true)
        self.playNumlabel = HKLabel(font: fontSize10, color: UIColor.gray, text: "")
        
        self.pricelabel = HKLabel(font: fontSize13, color: UIColor.colorWithHexString(colorString: "#FF993B"), text: "")
        
        self.oldpricelabel = HKLabel(font: fontSize10, color: UIColor.lightGray, text: "")
        
        self.youhuiImageView = HKImageView(radius: 0, isRadius: false)
        self.youhuilabel = HKLabel(font: fontSize8, color: UIColor.white, text: "")
        
        
        self.lineView = HKBaseView()
        self.lineView?.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
       

        self.addSubview(self.headerImageView!)
        self.addSubview(self.titlelabel!)
        self.addSubview(self.subtitlelabel!)
        
        self.addSubview(self.playNumImageView!)
        self.addSubview(self.playNumlabel!)
        
        self.addSubview(self.pricelabel!)
        self.addSubview(self.oldpricelabel!)
        
        self.addSubview(self.youhuiImageView!)
        self.youhuiImageView?.addSubview(self.youhuilabel!)
        
        self.addSubview(self.lineView!)
  
        
    }
    func layoutView(){
      
        self.headerImageView?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.centerY.equalTo(self.snp_centerY)
            make.height.width.equalTo(HKFixHeightFlaot(65))
            
        })
        
      
        
        self.titlelabel?.snp_makeConstraints({ (make) in
            make.top.equalTo(self.headerImageView!.snp_top)
            make.left.equalTo(self.headerImageView!.snp_right).offset(10)
            make.height.equalTo(HKFixHeightFlaot(20))
            make.right.equalTo(HKFixWidthFlaot(-10))
        })
        
        self.subtitlelabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.headerImageView!.snp_right).offset(10)
            make.top.equalTo(self.titlelabel!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.height.equalTo(HKFixHeightFlaot(20))
            make.right.equalTo(self.youhuiImageView!.snp_left).offset(-5)
        })
        
        self.playNumImageView?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.headerImageView!.snp_right).offset(10)
            make.top.equalTo(self.subtitlelabel!.snp_bottom).offset(HKFixHeightFlaot(0))
            make.height.width.equalTo(HKFixHeightFlaot(15))
        })
        
        self.playNumlabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.playNumImageView!.snp_right).offset(3)
            make.centerY.equalTo(self.playNumImageView!.snp_centerY)
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.pricelabel?.snp_makeConstraints({ (make) in
            make.centerY.equalTo(self.subtitlelabel!.snp_centerY)
            make.right.equalTo(-10)
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.youhuiImageView?.snp_makeConstraints({ (make) in
            make.centerY.equalTo(self.subtitlelabel!.snp_centerY)
            make.right.equalTo(self.pricelabel!.snp_left).offset(-3)
            make.height.equalTo(15)
            make.width.equalTo(35);
        })
        
        self.youhuilabel?.snp_makeConstraints({ (make) in
            make.left.right.bottom.top.equalTo(0)
        })
        
        
        
        self.oldpricelabel?.snp_makeConstraints({ (make) in
            make.top.equalTo(self.pricelabel!.snp_bottom).offset(0)
            make.right.equalTo(-10)
            make.height.equalTo(HKFixHeightFlaot(15))
        })
        
    
        self.lineView?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.bottom.right.equalTo(0)
            make.height.equalTo(1)
        })
        
    }

    
    func loadHomefourCell(titleString: String) -> Void {

        self.headerImageView?.image = UIImage(named: "docheader")
        self.playNumImageView?.image = UIImage(named: "音频")
        self.titlelabel?.text = "孕期出血怎么办？专家教你正确应对"
        self.subtitlelabel?.text = "高志强 | 妇产科副主任医师"
        self.playNumlabel?.text = "音频  1253K人参与"
        
        self.pricelabel?.text = "￥49.9"
        self.oldpricelabel?.text = "￥100.0"
        
        self.youhuiImageView?.image = UIImage(named: "圆角矩形 4")
        self.youhuilabel?.text = "可用劵"
        self.youhuilabel?.textAlignment = .center
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
