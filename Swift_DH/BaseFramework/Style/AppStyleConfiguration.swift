//
//  AppStyleConfiguration.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/10.
//  Copyright © 2019 HK. All rights reserved.
//

import UIKit
import Foundation


class AppStyleConfiguration {
    
    /**
    *改变字符串中具体某字符串的颜色
    */
   public class func messageAction(label:UILabel,changeString:String,allColor:UIColor,markColor:UIColor,fontSize:CGFloat) {
        let tempStr = label.text
        
        let strAtt = NSMutableAttributedString.init(string: tempStr!)
        
         strAtt.addAttributes([NSAttributedString.Key.foregroundColor : allColor], range: NSRange(location: 0, length: strAtt.length))
        
        let markRange = tempStr!.toNSRange((tempStr?.range(of: changeString))!)
        strAtt.addAttributes([NSAttributedString.Key.foregroundColor :markColor], range: markRange)
        strAtt.addAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: fontSize)], range: markRange)
        
        label.attributedText = strAtt
        
        
        
        
    }
    

    /**
     *  计算文字的宽度
     */

   public class func labelWidth(_ text: String, _ height: CGFloat) -> CGFloat {
        let size = CGSize(width: 2000, height: height)
        let font = UIFont(name: "PingFang-SC-Regular", size: height)!
        let attributes = [NSAttributedString.Key.font: font]
        let labelSize = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return labelSize.width
    }
    
    /**
    *  计算文字的宽度
    */
   public class func getTextHeight(textStr :  String, font : UIFont, width : CGFloat)  -> CGFloat {
        
        let normalText : NSString = textStr as NSString
        
        let size = CGSize(width: width, height:1000) //CGSizeMake(width,1000)
        
        let dic = NSDictionary(object: font, forKey : kCTFontAttributeName as! NSCopying)
        
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key:Any], context:nil).size
        
        return stringSize.height
        
    }



   /**
     
     邮箱验证
     
     */
  public class func validateEmail(email: String) -> Bool {
       if email.count == 0 {
           return false
       }
       let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
       let emailTest:NSPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
       return emailTest.evaluate(with: email)
   }
    
    /**
     
     验证手机号
     
     */
   public class func isPhoneNumber(phoneNumber:String) -> Bool {
        if phoneNumber.count == 0 {
            return false
        }
        let mobile = "^1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: phoneNumber) == true {
            return true
        }
        else
        {
            return false
        }
    }
    
   /**
     
     密码正则  6-8位字母和数字组合
     
     */
  public  class func isPasswordRuler(password:String) -> Bool {
        let passwordRule = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,8}$"
        let regexPassword = NSPredicate(format: "SELF MATCHES %@",passwordRule)
    if regexPassword.evaluate(with: password) == true {
            return true
        }else
        {
            return false
        }
    }
       
    /**
     
     验证身份证号
     
     */
  public class func isCardId(_ number: String) -> Bool {
        //判断位数
        if number.count != 15 && number.count != 18 {
            return false
        }
        var carid = number
        
        var lSumQT = 0
        
        //加权因子
        let R = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2]
        
        //校验码
        let sChecker: [Int8] = [49,48,88, 57, 56, 55, 54, 53, 52, 51, 50]
        
        //将15位身份证号转换成18位
        let mString = NSMutableString.init(string: number)
        
        if number.count == 15 {
            mString.insert("19", at: 6)
            var p = 0
            let pid = mString.utf8String
            for i in 0...16 {
                let t = Int(pid![i])
                p += (t - 48) * R[i]
            }
            let o = p % 11
            let stringContent = NSString(format: "%c", sChecker[o])
            mString.insert(stringContent as String, at: mString.length)
            carid = mString as String
        }
        
        let cStartIndex = carid.startIndex
        let cEndIndex = carid.endIndex
        let index = carid.index(cStartIndex, offsetBy: 2)
        //判断地区码
        let sProvince = String(carid[cStartIndex..<index])
        if (!self.areaCodeAt(sProvince)) {
            return false
        }
        
        //判断年月日是否有效
        //年份
        let yStartIndex = carid.index(cStartIndex, offsetBy: 6)
        let yEndIndex = carid.index(yStartIndex, offsetBy: 4)
        let strYear = Int(carid[yStartIndex..<yEndIndex])
        
        //月份
        let mStartIndex = carid.index(yEndIndex, offsetBy: 0)
        let mEndIndex = carid.index(mStartIndex, offsetBy: 2)
        let strMonth = Int(carid[mStartIndex..<mEndIndex])
        
        //日
        let dStartIndex = carid.index(mEndIndex, offsetBy: 0)
        let dEndIndex = carid.index(dStartIndex, offsetBy: 2)
        let strDay = Int(carid[dStartIndex..<dEndIndex])
        
        let localZone = NSTimeZone.local
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.timeZone = localZone
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let date = dateFormatter.date(from: "\(String(format: "%02d",strYear!))-\(String(format: "%02d",strMonth!))-\(String(format: "%02d",strDay!)) 12:01:01")
        
        if date == nil {
            return false
        }
        let paperId = carid.utf8CString
        //检验长度
        if 18 != carid.count {
            return false
        }
        //校验数字
        func isDigit(c: Int) -> Bool {
            return 0 <= c && c <= 9
        }
        for i in 0...18 {
            let id = Int(paperId[i])
            if isDigit(c: id) && !(88 == id || 120 == id) && 17 == i {
                return false
            }
        }
        //验证最末的校验码
        for i in 0...16 {
            let v = Int(paperId[i])
            lSumQT += (v - 48) * R[i]
        }
        if sChecker[lSumQT%11] != paperId[17] {
            return false
        }
        return true
    }
  
    
  public  class  func areaCodeAt(_ code: String) -> Bool {
          var dic: [String: String] = [:]
          dic["11"] = "北京"
          dic["12"] = "天津"
          dic["13"] = "河北"
          dic["14"] = "山西"
          dic["15"] = "内蒙古"
          dic["21"] = "辽宁"
          dic["22"] = "吉林"
          dic["23"] = "黑龙江"
          dic["31"] = "上海"
          dic["32"] = "江苏"
          dic["33"] = "浙江"
          dic["34"] = "安徽"
          dic["35"] = "福建"
          dic["36"] = "江西"
          dic["37"] = "山东"
          dic["41"] = "河南"
          dic["42"] = "湖北"
          dic["43"] = "湖南"
          dic["44"] = "广东"
          dic["45"] = "广西"
          dic["46"] = "海南"
          dic["50"] = "重庆"
          dic["51"] = "四川"
          dic["52"] = "贵州"
          dic["53"] = "云南"
          dic["54"] = "西藏"
          dic["61"] = "陕西"
          dic["62"] = "甘肃"
          dic["63"] = "青海"
          dic["64"] = "宁夏"
          dic["65"] = "新疆"
          dic["71"] = "台湾"
          dic["81"] = "香港"
          dic["82"] = "澳门"
          dic["91"] = "国外"
          if (dic[code] == nil) {
              return false;
          }
          return true;
      }
      
   public class func colorWithLineColor() -> UIColor? {
        return UIColor.colorWithHexString(colorString: "#EFEFEF")
    }
    
    
    
    
    // 字典或者数组 转 JSON
  public  class func DataAnyToJson(element:Any) -> String {
        
        let jsonData = try! JSONSerialization.data(withJSONObject: element, options: JSONSerialization.WritingOptions.prettyPrinted)
        let str = String(data: jsonData, encoding: String.Encoding.utf8)!
      
        return str
    }
    
    
    
     public class func getCurrentVC1() -> UIViewController? {
            var result: UIViewController? = nil
            if let window = UIApplication.shared.keyWindow{
                var keyWindow = window
             
             // UIWindow.Level window三种等级 normal，alert，statusBar,可见normal才是我们真正要用到的，这段代码就是
    //            排除其他两种level，找到所需的normalWindow
                if window.windowLevel != UIWindow.Level.normal{
                    let windows = UIApplication.shared.windows
                    for tmp in windows{
                        if tmp.windowLevel == UIWindow.Level.normal{
                            keyWindow = tmp
                            break
                        }
                    }
                }
                
                func getCurrentVC1(root:UIViewController?) -> UIViewController?{
                    var currentVC:UIViewController? = nil
                    var rootVC = root
                    
                    while rootVC?.presentationController != nil {
                        rootVC = rootVC?.presentedViewController
                    }
                    
                    if let vc = rootVC as? UITabBarController{
                        //UITabBarController.selectedViewController就是rootVC,而不是那个UITabBarController本身
                        currentVC = getCurrentVC1(root: vc.selectedViewController)
                    }else if let vc = rootVC as? UINavigationController{
                        //UINavigationController.visibleViewController才是rootVC,而不是UINavigationController本身
                        currentVC = getCurrentVC1(root: vc.visibleViewController)
                    }else{
                        //除过上面两种VC,比如UIViewController本身就是rootVC
                        currentVC = rootVC
                    }
                    
                    return currentVC
                }
                
                result = getCurrentVC1(root: keyWindow.rootViewController)
            }
            
            return result
        }
        

    
    

}





