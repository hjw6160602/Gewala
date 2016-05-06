//
//  HJWAnimation.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWBlockBasedArray.h"
#import "HJWLinearInterpolation.h"

#import "HJWAnimation.h"

@interface HJWAnimation ()

@end

@implementation HJWAnimation

#pragma mark - KVO

+ (NSSet *)keyPathsForValuesAffectingValues {
    return [NSSet setWithArray:@[ @"animationBlock", @"duration" ]];
}

#pragma mark - CAKeyframeAnimation

- (NSArray *)values {
    HJWAnimationBlock block = [self.animationBlock copy];

    CGFloat duration = self.duration;

    return [HJWBlockBasedArray arrayWithCount:duration * 60 block:^id(NSUInteger idx) {
        return block(idx / 60.0, duration);
    }];
}

#pragma mark - Unavailable

- (void)setPath:(CGPathRef)path {
    return;
}

- (CGPathRef)path {
    return NULL;
}

- (void)setRotationMode:(NSString *)rotationMode {
    return;
}

- (NSString *)rotationMode {
    return nil;
}

- (void)setValues:(NSArray *)values {
    return;
}

@end
