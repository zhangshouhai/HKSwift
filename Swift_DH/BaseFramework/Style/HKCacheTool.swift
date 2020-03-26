//
//  HKCacheTool.swift
//  BaseFramework
//
//  Created by mac on 2020/3/24.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit

class HKCacheTool: NSObject {

    // 计算缓存大小
    static var cacheSize: String{
        
        /// 取出cache文件夹目录，缓存文件都在这个目录下
        let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
        
        /// 取出文件夹下所有文件数组
        let fileArr = FileManager.default.subpaths(atPath: cachePath!)
        
        var size: Float = 0
        
        for file in fileArr!
        {
            /// 把文件名拼接到路径中
            let path = cachePath?.appending("/\(file)")
            
            /// 取出文件属性
            let floder = try! FileManager.default.attributesOfItem(atPath: path!)
            /// 用元组取出文件大小属性
            for (key, value) in floder
            {
                /// 累加文件大小
                if key == FileAttributeKey.size
                {
                    size += (value as AnyObject).floatValue
                }
            }
        }
    
        let sizeStr:String =  String(format: "%.2fM", size / 1024 / 1024) //"\(size / 1024 / 1024)"+"M"
        
        return sizeStr
        
        
    }
    
    // 清除缓存
    class func clearCache(){
       /// 取出cache文件夹目录，缓存文件都在这个目录下
       let cachePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first
       
       // 取出文件夹下所有文件数组
       let fileArr = FileManager.default.subpaths(atPath: cachePath!)
       
       // 遍历删除
       for file in fileArr!
       {
           let path = cachePath?.appending("/\(file)")
           if FileManager.default.fileExists(atPath: path!)
           {
               do
               {
                   try FileManager.default.removeItem(atPath: path!)
               }
               catch
               {
                   
               }
           }
       }
    }
}
