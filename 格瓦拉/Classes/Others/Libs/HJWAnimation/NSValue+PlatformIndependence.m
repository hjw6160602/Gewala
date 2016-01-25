//
//  NSValue+PlatformIndependence.m
//  hjwAnimation
//
//  Created by Robert Böhnke on 11/04/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "NSValue+PlatformIndependence.h"

@implementation NSValue (PlatformIndependence)

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
+ (instancetype)hjw_valueWithCGRect:(CGRect)rect {
    return [self valueWithCGRect:rect];
}

+ (instancetype)hjw_valueWithCGSize:(CGSize)size {
    return [self valueWithCGSize:size];
}

+ (instancetype)hjw_valueWithCGPoint:(CGPoint)point {
    return [self valueWithCGPoint:point];
}

- (CGRect)hjw_CGRectValue {
    return [self CGRectValue];
}

- (CGSize)hjw_CGSizeValue {
    return [self CGSizeValue];
}

- (CGPoint)hjw_CGPointValue {
    return [self CGPointValue];
}
#elif TARGET_OS_MAC
+ (instancetype)hjw_valueWithCGRect:(CGRect)rect {
    return [self valueWithRect:rect];
}

+ (instancetype)hjw_valueWithCGSize:(CGSize)size {
    return [self valueWithSize:size];
}

+ (instancetype)hjw_valueWithCGPoint:(CGPoint)point {
    return [self valueWithPoint:point];
}

- (CGRect)hjw_CGRectValue {
    return [self rectValue];
}

- (CGSize)hjw_CGSizeValue {
    return [self sizeValue];
}

- (CGPoint)hjw_CGPointValue {
    return [self pointValue];
}
#endif

@end
