//
//  NPInterestViewController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/15.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

@objc protocol interestDelegate: NSObjectProtocol
{
   @objc optional func chooseInterest(viewController:NPInterestViewController, dataArray:[[String:String]]);
}

class NPInterestViewController: UIViewController {

    var delegate:interestDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        self.view.addSubview(finishBtn);
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

    //MARK: ------------------------lazyloading-----------------------------
    /**
     完成选择
    */
    
    lazy var finishBtn: UIButton = {
        let finishBtn = UIButton.init(type: UIButtonType.custom);
        finishBtn.setTitle("完成", for: UIControlState.normal);
        finishBtn.frame = CGRect.init(x: 10, y: 100, width: kScreenWidth-20, height: 30);
        finishBtn.setTitleColor(UIColor.green, for: UIControlState.normal);
        finishBtn.addTarget(self, action: #selector(finishAction(_:)), for: UIControlEvents.touchUpInside);
        return finishBtn;
    }();
    
    //MARK: ------------------------Event respond-----------------------------
    
   
    func finishAction(_ sender:UIButton) -> Void
    {
        if ((delegate) != nil)
        {
            delegate?.chooseInterest!(viewController: self, dataArray:[["name":"跳远", "imageName":"tiaoyuan"], ["name":"游泳", "imageName":"youyong"]])
        }
        return;
    }

}
