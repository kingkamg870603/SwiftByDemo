//
//  NPPopovAnimation.swift
//  SwiftByDemo
//
//  Created by kingkamg on 2016/11/20.
//  Copyright © 2016年 QB. All rights reserved.
//

import UIKit
let kTitleMenuWillShow = "kTitleMenuWillShow"
let kTitleMenuWillDiss = "kTitleMenuWillDiss"
class NPPopovAnimation: NSObject,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning
{
    var bMenuExtent = false
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController?
    {
        return NPPopovPresentationController.init(presentedViewController: presented, presenting: presenting)
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        bMenuExtent = true
    
       NotificationCenter.default.post(name:NSNotification.Name(rawValue: kTitleMenuWillShow), object: self, userInfo: ["name":"titleMenu","bExt":true])
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        bMenuExtent = false
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: kTitleMenuWillDiss), object: self, userInfo: ["name":"titleMenu","bExt":false])
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
    {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let FromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        print(toVC!)
        print(FromVC!)
        
        if bMenuExtent == true
        {
            print("begin animation")
            let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
            transitionContext.containerView.addSubview(toView!)
            toView?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0)
            toView?.layer.anchorPoint = CGPoint.init(x: 0.5, y: 0)
            UIView.animate(withDuration: 0.5, animations: {
                toView?.transform = CGAffineTransform.identity
            }, completion: { (_) in
                transitionContext.completeTransition(true)
            })
        }
        else
        {
            print("end animation")
            
            let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            UIView.animate(withDuration: 0.2, animations: {
                fromView?.transform = CGAffineTransform.init(scaleX: 1.0, y: 0.000001)
            }, completion: { (_) in
                transitionContext.completeTransition(true)
                fromView?.removeFromSuperview()
            })
            
        }
        
    }
}
