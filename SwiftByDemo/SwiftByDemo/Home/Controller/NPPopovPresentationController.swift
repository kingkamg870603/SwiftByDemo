//
//  NPPopovPresentationController.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/20.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit

class NPPopovPresentationController: UIPresentationController {
    
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?)
    {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
    }
    
   
    override func containerViewWillLayoutSubviews() {
        self.presentedView?.frame = CGRect.init(x: 20, y: 100, width: kScreenWidth-40, height: 200)
        containerView?.insertSubview(bgView, at: 0)
    }

    lazy var bgView: UIView = {
        let bgView = UIView.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: kScreenHeight-64))
        bgView.backgroundColor = UIColor.init(white: 0.0, alpha: 0.5)
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(dissVC(_:)))
        bgView.addGestureRecognizer(tapGesture)
        return bgView
    }()
    
    func dissVC(_ sender:UITapGestureRecognizer)
   {
       // bgView.removeFromSuperview()
       presentingViewController.dismiss(animated: true, completion: nil)
    }
}
