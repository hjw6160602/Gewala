//
//  HJWAnimation.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef id (^HJWAnimationBlock)(CGFloat t, CGFloat duration);

@interface HJWAnimation : CAKeyframeAnimation

@property (readonly, nonatomic, copy) HJWAnimationBlock animationBlock;

@end

@interface HJWAnimation (Unavailable)

- (void)setValues:(NSArray *)values __attribute__((unavailable("values cannot be set on HJWAnimation")));

@property (readwrite, atomic, assign) CGPathRef path __attribute__((unavailable("path is not available on HJWAnimation")));

@property (readwrite, atomic, copy) NSString *rotationMode __attribute__((unavailable("rotationMode is not available on HJWAnimation")));

@end
