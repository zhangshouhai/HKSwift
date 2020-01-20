//
//  HomeViewController.swift
//  BaseFramework
//
//  Created by 张寿海 on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//
import UIKit
import SnapKit


class HomeViewController: HKBaseViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {

    //导航栏标题
    lazy var navSeacheView:DHNavSeachView = {
        let navView = DHNavSeachView()
        return navView
    }()

    
    lazy var homeCollectionView:UICollectionView = {
         
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.vertical     //滚动方向
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
     
        let homeCollectionView1  = UICollectionView.init(frame: CGRect(x: 0, y: kMainTopHeight, width: kMainScreen_width, height: (kMainScreen_height - kMainTopHeight - kMainBottomHeight)), collectionViewLayout: layout)
        homeCollectionView1.delegate = self
        homeCollectionView1.dataSource = self
        homeCollectionView1.backgroundColor = UIColor.white
        

//        //注册一个cell
        homeCollectionView1.register(DHHomeCell.self, forCellWithReuseIdentifier:"DHHomeCell")
        
        homeCollectionView1.register(DHHomeSecondCell.self, forCellWithReuseIdentifier:"DHHomeSecondCell")
        
        homeCollectionView1.register(DHHomeThreeCell.self, forCellWithReuseIdentifier:"DHHomeThreeCell")
        
         homeCollectionView1.register(DHHomefourCell.self, forCellWithReuseIdentifier:"DHHomefourCell")
        
        

        //注册headerView
        homeCollectionView1.register(DHHomeTopView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopView")
        
        homeCollectionView1.register(DHHomeTopSecondView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopSecondView")
        
        homeCollectionView1.register(DHHomeTopThreeView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopThreeView")
        
        
        
        //注册FooterView
         homeCollectionView1.register(DHHomeFootView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "DHHomeFootView")
        
        return homeCollectionView1
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.titleLabel.text = "导航栏"
        self.navView?.isHidden = true
        
        self.view.addSubview(navSeacheView)
        navSeacheView.frame = CGRect(x: 0, y: 0, width: kMainScreen_width, height: kMainTopHeight)
 
        self.view.addSubview(self.homeCollectionView)


    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
           return 4
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if section == 0 {
            return 3
        }
        else if section == 1 {
            return 5
        }
        else if section == 2 {
            return 3
        }
        else{
            return 6
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
             return CGSize.init(width: kMainScreen_width / 3, height: HKFixHeightFlaot(110.0))
        }
        else if indexPath.section == 1 {
             return CGSize.init(width: kMainScreen_width / 5, height: HKFixHeightFlaot(80.0))
        }
        else if indexPath.section == 2 {
             return CGSize.init(width: kMainScreen_width / 3, height: HKFixHeightFlaot(75.0))
        }
        else{
            
            return CGSize.init(width: kMainScreen_width , height: HKFixHeightFlaot(90.0))
        }
        
    }
        
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        
        if indexPath.section == 0 {
            let itemCell: DHHomeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DHHomeCell", for: indexPath) as! DHHomeCell
                 if indexPath.row == 0 {
                     itemCell.titleLabel?.text = "找医生"
                     itemCell.subtitleLabel?.text = "61万+医生"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_03")
                 }
                 if indexPath.row == 1 {
                     itemCell.titleLabel?.text = "去挂号"
                     itemCell.subtitleLabel?.text = "全国913家医院"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_08")
                 }
                 if indexPath.row == 2 {
                     itemCell.titleLabel?.text = "去就诊"
                     itemCell.subtitleLabel?.text = "院内就诊更方便"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_07")
                 }

                 return itemCell;
        }
        else if indexPath.section == 1{
            let itemCell: DHHomeSecondCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DHHomeSecondCell", for: indexPath) as! DHHomeSecondCell
                 if indexPath.row == 0 {
                     itemCell.titleLabel?.text = "健康自测"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_13")
                     
                 }
                 if indexPath.row == 1 {
                     itemCell.titleLabel?.text = "我要体检"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_16-7")
                     
                 }
                 if indexPath.row == 2 {
                     itemCell.titleLabel?.text = "送药上门"
                    itemCell.iocnImageView?.image = UIImage(named: "首页_18-8")
                     
                 }
            if indexPath.row == 3 {
                itemCell.titleLabel?.text = "我要减肥"
                itemCell.iocnImageView?.image = UIImage(named: "首页_16")
                
            }
            if indexPath.row == 4 {
                itemCell.titleLabel?.text = "护工月嫂"
                itemCell.iocnImageView?.image = UIImage(named: "首页_18")
                
            }

                return itemCell;
        }
       else if indexPath.section == 2{
             let itemCell: DHHomeThreeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DHHomeThreeCell", for: indexPath) as! DHHomeThreeCell
            
            if indexPath.row == 0 {
                itemCell.loadHomeThreeCell(titleString: "消灭豆豆", subtitleStr: "恢复光滑美肌", backColor: "#ECFFF7", titleColor: "#00E1CA")
            }
            if indexPath.row == 1 {
                itemCell.loadHomeThreeCell(titleString: "体检解读", subtitleStr: "看懂检验报告", backColor: "#ECF8FE", titleColor: "#009EF8")
            }
            if indexPath.row == 2 {
                itemCell.loadHomeThreeCell(titleString: "男性专病区", subtitleStr: "直面难言之隐", backColor: "#FFEFEC", titleColor: "#FF993B")
            }
            
            return itemCell;
        }
        
        else {
            let itemCell: DHHomefourCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DHHomefourCell", for: indexPath) as! DHHomefourCell
            
            itemCell.loadHomefourCell(titleString: "")
                   
             return itemCell;
        }
        
        
       }
    
     
        
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            
        if section == 0 {
             return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(150.0))
        }
        else if section == 1{
            return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(8))
        }
        else {
             return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(50.0))
        }
          
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
             return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(0))
        }
       else if section == 1{
            return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(40))
            
        }
        else {
             return CGSize.init(width: kMainScreen_width, height: HKFixHeightFlaot(0))
        }
    }
        
       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            
           if kind == UICollectionElementKindSectionHeader{
              
            if indexPath.section == 0 {
                let headerView:DHHomeTopView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopView", for: indexPath) as! DHHomeTopView
                           headerView.loadHomeTopHeader(titleString:"")
                           
                           
                           return headerView
            }
  
            else  if indexPath.section == 1 {
                let headerView:DHHomeTopSecondView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopSecondView", for: indexPath) as! DHHomeTopSecondView
                 return headerView
            }
                
            else  if indexPath.section == 2{
                
                let headerView:DHHomeTopThreeView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopThreeView", for: indexPath) as! DHHomeTopThreeView
                headerView.loadHomeheaderCell(titleString: "健康加油站", subtitleStr: "更专业的健康加油站")
                return headerView
            }
           else{
               
               let headerView:DHHomeTopThreeView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "DHHomeTopThreeView", for: indexPath) as! DHHomeTopThreeView
               headerView.loadHomeheaderCell(titleString: "医生专家课（13）", subtitleStr: "")
               return headerView
           }
            
            
                
           }else if kind == UICollectionElementKindSectionFooter{
            if indexPath.section == 0{
                 return UICollectionReusableView()
            }
           else if indexPath.section == 1{
                
                let footerView:DHHomeFootView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "DHHomeFootView", for: indexPath) as! DHHomeFootView
                return footerView
            }
            else{
                 return UICollectionReusableView()
            }
                
           }

            return UICollectionReusableView()
          
       }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
             print("当前点击第\(indexPath.section + 1)组，第\(indexPath.item + 1)个Item")
        
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                //找医生
                let vc = HKLookDortorVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
            if indexPath.row == 2 {
                let vc = HKSeeDortorVC()
                self.navigationController?.pushViewController(vc, animated: true)
            }
            
        }
        
        
             
        }
    

}
