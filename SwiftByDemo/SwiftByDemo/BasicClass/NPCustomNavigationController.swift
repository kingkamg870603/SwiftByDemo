//
//  NPCustomNavigationController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/16.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPCustomNavigationController: UINavigationController , UIGestureRecognizerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
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

    func setupUI()
    {
        //设置右划手势的代理为自己
        self.interactivePopGestureRecognizer?.delegate = self
        //导航栏背景色
        navigationBar.barTintColor = UIColor(netHex: kColorIconBlack, alpha: 1)
        //导航栏字体颜色
        navigationBar.tintColor = UIColor(netHex: kColorIconyYellow, alpha: 1)
        //导航默认字体富文本设置
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor(netHex: kColorIconyYellow, alpha: 1)]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        //重写左侧返回按钮
        super.pushViewController(viewController, animated: true )
        //设置右划返回为true
        self.interactivePopGestureRecognizer?.isEnabled = true
        //创建返回按钮
        if viewController.navigationItem.leftBarButtonItem==nil&&self.viewControllers.count>1{
            
    
            let backBtn = UIButton.init(type: UIButtonType.custom);
            backBtn.frame = CGRect.init(x: 0, y: 0, width: 20, height: 44);
            let backImg=UIImage(named: "back")
            backBtn.setImage(backImg, for: UIControlState.normal)
            backBtn.addTarget(self,action:#selector(popSelf),for:.touchUpInside);

            let leftBarItem = UIBarButtonItem.init(customView: backBtn);
            
            //用于消除左边空隙，要不然按钮顶不到最前面
            let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
            spacer.width = -10;

            viewController.navigationItem.leftBarButtonItems=[spacer, leftBarItem]
 
        }
        
    }
    
    func popSelf(){
        //返回上一级
        self.popViewController(animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        //设置状态栏的前景色为白色
        return UIStatusBarStyle.lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation
    {
        //设置状态栏改变动画
        return UIStatusBarAnimation.slide
    }
  
}
