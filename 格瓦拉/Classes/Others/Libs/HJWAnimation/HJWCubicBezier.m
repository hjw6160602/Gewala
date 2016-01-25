//
//  HJWCubicBezier.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWCubicBezier.h"

#define A(a1, a2) (1.0 - 3.0 * a2 + 3.0 * a1)
#define B(a1, a2) (3.0 * a2 - 6.0 * a1)
#define C(a1)     (3.0 * a1)

CGFloat HJWCubicBezierCalculate(CGFloat t, CGFloat a1, CGFloat a2) {
    return ((A(a1, a2) * t + B(a1, a2)) * t + C(a1)) * t;
}

CGFloat HJWCubicBezierSlope(CGFloat t, CGFloat a1, CGFloat a2) {
    return 3.0 * A(a1, a2) * t * t + 2.0 * B(a1, a2) * t + C(a1);
}

CGFloat HJWCubicBezierBinarySubdivide(CGFloat x, CGFloat x1, CGFloat x2) {
    CGFloat epsilon = 0.0000001;
    NSUInteger maxIterations = 10;

    CGFloat start = 0;
    CGFloat end = 1;

    CGFloat currentX;
    CGFloat currentT;

    NSUInteger i = 0;
    do {
        currentT = start + (end - start) / 2;
        currentX = HJWCubicBezierCalculate(currentT, x1, x2) - x;

        if (currentX > 0) {
            end = currentT;
        } else {
            start = currentT;
        }

    } while (fabs(currentX) > epsilon && ++i < maxIterations);

    return currentT;
}

extern HJWEasingFunction HJWCubicBezier(CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2) {
    if (x1 == y1 && x2 == y2) return HJWEasingFunctionLinear;

    return ^(CGFloat x) {
        CGFloat t = HJWCubicBezierBinarySubdivide(x, x1, x2);

        return HJWCubicBezierCalculate(t, y1, y2);
    };
}