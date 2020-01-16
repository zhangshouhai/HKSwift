//
//  HKStartAnimationView.swift
//  BaseFramework
//
//  Created by mac on 2020/1/16.
//  Copyright © 2020 DH add LK. All rights reserved.
//


import UIKit
import Foundation


class LaunchImageView: UIImageView {
    lazy var startUpimageView: UIImageView = {
        let startUpimageView = UIImageView.init()
//        startUpimageView.contentMode = .scaleAspectFill
        startUpimageView.backgroundColor = UIColor.white
        self.addSubview(startUpimageView)
        return startUpimageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        startUpimageView.frame = CGRect(x: 0, y: 0, width: kMainScreen_width, height: kMainScreen_height)
        startUpimageView.ht_startGifWithImageName(name: "launch_image1")
        startUpimageView.center = self.center
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension UIImageView {
    //MARK:工程内gif
    public func ht_startGifWithImageName(name:String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "gif") else {
            print("SwiftGif: Source for the image does not exist")
            return
        }
        self.ht_startGifWithFilePath(filePath: path)
    }
    
    //MARK:实现动图效果
    public func ht_startGifWithFilePath(filePath:String) {
        //1.加载GIF图片，并转化为data类型
        guard let data = NSData(contentsOfFile: filePath) else {return}
        //2.从data中读取数据，转换为CGImageSource
        guard let imageSource = CGImageSourceCreateWithData(data, nil) else {return}
        let imageCount = CGImageSourceGetCount(imageSource)
        //3.遍历所有图片
        var images = [UIImage]()
        var totalDuration : TimeInterval = 0
        for i in 0..<imageCount {
            //3.1取出图片
            guard let cgImage = CGImageSourceCreateImageAtIndex(imageSource, i, nil) else {continue}
            let image = UIImage(cgImage: cgImage)
            images.append(image)
            
            //3.2取出持续时间
            guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, i, nil) as? NSDictionary  else {continue}
            guard let gifDict = properties[kCGImagePropertyGIFDictionary]  as? NSDictionary else  {continue}
            guard let frameDuration = gifDict[kCGImagePropertyGIFDelayTime] as? NSNumber else {continue}
            totalDuration += frameDuration.doubleValue*2
            
        }
        
        //4.设置imageview的属性
        self.animationImages = images
        self.animationDuration = totalDuration
        self.animationRepeatCount = 1
        //5.开始播放
        self.startAnimating()
        
    }
    
    public func ht_imageStopAnimating() {
        self.stopAnimating()
    }
    
    
}
