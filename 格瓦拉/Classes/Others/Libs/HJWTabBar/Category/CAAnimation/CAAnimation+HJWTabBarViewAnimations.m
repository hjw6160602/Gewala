//
//  CAAnimation+HJWTabBarViewAnimations.m
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "CAAnimation+HJWTabBarViewAnimations.h"
#import "HJWSpringAnimation.h"
#import "HJWAnimatingTabBarConstants.h"

@implementation CAAnimation (HJWTabBarViewAnimations)

#pragma mark - Additional buttons animations
+ (CAAnimation *)animationForItem{
    CABasicAnimation *translationX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    translationX.fromValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleX.fromValue);
    translationX.toValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleX.toValue);
    translationX.duration = kHJWAdditionalButtonsAnimationsParameters.scaleX.duration;
    return translationX;
}


+ (CAAnimation *)animationForAdditionalButton {
    CABasicAnimation *scaleX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.fromValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleX.fromValue);
    scaleX.toValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleX.toValue);
    scaleX.duration = kHJWAdditionalButtonsAnimationsParameters.scaleX.duration;
    
    CABasicAnimation *scaleY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.fromValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleY.fromValue);
    scaleY.toValue = @(kHJWAdditionalButtonsAnimationsParameters.scaleY.toValue);
    scaleY.duration = kHJWAdditionalButtonsAnimationsParameters.scaleY.duration;
  
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = @(kHJWAdditionalButtonsAnimationsParameters.rotation.fromValue);
    rotation.toValue = @(kHJWAdditionalButtonsAnimationsParameters.rotation.toValue);
    rotation.duration = kHJWAdditionalButtonsAnimationsParameters.rotation.duration;
    rotation.fillMode = kCAFillModeForwards;
    rotation.removedOnCompletion = NO;
    
    HJWSpringAnimation *bouncedRotation = [self rotationBouncedAnimationFromValue:kHJWAdditionalButtonsAnimationsParameters.bounce.fromValue
                                                                          toValue:kHJWAdditionalButtonsAnimationsParameters.bounce.toValue];
    bouncedRotation.beginTime = kHJWAdditionalButtonsAnimationsParameters.bounce.beginTime;
    
    return [self groupWithAnimations:@[scaleX, scaleY, rotation, bouncedRotation] andDuration:kHJWExpandAnimationDuration];
}

#pragma mark - Extra buttons animations

+ (CAAnimation *)animationForExtraLeftBarItem {
    return [HJWSpringAnimation animationWithKeyPath:@"transform.rotation.z"
                                           duration:kHJWExtraLeftTabBarItemAnimationParameters.duration
                                            damping:kHJWExtraLeftTabBarItemAnimationParameters.damping
                                           velocity:kHJWExtraLeftTabBarItemAnimationParameters.velocity
                                          fromValue:kHJWExtraLeftTabBarItemAnimationParameters.fromValue
                                            toValue:kHJWExtraLeftTabBarItemAnimationParameters.toValue];
}

+ (CAAnimation *)animationForExtraRightBarItem {
    return [HJWSpringAnimation animationWithKeyPath:@"transform.rotation.z"
                                           duration:kHJWExtraRightTabBarItemAnimationParameters.duration
                                            damping:kHJWExtraRightTabBarItemAnimationParameters.damping
                                           velocity:kHJWExtraRightTabBarItemAnimationParameters.velocity
                                          fromValue:kHJWExtraRightTabBarItemAnimationParameters.fromValue
                                            toValue:kHJWExtraRightTabBarItemAnimationParameters.toValue];
}

#pragma mark - Tab bar view animations

+ (CAAnimation *)animationForTabBarExpandFromRect:(CGRect)fromRect toRect:(CGRect)toRect {
    return [HJWSpringAnimation animationForRoundedRectPathWithduration:kHJWTabBarExpandAnimationParameters.duration
                                                               damping:kHJWTabBarExpandAnimationParameters.damping
                                                              velocity:kHJWTabBarExpandAnimationParameters.velocity
                                                             fromValue:fromRect
                                                               toValue:toRect];
}

