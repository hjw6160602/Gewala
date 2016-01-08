//
//  CAAnimation+HJWTabBarViewAnimations.h
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAAnimation (YALTabBarViewAnimations)

+ (CAAnimation *)animationForAdditionalButton;
+ (CAAnimation *)animationForExtraLeftBarItem;
+ (CAAnimation *)animationForExtraRightBarItem;
+ (CAAnimation *)animationForTabBarExpandFromRect:(CGRect)fromRect toRect:(CGRect)toRect;
+ (CAAnimation *)animationForTabBarCollapseFromRect:(CGRect)fromRect toRect:(CGRect)toRect;
+ (CAAnimation *)animationForCenterButtonExpand;
+ (CAAnimation *)animationForCenterButtonCollapse;
+ (CAAnimation *)showSelectedDotAnimation;

@end
