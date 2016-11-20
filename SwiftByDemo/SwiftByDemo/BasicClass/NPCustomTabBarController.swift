//
//  NPCustomTabBarController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/16.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPCustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //bar的背景色
        tabBar.barTintColor = UIColor(netHex: kColorIconBlack, alpha: 1)
        //bar的前景色
        tabBar.tintColor = UIColor(netHex: kColorIconyYellow, alpha: 1)
        let homeVC = UIStoryboard.init(name: "Home", bundle: Bundle.main).instantiateInitialViewController()
//        homeViewController?.tabBarItem.title = "首页"
        homeVC?.tabBarItem = UITabBarItem.init(title: "首页", image: #imageLiteral(resourceName: "homebar_normal"), selectedImage: #imageLiteral(resourceName: "homebar_select"))
        addChildViewController(homeVC!)
        
        let informVC = UIStoryboard.init(name: "Inform", bundle: Bundle.main).instantiateInitialViewController()
        informVC?.tabBarItem = UITabBarItem.init(title: "通知", image: #imageLiteral(resourceName: "infor_normal"), selectedImage: #imageLiteral(resourceName: "infor_select"))
        addChildViewController(informVC!)
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