+ (CAAnimation *)animationForTabBarCollapseFromRect:(CGRect)fromRect toRect:(CGRect)toRect {
    return [HJWSpringAnimation animationForRoundedRectPathWithduration:kHJWTabBarCollapseAnimationParameters.duration
                                                               damping:kHJWTabBarCollapseAnimationParameters.damping
                                                              velocity:kHJWTabBarCollapseAnimationParameters.velocity
                                                             fromValue:fromRect
                                                               toValue:toRect];
}

#pragma mark - Center button animation

+ (CAAnimation *)animationForCenterButtonExpand {
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = @(kHJWCenterButtonExpandAnimationParameters.rotation.fromValue);
    rotation.toValue = @(kHJWCenterButtonExpandAnimationParameters.rotation.toValue);
    rotation.duration = kHJWCenterButtonExpandAnimationParameters.rotation.duration;
    rotation.fillMode = kCAFillModeForwards;
    rotation.removedOnCompletion = NO;
    
    HJWSpringAnimation *bouncedRotation = [self rotationBouncedAnimationFromValue:kHJWCenterButtonExpandAnimationParameters.bounce.fromValue
                                                                          toValue:kHJWCenterButtonExpandAnimationParameters.bounce.toValue];
    bouncedRotation.beginTime = kHJWCenterButtonExpandAnimationParameters.bounce.beginTime;
    
    return [self groupWithAnimations:@[rotation, bouncedRotation] andDuration:kHJWExpandAnimationDuration];
}

+ (CAAnimation *)animationForCenterButtonCollapse {
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotation.fromValue = @(kHJWCenterButtonCollapseAnimationParameters.rotation.fromValue);
    rotation.toValue = @(kHJWCenterButtonCollapseAnimationParameters.rotation.toValue);
    rotation.duration = kHJWCenterButtonCollapseAnimationParameters.rotation.duration;
    rotation.fillMode = kCAFillModeForwards;
    rotation.removedOnCompletion = NO;

    HJWSpringAnimation *bouncedRotation = [self rotationBouncedAnimationFromValue:kHJWCenterButtonCollapseAnimationParameters.bounce.fromValue
                                                                          toValue:kHJWCenterButtonCollapseAnimationParameters.bounce.toValue];
    bouncedRotation.beginTime = kHJWCenterButtonCollapseAnimationParameters.bounce.beginTime;
    
    return [self groupWithAnimations:@[rotation, bouncedRotation] andDuration:kHJWExpandAnimationDuration];
}

+ (CAAnimation *)showSelectedDotAnimation {
    CABasicAnimation *scaleX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleX.fromValue = @(kHJWSelectedDotAnimationsParameters.scaleX.fromValue);
    scaleX.toValue = @(kHJWSelectedDotAnimationsParameters.scaleX.toValue);
    scaleX.duration = kHJWSelectedDotAnimationsParameters.scaleX.duration;
    
    CABasicAnimation *scaleY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.fromValue = @(kHJWSelectedDotAnimationsParameters.scaleY.fromValue);
    scaleY.toValue = @(kHJWSelectedDotAnimationsParameters.scaleY.toValue);
    scaleY.duration = kHJWSelectedDotAnimationsParameters.scaleY.duration;
    
    return [self groupWithAnimations:@[scaleX, scaleY] andDuration:kHJWExpandAnimationDuration / 2];
}

#pragma mark - Helpers -

#pragma mark Group

+ (CAAnimationGroup *)groupWithAnimations:(NSArray *)animations andDuration:(CFTimeInterval)duration {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = duration;
    group.animations = animations;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    return group;
}

#pragma mark Rotation bounce animation

+ (HJWSpringAnimation *)rotationBouncedAnimationFromValue:(double)fromValue toValue:(double)toValue {
    return [HJWSpringAnimation animationWithKeyPath:@"transform.rotation.z"
                                           duration:kHJWBounceAnimationParameters.duration
                                            damping:kHJWBounceAnimationParameters.damping
                                           velocity:kHJWBounceAnimationParameters.velocity
                                          fromValue:fromValue
                                            toValue:toValue];
}

@end
