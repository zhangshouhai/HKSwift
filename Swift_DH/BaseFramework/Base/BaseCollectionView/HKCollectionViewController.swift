//
//  HKCollectionViewController.swift
//  BaseFramework
//
//  Created by mac on 2020/3/20.
//  Copyright © 2020 DH add LK. All rights reserved.
//

import UIKit

class HKCollectionViewController: HKBaseViewController{
    

     lazy var collectionView:UICollectionView = {
             
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = UICollectionView.ScrollDirection.vertical     //滚动方向
            layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
         
            let collectionView  = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = UIColor.white

            return collectionView
        }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0);
            make.top.equalTo(kMainTopHeight)
            make.bottom.equalTo(0);
        }
    }
    
    
}


extension HKCollectionViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(0))
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
              
          return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(0))
    }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
           return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(0))
      }
          
         func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
              
            if kind == UICollectionView.elementKindSectionHeader{
                  
            }
            else if kind == UICollectionView.elementKindSectionFooter{
           
            }
              
            return UICollectionReusableView()
            
        }
      
      
      func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("当前点击第\(indexPath.section + 1)组，第\(indexPath.item + 1)个Item")
          
         
              
    }

   
}
