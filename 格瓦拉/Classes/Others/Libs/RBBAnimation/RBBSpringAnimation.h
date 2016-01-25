//
//  RBBSpringAnimation.h
//  RBBAnimation
//
//  Created by Robert Böhnke on 10/14/13.
//  Copyright (c) 2013 Robert Böhnke. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "RBBAnimation.h"

@interface RBBSpringAnimation : RBBAnimation

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
