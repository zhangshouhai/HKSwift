//
//  HKCollectionCell.swift
//  BaseFramework
//
//  Created by mac on 2020/3/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit

public class CollectionCell<T: UICollectionViewCell> {
    
    //注册cell
    static func registerClass(_ collectionView: UICollectionView) {
         collectionView.register(T.self, forCellWithReuseIdentifier:NSStringFromClass(T.self))
    }
    //注册header
    static func registerHeader(_ collectionView: UICollectionView) {
        collectionView.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(T.self))
    }
    
    //注册Footer
    static func registerFooter(_ collectionView: UICollectionView) {
        collectionView.register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(T.self))
    }
    
    //加载 collectionCell
    static func collectionView(_ collectionView: UICollectionView ,indexPath:NSIndexPath) -> T {
        let cellId = NSStringFromClass(T.self)
        let cell:T = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! T
        return cell
    }
    //加载 collection HeaderView
    static func collectionHeaderView(_ collectionView: UICollectionView ,indexPath:NSIndexPath) -> T {
        let headerView:T = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: NSStringFromClass(T.self), for: indexPath as IndexPath) as! T
           return headerView
    }
    
    
    
    //加载 collection FooterView
    static func collectionFooterView(_ collectionView: UICollectionView ,indexPath:NSIndexPath) -> T {
           let footerView:T = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: NSStringFromClass(T.self), for: indexPath as IndexPath) as! T
              return footerView
       }
    
    
     
    
    static func identifier() -> String {
        return NSStringFromClass(T.self)
    }
}
