//
//  LOTransition.swift
//  tran
//
//  Created by Lova on 2016/12/13.
//  Copyright © 2016年 Lova. All rights reserved.
//

import UIKit

class LOTransition: NSObject {
    var fromView = UIView()

    var isPresenting = false

    init(from: UIView) {
        self.fromView = from
    }
}

extension LOTransition: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    //MARK: UIViewControllerTransitioningDelegate
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }

    //MARK: UIViewControllerAnimatedTransitioning
    var duration: Double {
        return 1
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromController = transitionContext.viewController(forKey: .from),
            //            let fromView = transitionContext.view(forKey: .from),
        //        let toController = transitionContext.viewController(forKey: .to),
        //            let toVIew = transitionContext.view(forKey: .to),
        let app = UIApplication.shared.delegate as? AppDelegate,
            let window = app.window else {
                return
        }

        transitionContext.containerView.clipsToBounds = true
        transitionContext.containerView.backgroundColor = UIColor.white

        UIView.animate(withDuration: 0.3, animations: {
            fromController.view.alpha = 0
        })

        UIView.animate(withDuration: self.duration, animations: {
            //            toController.view.frame = finalRect
            transitionContext.containerView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            transitionContext.containerView.center = window.center
        }) { animate in

            transitionContext.completeTransition(true)
        }
    }
}
