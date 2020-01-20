//
//  DHHomeTopView.swift
//  BaseFramework
//
//  Created by mac on 2020/1/19.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import Foundation

class DHHomeTopView: UICollectionReusableView {
    
    var backView : HKBaseView?
    var nameLabel : UILabel?
    var typeLabel : UILabel?
    var carlabel : UILabel?
    var carButton : UIButton?
    var eqImageView : UIImageView?
    var eqtitlelabel : UILabel?
    var lineView : HKBaseView?
    var addButton : UIButton?
    
    var rightiamgeView : UIImageView?
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
        loadViews()
        layoutView()
    }
    
    func loadViews() {
        self.backView = HKBaseView()
        self.backView?.yc_cornerRadius(5)
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: HKNavBgColor)
       
        
        self.nameLabel = HKLabel(font: fontSize17, color: UIColor.white, text: "")
        
        self.typeLabel = HKLabel(font: fontSize10, color: UIColor.white, text: "")
        
        self.carlabel = HKLabel(font: fontSize11, color: UIColor.white, text: "")
        
        
        self.carButton = HKButton(backColor: UIColor.colorWithHexString(colorString: "#008697"), text: "换卡", image: "home_qiehuan", isRadius: true)
        self.carButton?.setTitleColor(UIColor.white, for: .normal)
        
        
        self.eqImageView = HKImageView(radius: 0, isRadius: false)
        
         self.eqtitlelabel = HKLabel(font: fontSize10, color: UIColor.white, text: "")
        
         self.lineView = HKBaseView()
        self.lineView?.backgroundColor = UIColor.white
        
        self.addButton = HKButton(backColor: UIColor.clear, text: "就诊卡管理", image: "add_car", isRadius: true)
        self.addButton?.setTitleColor(UIColor.white, for: .normal)
        self.addButton?.layoutButton(with: .left, imageTitleSpace: 10)
        
        self.rightiamgeView = HKImageView(radius: 0, isRadius: false)
        self.rightiamgeView?.image = UIImage(named: "right_white")
        

        
        
        
        
        self .addSubview(self.backView!)
        
        
        self.backView?.addSubview(self.nameLabel!)
        self.backView?.addSubview(self.typeLabel!)
        self.backView?.addSubview(self.carlabel!)
        self.backView?.addSubview(self.carButton!)
        self.backView?.addSubview(self.eqImageView!)
        self.backView?.addSubview(self.eqtitlelabel!)
        self.backView?.addSubview(self.lineView!)
        self.backView?.addSubview(self.addButton!)
        self.backView?.addSubview(self.rightiamgeView!)
        
        
        
    }
    
    func layoutView(){
        self.backView?.snp_makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.right.equalTo(-10)
        })
        
        
        self.nameLabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(15))
            make.top.equalTo(HKFixHeightFlaot(15))
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.typeLabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.nameLabel!.snp_right).offset(HKFixWidthFlaot(5))
            make.centerY.equalTo(self.nameLabel!.snp_centerY)
            make.height.equalTo(HKFixHeightFlaot(15))
            make.width.equalTo(HKFixWidthFlaot(55))
        })
        
        self.carlabel?.snp_makeConstraints({ (make) in
                make.left.equalTo(HKFixWidthFlaot(15))
                 make.top.equalTo(self.nameLabel!.snp_bottom).offset(HKFixHeightFlaot(15))
                make.height.equalTo(HKFixHeightFlaot(20))
               })
        
        self.carButton?.snp_makeConstraints({ (make) in
            make.left.equalTo(self.carlabel!.snp_right).offset(10)
            make.centerY.equalTo(self.carlabel!.snp_centerY)
            make.height.equalTo(HKFixHeightFlaot(20))
            make.width.equalTo(HKFixWidthFlaot(55))
        })
        
        
        self.eqImageView?.snp_makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.top.equalTo(10);
            make.width.height.equalTo(HKFixHeightFlaot(60))
            
        })
        
        self.eqtitlelabel?.snp_makeConstraints({ (make) in
            make.top.equalTo(self.eqImageView!.snp_bottom).offset(HKFixHeightFlaot(0));
            make.centerX.equalTo(self.eqImageView!.snp_centerX);
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.lineView?.snp_makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.top.equalTo(self.eqtitlelabel!.snp_bottom).offset(HKFixHeightFlaot(3))
            make.height.equalTo(1)
        })
        
        
        self.addButton?.snp_makeConstraints({ (make) in
            make.top.equalTo(self.lineView!.snp_bottom).offset(HKFixHeightFlaot(5))
            make.left.equalTo(HKFixWidthFlaot(15))
            make.height.equalTo(HKFixHeightFlaot(25))
            make.width.equalTo(HKFixWidthFlaot(120))
        })
        
        self.rightiamgeView?.snp_makeConstraints({ (make) in
            make.right.equalTo(-10)
            make.centerY.equalTo(self.addButton!.snp_centerY)
            make.height.width.equalTo(HKFixHeightFlaot(15))
        })
        
    }
    
    func loadHomeTopHeader(titleString: String) -> Void {
        
        self.nameLabel?.text = "刘天"
         self.typeLabel?.text = "已认证"
        self.typeLabel?.textAlignment = .center
        self.typeLabel?.layer.cornerRadius = HKFixHeightFlaot(15/2)
        self.typeLabel?.layer.masksToBounds = true
        self.typeLabel?.backgroundColor = UIColor.colorWithHexString(colorString: "#D5DFB2")
        self.typeLabel?.textColor = UIColor.colorWithHexString(colorString: "#949558")
        
        self.carlabel?.text = "291027463823836"
//        self.carButton.layoutButtonWithEdgeInsetsStyle:
        self.eqImageView?.image = UIImage(named: "erweima")
        
        self.eqtitlelabel?.textAlignment = .center
        self.eqtitlelabel?.text = "刷卡时出示"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





class DHHomeTopSecondView: UICollectionReusableView {
    
    var backView : HKBaseView?
  
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
    }
    
    func loadViews() {
        self.backView = HKBaseView()
//        self.backView?.yc_cornerRadius(5)
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
       
        self .addSubview(self.backView!)


        
    }
    
    func layoutView(){
        
        self.backView?.snp_makeConstraints({ (make) in
            make.left.top.equalTo(0)
            make.right.bottom.equalTo(0)
        })

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class DHHomeTopThreeView: UICollectionReusableView {
    
    var backView : HKBaseView?
    var lineView : HKBaseView?
    var titlelabel : UILabel?
    var subtitlelabel : UILabel?
    var rightImageView : UIImageView?
    
  
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViews()
        layoutView()
        self.backgroundColor = UIColor.white
    }
    
    func loadViews() {
        self.backView = HKBaseView()
        self.backView?.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
        
        self.titlelabel = HKLabel(font:fontSize14 , color: UIColor.colorWithHexString(colorString: HKNavBgColor), text: "")

        self.subtitlelabel = HKLabel(font:fontSize10 , color: UIColor.gray, text: "")
        
        self.rightImageView = HKImageView(radius: 0, isRadius: false)
        
        self.lineView = HKBaseView()
        self.lineView?.backgroundColor = UIColor.colorWithHexString(colorString: "#F5F5F5")
        

        self.addSubview(self.backView!)
        self.addSubview(self.titlelabel!)
        self.addSubview(self.subtitlelabel!)
        self.addSubview(self.rightImageView!)
        self.addSubview(self.lineView!)


        
    }
    
    func layoutView(){
        
        self.backView?.snp_makeConstraints({ (make) in
            make.left.top.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(HKFixHeightFlaot(8))
        })
        
        self.titlelabel?.snp_makeConstraints({ (make) in
            make.left.equalTo(HKFixWidthFlaot(20))
            make.top.equalTo(self.backView!.snp_bottom).offset(HKFixHeightFlaot(10))
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.rightImageView?.snp_makeConstraints({ (make) in
            make.right.equalTo(HKFixWidthFlaot(-10))
            make.centerY.equalTo(self.titlelabel!.snp_centerY)
            make.height.width.equalTo(HKFixHeightFlaot(15))
        })
        
        self.subtitlelabel?.snp_makeConstraints({ (make) in
            make.right.equalTo(self.rightImageView!.snp_left).offset(-5)
            make.centerY.equalTo(self.titlelabel!.snp_centerY)
            make.height.equalTo(HKFixHeightFlaot(20))
        })
        
        self.lineView?.snp_makeConstraints({ (make) in
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(1)
        })

    }
    
    
    func loadHomeheaderCell(titleString: String,subtitleStr:String) -> Void {

        self.titlelabel?.text = titleString
        self.subtitlelabel?.text = subtitleStr
        self.rightImageView?.image = UIImage(named: "HK_right")
     
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
