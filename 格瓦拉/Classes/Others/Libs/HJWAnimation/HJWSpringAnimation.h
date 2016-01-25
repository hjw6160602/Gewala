//
//  HJWSpringAnimation.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "HJWAnimation.h"

@interface HJWSpringAnimation : HJWAnimation

@property (readwrite, nonatomic, assign) CGFloat damping;
/** 质量 */
@property (readwrite, nonatomic, assign) CGFloat mass;
/** 僵硬度 */
@property (readwrite, nonatomic, assign) CGFloat stiffness;
/** 速度 */
@property (readwrite, nonatomic, assign) CGFloat velocity;

@property (readwrite, nonatomic, strong) id fromValue;
@property (readwrite, nonatomic, strong) id toValue;

@property (readwrite, nonatomic, assign) BOOL allowsOverdamping;

- (CFTimeInterval)durationForEpsilon:(double)epsilon;

@end
