//
//  HJWSpringAnimation.h
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface HJWSpringAnimation : CAKeyframeAnimation

+ (instancetype)animationWithKeyPath:(NSString *)keyPath
                            duration:(CFTimeInterval)duration
                             damping:(double)damping
                            velocity:(double)velocity
                           fromValue:(double)fromValue
                             toValue:(double)toValue;

+ (instancetype)animationForRoundedRectPathWithduration:(CFTimeInterval)duration
                                                damping:(double)damping
                                               velocity:(double)velocity
                                              fromValue:(CGRect)fromValue
                                                toValue:(CGRect)toValue;

@end
