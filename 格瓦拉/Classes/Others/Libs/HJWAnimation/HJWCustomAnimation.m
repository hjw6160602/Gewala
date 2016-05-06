//
//  HJWCustomAnimation.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWCustomAnimation.h"

@implementation HJWCustomAnimation

@synthesize animationBlock = _animationBlock;

#pragma mark - NSObject

- (id)copyWithZone:(NSZone *)zone {
    HJWCustomAnimation *copy = [super copyWithZone:zone];
    if (copy == nil) return nil;

    copy->_animationBlock = [_animationBlock copy];

    return copy;
}

@end
