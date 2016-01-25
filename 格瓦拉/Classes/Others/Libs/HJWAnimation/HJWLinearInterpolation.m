//
//  HJWLinearInterpolation.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#if TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR
#import <UIKit/UIKit.h>

#import "UIColor+PlatformIndependence.h"

#define HJWColor UIColor
#else

#define HJWColor NSColor
#endif

#import "NSValue+PlatformIndependence.h"

#import "HJWLinearInterpolation.h"

static HJWLinearInterpolation HJWInterpolateCATransform3D(CATransform3D from, CATransform3D to) {
    CATransform3D delta = {
        .m11 = to.m11 - from.m11,
        .m12 = to.m12 - from.m12,
        .m13 = to.m13 - from.m13,
        .m14 = to.m14 - from.m14,
        .m21 = to.m21 - from.m21,
        .m22 = to.m22 - from.m22,
        .m23 = to.m23 - from.m23,
        .m24 = to.m24 - from.m24,
        .m31 = to.m31 - from.m31,
        .m32 = to.m32 - from.m32,
        .m33 = to.m33 - from.m33,
        .m34 = to.m34 - from.m34,
        .m41 = to.m41 - from.m41,
        .m42 = to.m42 - from.m42,
        .m43 = to.m43 - from.m43,
        .m44 = to.m44 - from.m44
    };

    return ^(CGFloat fraction) {
        CATransform3D transform = {
            .m11 = from.m11 + fraction * delta.m11,
            .m12 = from.m12 + fraction * delta.m12,
            .m13 = from.m13 + fraction * delta.m13,
            .m14 = from.m14 + fraction * delta.m14,
            .m21 = from.m21 + fraction * delta.m21,
            .m22 = from.m22 + fraction * delta.m22,
            .m23 = from.m23 + fraction * delta.m23,
            .m24 = from.m24 + fraction * delta.m24,
            .m31 = from.m31 + fraction * delta.m31,
            .m32 = from.m32 + fraction * delta.m32,
            .m33 = from.m33 + fraction * delta.m33,
            .m34 = from.m34 + fraction * delta.m34,
            .m41 = from.m41 + fraction * delta.m41,
            .m42 = from.m42 + fraction * delta.m42,
            .m43 = from.m43 + fraction * delta.m43,
            .m44 = from.m44 + fraction * delta.m44
        };

        return [NSValue valueWithCATransform3D:transform];
    };
}

static HJWLinearInterpolation HJWInterpolateCGRect(CGRect from, CGRect to) {
    CGFloat deltaX = to.origin.x - from.origin.x;
    CGFloat deltaY = to.origin.y - from.origin.y;
    CGFloat deltaWidth = to.size.width - from.size.width;
    CGFloat deltaHeight = to.size.height - from.size.height;

    return ^(CGFloat fraction) {
        CGRect rect = {
            .origin.x = from.origin.x + fraction * deltaX,
            .origin.y = from.origin.y + fraction * deltaY,
            .size.width = from.size.width + fraction * deltaWidth,
            .size.height = from.size.height + fraction * deltaHeight
        };

        return [NSValue hjw_valueWithCGRect:rect];
    };
}

static HJWLinearInterpolation HJWInterpolateCGPoint(CGPoint from, CGPoint to) {
    CGFloat deltaX = to.x - from.x;
    CGFloat deltaY = to.y - from.y;

    return ^(CGFloat fraction) {
        CGPoint point = {
            .x = from.x + fraction * deltaX,
            .y = from.y + fraction * deltaY,
        };

        return [NSValue hjw_valueWithCGPoint:point];
    };
}

static HJWLinearInterpolation HJWInterpolateCGSize(CGSize from, CGSize to) {
    CGFloat deltaWidth = to.width - from.width;
    CGFloat deltaHeight = to.height - from.height;

    return ^(CGFloat fraction) {
        CGSize size = {
            .width = from.width + fraction * deltaWidth,
            .height = from.height + fraction * deltaHeight,
        };

        return [NSValue hjw_valueWithCGSize:size];
    };
}

static HJWLinearInterpolation HJWInterpolateCGFloat(CGFloat from, CGFloat to) {
    CGFloat delta = to - from;

    return ^(CGFloat fraction) {
        return @(from + fraction * delta);
    };
};

// TODO: Color spaces can present a problem.
//
// For example, if [UIColor/NSColor whiteColor] is used, the color space is
// white, and this fails.
//
// A comprehensive conversion process should always bring the colors into an
// HSBA-compatible color space. In the mean time, always create colors using
// +olorWithHue:saturation:brightness:alpha: method.

extern HJWLinearInterpolation HJWInterpolate(id from, id to) {
    if ([from isKindOfClass:NSNumber.class] && [to isKindOfClass:NSNumber.class]) {
        #if CGFLOAT_IS_DOUBLE
        return HJWInterpolateCGFloat([(NSNumber *)from doubleValue], [(NSNumber *)to doubleValue]);
        #else
        return HJWInterpolateCGFloat([(NSNumber *)from floatValue], [(NSNumber *)to doubleValue]);
        #endif
    }

    if (([from isKindOfClass:NSValue.class] && [to isKindOfClass:NSValue.class]) && strcmp([from objCType], [to objCType]) == 0) {
        if (strcmp([from objCType], @encode(CATransform3D)) == 0) {
            return HJWInterpolateCATransform3D([from CATransform3DValue], [to CATransform3DValue]);
        }

        if (strcmp([from objCType], @encode(CGRect)) == 0) {
            return HJWInterpolateCGRect([from hjw_CGRectValue], [to hjw_CGRectValue]);
        }

        if (strcmp([from objCType], @encode(CGPoint)) == 0) {
            return HJWInterpolateCGPoint([from hjw_CGPointValue ], [to hjw_CGPointValue]);
        }

        if (strcmp([from objCType], @encode(CGSize)) == 0) {
            return HJWInterpolateCGSize([from hjw_CGSizeValue], [to hjw_CGSizeValue]);
        }
    }

    return ^(CGFloat fraction) {
        return fraction < 0.5 ? from : to;
    };
}
