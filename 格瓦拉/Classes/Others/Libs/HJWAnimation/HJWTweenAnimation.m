//
//  HJWTweenAnimation.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//


#import "HJWLinearInterpolation.h"

#import "HJWTweenAnimation.h"

@implementation HJWTweenAnimation

#pragma mark - Lifecycle

- (id)init {
    self = [super init];
    if (self == nil) return nil;

    self.easing = HJWEasingFunctionLinear;

    return self;
}

#pragma mark - KVO

+ (NSSet *)keyPathsForValuesAffectingAnimationBlock {
    return [NSSet setWithArray:@[ @"from", @"to", @"easing" ]];
}

#pragma mark - HJWAnimation

- (HJWAnimationBlock)animationBlock {
    NSParameterAssert(self.easing != nil);

    HJWEasingFunction easing = [self.easing copy];
    HJWLinearInterpolation lerp = HJWInterpolate(self.fromValue, self.toValue);

    return ^(CGFloat elapsed, CGFloat duration) {
        return lerp(easing(elapsed / duration));
    };
}

#pragma mark - NSObject

- (id)copyWithZone:(NSZone *)zone {
    HJWTweenAnimation *copy = [super copyWithZone:zone];
    if (copy == nil) return nil;

    copy->_easing = _easing;

    copy->_fromValue = _fromValue;
    copy->_toValue = _toValue;

    return copy;
}

@end
