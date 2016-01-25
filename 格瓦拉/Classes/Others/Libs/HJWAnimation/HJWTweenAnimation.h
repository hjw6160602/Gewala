//
//  HJWTweenAnimation.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//
#import "HJWAnimation.h"

#import "HJWEasingFunction.h"

@interface HJWTweenAnimation : HJWAnimation

@property (readwrite, nonatomic, strong) NSValue *fromValue;
@property (readwrite, nonatomic, strong) NSValue *toValue;

@property (readwrite, nonatomic, copy) HJWEasingFunction easing;

@end
