//
//  MainVC.swift
//  JLSwiftProject
//
//  Created by UCS on 2018/3/12.
//  Copyright © 2018年 www.ucsdigital.com. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.layer.shadowColor = UIColor.red.cgColor
        self.tabBar.layer.shadowOpacity = 0.5;
        self.tabBar.layer.shadowOffset = CGSize(width:0, height:-1);
        self.tabBar.layer.shadowRadius = 3;
        
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


extension MainVC{
    
    private func creatSubVC() {
        //创建子控制器
        let classNameArr = ["Home", "Hear", "Find", "Mine"]
        let moduleNameArr = ["首页", "我听", "发现", "我的"]
        
        var tabArr: [UIViewController] = []
        
//        let projectName = self.getProjectName()
        
//        for i in 0..classNameArr.count {
//
////            let clsName = classNameArr[i]
////            let lowStr = claName
//
//            let navVc = UIViewController(: vc)
//
//
//        }
        
        
        
    }
    
    
    
}















