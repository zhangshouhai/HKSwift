//
//  AppUpdateAlert.swift
//  YXDoctor
//
//  Created by mac on 2019/12/24.
//  Copyright © 2019 msun. All rights reserved.
//

import Foundation
import UIKit

public func kRGB(r:CGFloat, g:CGFloat, b:CGFloat) ->UIColor{return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)}
let AppleAppID = "1291661719"

///屏幕宽
let kSCREEN_WIDTH = UIScreen.main.bounds.width
///屏幕高
let kSCREEN_HEIGHT = UIScreen.main.bounds.height


let Ratio_375 = kSCREEN_WIDTH / 375.0

/// 转换成当前比例的数
func Ratio(x:CGFloat) -> CGFloat {
    return CGFloat(x * Ratio_375)
}
let DEFAULT_MAX_HEIGHT = kSCREEN_HEIGHT / 3 * 2

class AppUpdateAlert:UIView {
    /** 版本号 */
    var version = ""
    /** 版本更新内容 */
    var desc = ""
    /** 是否强制更新 */
    var isupdata = false
    
    static let sharedInstance : AppUpdateAlert = {
        let instance = AppUpdateAlert()
        return instance
    }()
    
    func showUpdateAlert(version: String?, description: String?,isupdata:Bool) {
        let updateAlert = AppUpdateAlert.init(version: version!, description: description!,isupdata: isupdata)
//        UIApplication.shared.delegate?.window??.addSubview(updateAlert)
//        UIApplication.shared.delegate?.window??.bringSubviewToFront(updateAlert)
            
        
        for view in UIApplication.shared.keyWindow!.subviews {
            if view.isKind(of: AppUpdateAlert.self) {
                return
            }
        }
        
        UIApplication.shared.keyWindow?.addSubview(updateAlert)
        UIApplication.shared.keyWindow?.bringSubviewToFront(updateAlert)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    init(version:String,description:String,isupdata:Bool) {
        super.init(frame: UIScreen.main.bounds)
        self.version = version
        desc = description
        self.isupdata = isupdata
        initView()
    }
}
// MARK: - init
extension AppUpdateAlert{
    func initView() {
        
        self.frame = UIScreen.main.bounds
        self.backgroundColor =  UIColor(red: CGFloat(0 / 255.0), green: CGFloat(0 / 255.0), blue: CGFloat(0 / 255.0), alpha: 0.3 / 1.0)

        //获取更新内容高度
        var descHeight = _sizeofString(desc, font: UIFont.systemFont(ofSize: 16), maxSize: CGSize(width: self.frame.size.width-Ratio(x: 136), height: 1000)).height
        //bgView实际高度
        let realHeight: CGFloat = descHeight + Ratio(x: 314)
        //bgView最大高度
        var maxHeight: CGFloat = DEFAULT_MAX_HEIGHT
        //更新内容可否滑动显示
        var scrollEnabled = false
        //重置bgView最大高度 设置更新内容可否滑动显示
        if realHeight > DEFAULT_MAX_HEIGHT {
            scrollEnabled = true
            descHeight = DEFAULT_MAX_HEIGHT - Ratio(x: 314)
        } else {
            maxHeight = realHeight
        }
        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        bgView.layer.cornerRadius = 10
        bgView.layer.masksToBounds = true
        bgView.center = center
        bgView.bounds = CGRect(x: 0, y: 0, width: frame.size.width - Ratio(x: 40), height: maxHeight + Ratio(x: 18))
        addSubview(bgView)
        //添加更新提示
        let updateView = UIView(frame: CGRect(x: Ratio(x: 0), y: Ratio(x: 0), width: bgView.frame.size.width , height: maxHeight))
        updateView.backgroundColor = UIColor.init(white: 1, alpha: 0);
        bgView.addSubview(updateView)

        let updatebg_image = UIImageView(frame: CGRect(x: 0, y: 0, width: updateView.frame.size.width, height: updateView.frame.size.width/(681/313) ))
        updatebg_image.contentMode = .scaleToFill
        updatebg_image.image = UIImage(named: "updataiamge")
        updateView.addSubview(updatebg_image)
        

        //版本号
        let versionLabel = UILabel(frame: CGRect(x: Ratio(x:20), y: Ratio(x:20), width: updateView.frame.size.width-Ratio(x: 40), height: Ratio(x:40)))
        versionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        versionLabel.numberOfLines = 2
        versionLabel.textAlignment = .left
        versionLabel.textColor = UIColor.white
        versionLabel.text = "发现新版本 \n\(version)"
        updatebg_image.addSubview(versionLabel)
        
        
        let descTextView = UITextView(frame: CGRect(x: Ratio(x: 20), y: Ratio(x: 10) + updatebg_image.frame.maxY, width: updateView.frame.size.width - Ratio(x:40), height: descHeight))
        descTextView.font = UIFont.systemFont(ofSize: CGFloat(14))
        descTextView.textContainer.lineFragmentPadding = 0
//        descTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0)
        descTextView.text = desc
        descTextView.textColor = UIColor.gray
        descTextView.isEditable = false
        descTextView.isSelectable = false
        descTextView.isScrollEnabled = scrollEnabled
        descTextView.showsVerticalScrollIndicator = scrollEnabled
        descTextView.showsHorizontalScrollIndicator = false
        updateView.addSubview(descTextView)
        if scrollEnabled {
            //若显示滑动条，提示可以有滑动条
            descTextView.flashScrollIndicators()
        }
        
        //更新按钮
        let updateButton = UIButton(type: .system)
        updateButton.backgroundColor = kRGB(r: 0, g: 158, b: 247)
        
        if self.isupdata {
             updateButton.frame = CGRect(x: Ratio(x:25), y: updateView.frame.maxY - Ratio(x:60), width: updateView.frame.size.width - Ratio(x:50), height: Ratio(x:40))
        }
        else{
             updateButton.frame = CGRect(x: Ratio(x:25), y: updateView.frame.maxY - Ratio(x:100), width: updateView.frame.size.width - Ratio(x:50), height: Ratio(x:40))
        }
        
       
        updateButton.clipsToBounds = true
        updateButton.layer.cornerRadius = 20
        updateButton.addTarget(self, action: #selector(self.updateVersion), for: .touchUpInside)
        updateButton.setTitle("立即更新", for: .normal)
        updateButton.setTitleColor(UIColor.white, for: .normal)
        updateView.addSubview(updateButton)

        
//        //取消按钮
        if !self.isupdata {
            let cancelButton = UIButton(type: .system)
            cancelButton.backgroundColor = UIColor.white
            cancelButton.frame = CGRect(x: Ratio(x: 25), y: updateButton.frame.maxY+Ratio(x:20), width: updateView.frame.size.width - Ratio(x:50), height: Ratio(x:30))
            cancelButton.setTitle("取消", for: .normal)
            cancelButton.setTitleColor(UIColor.darkGray, for: .normal)
            cancelButton.addTarget(self, action: #selector(self.cancelAction), for: .touchUpInside)
            updateView.addSubview(cancelButton)
        }

//        //显示更新
        show(withAlert: bgView)

        
        
    }
}
// MARK: - action
extension AppUpdateAlert{
    
    
    /// 更新按钮点击事件 跳转AppStore更新
    @objc func updateVersion() {
        
//        let str = "http://itunes.apple.com/us/app/id\(AppleAppID)"
//        if let aStr = URL(string: str) {
//            UIApplication.shared.openURL(aStr)
//        }
         NotificationCenter.default.post(name: NSNotification.Name(rawValue: "upDataapp"), object: nil)
    }
    /// 取消按钮点击事件
    @objc func cancelAction() {
        dismissAlert()
    }
    /// 添加Alert入场动画
    ///
    /// - Parameter alert: 添加动画的View
    func show(withAlert alert: UIView?) {
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = CFTimeInterval(0.3)
        var values = [AnyHashable]()
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)))
        animation.values = values
        alert?.layer.add(animation, forKey: nil)
    }
    /// 添加Alert出场动画
    func dismissAlert() {
        UIView.animate(withDuration: 0.3, animations: {() -> Void in
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.backgroundColor = UIColor.clear
            self.alpha = 0
        }, completion: {(_ finished: Bool) -> Void in
            self.removeFromSuperview()
        })
    }
    func _sizeofString(_ string: String?, font: UIFont?, maxSize: CGSize) -> CGSize {
        return string?.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin, .usesFontLeading],attributes: [NSAttributedString.Key.font :font as Any] ,context: nil).size ?? CGSize.zero
        
//         [NSAttributedStringKey.font: font as Any], context: nil).size ?? CGSize.zero
    }

}
