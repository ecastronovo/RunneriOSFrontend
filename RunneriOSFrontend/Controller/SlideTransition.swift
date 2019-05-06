//
//  SlideInTransition.swift
//  RunneriOSFrontend
//
//  Created by Eric Castronovo on 5/6/19.
//  Copyright © 2019 Eric Castronovo. All rights reserved.
//
import UIKit

class SlideTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    let dimmingView = UIView()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from)
            else {return}
        
        let containerView = transitionContext.containerView
        
        let finalWidth = toViewController.view.bounds.width * 0.8
        let finalHeight = toViewController.view.bounds.height
        
        if isPresenting{
            containerView.addSubview(dimmingView)
            dimmingView.alpha = 0.0
            dimmingView.frame = containerView.bounds
            
            containerView.addSubview(toViewController.view)
            
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0, width: finalWidth, height: finalHeight)
        }
        
        let transform = {
            self.dimmingView.alpha = 0.8
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
        }
        
        let identity = {
            self.dimmingView.alpha = 0.0
            fromViewController.view.transform = .identity
        }
        
        let duration = transitionDuration(using: transitionContext)
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            self.isPresenting ? transform() : identity()
        }) {(_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
    
}
