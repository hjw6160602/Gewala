//
//  HJWTransitionAnimate.m
//  格瓦拉
//
//  Created by shoule on 16/1/22.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//


#import "HJWTransitionAnimate.h"

@interface HJWTransitionAnimate()

@end

@implementation HJWTransitionAnimate

// This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
// synchronize with the main animation.

//指定转场动画持续的时长
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3f;
}

//转场动画的具体内容
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
//    let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! FirstViewController
//    let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! SecondViewController
//    let container = transitionContext.containerView()
//    container.addSubview(toVC.view)
//    container.bringSubviewToFront(fromVC.view)
//    
//    //改变m34
//    var transfrom = CATransform3DIdentity
//    transfrom.m34 = -0.002
//    container.layer.sublayerTransform = transfrom
//    
//    //设置anrchPoint 和 position
//    let initalFrame = transitionContext.initialFrameForViewController(fromVC)
//    toVC.view.frame = initalFrame
//    fromVC.view.frame = initalFrame
//    fromVC.view.layer.anchorPoint = CGPointMake(0, 0.5)
//    fromVC.view.layer.position = CGPointMake(0, initalFrame.height / 2.0)
//    []
//    
//    //动画
//    UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
//        fromVC.view.layer.transform = CATransform3DMakeRotation(CGFloat(-M_PI_2), 0, 1, 0)
//        shadow.alpha = 1.0
//    }) { (finished: Bool) -> Void in
//        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.5)
//        fromVC.view.layer.position = CGPointMake(CGRectGetMidX(initalFrame), CGRectGetMidY(initalFrame))
//        fromVC.view.layer.transform = CATransform3DIdentity
//        shadow.removeFromSuperview()
//        
//        transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
//    }
}


@end
