//
//  FourViewControlller.swift
//  BaseFramework
//
//  Created by mac on 2019/12/5.
//  Copyright © 2019 DH add LK. All rights reserved.
//

import UIKit
import FWCycleScrollView


class FourViewController: HKBaseViewController {

    let netAdArray = ["https://img.51miz.com/Element/00/59/51/04/bf708b6a_E595104_b0011444.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fh/630",
                         "https://img.51miz.com/Element/00/59/51/04/bf708b6a_E595104_b0011444.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fh/630",
                         "https://img.51miz.com/Element/00/59/31/31/0834e26b_E593131_7d289e8c.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fh/630",
                         "https://img.51miz.com/Element/00/59/47/06/e06086f3_E594706_2ed6eda9.jpg!/quality/90/unsharp/true/compress/true/format/jpg/fh/630"]
    
    
    /// 例二：点击广告位回调、纵向滚动、自定义分页控件
    lazy var cycleScrollView2: FWCycleScrollView = {
        
        let cycleScrollView = FWCycleScrollView.cycleAll(frame: CGRect(x: 0, y: kMainTopHeight, width: self.view.frame.width, height: 180), localizationImageNameArray: nil, imageUrlStrArray: netAdArray, placeholderImage: UIImage(named: "ad_placeholder"), viewArray: nil, loopTimes: 100, contentMode: .scaleAspectFit)
        
        cycleScrollView.backgroundColor = UIColor.orange
        cycleScrollView.autoScrollTimeInterval = 5.0
    
        // 对自定义也分控件的设置
        cycleScrollView.pageControlAliment = .right
        cycleScrollView.currentPageDotEnlargeTimes = 1.0
        cycleScrollView.customDotViewType = .solid
        cycleScrollView.pageControlDotSize = CGSize(width: 10, height:10)
        cycleScrollView.scrollDirection = .horizontal
        cycleScrollView.currentPageDotColor = UIColor.red
        cycleScrollView.pageDotColor = UIColor.lightGray
        cycleScrollView.pageControlMargin = 15
        
        cycleScrollView.itemDidClickedBlock = { (index) in
            print("当前点击了第\(index + 1)个广告位")
        }
        cycleScrollView.itemDidScrollBlock = { (index) in
            // print("当前轮播到了第\(index + 1)个广告位")
        }
        
        return cycleScrollView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.cycleScrollView2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
