//
//  HJWEasingFunction.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWEasingFunction.h"

#if CGFLOAT_IS_DOUBLE
#define POW(X, Y) pow(X, Y)
#else
#define POW(X, Y) powf(X, Y)
#endif

HJWEasingFunction const HJWEasingFunctionLinear = ^CGFloat(CGFloat t) {
    return t;
};

HJWEasingFunction const HJWEasingFunctionEaseInQuad = ^CGFloat(CGFloat t) {
    return t * t;
};

HJWEasingFunction const HJWEasingFunctionEaseOutQuad = ^CGFloat(CGFloat t) {
    return t * (2 - t);
};

HJWEasingFunction const HJWEasingFunctionEaseInOutQuad = ^CGFloat(CGFloat t) {
    if (t < 0.5) {
        return 2 * t * t;
    } else {
        return -1 + (4 - 2 * t) * t;
    }
};

HJWEasingFunction const HJWEasingFunctionEaseInCubic = ^CGFloat(CGFloat t) {
    return t * t * t;
};

HJWEasingFunction const HJWEasingFunctionEaseOutCubic = ^CGFloat(CGFloat t) {
    return POW(t - 1, 3) + 1;
};

HJWEasingFunction const HJWEasingFunctionEaseInOutCubic = ^CGFloat(CGFloat t) {
    if (t < 0.5) {
        return 4 * POW(t, 3);
    } else {
        return (t - 1) * POW(2 * t - 2, 2) + 1;
    }
};

HJWEasingFunction const HJWEasingFunctionEaseInQuart = ^(CGFloat t) {
    return t * t * t * t;
};

HJWEasingFunction const HJWEasingFunctionEaseOutQuart = ^(CGFloat t) {
    return 1 - POW(t - 1, 4);
};

HJWEasingFunction const HJWEasingFunctionEaseInOutQuart = ^(CGFloat t) {
    if (t < 0.5) {
        return 8 * POW(t, 4);
    } else {
        return -1 / 2 * POW(2 * t - 2, 4) + 1;
    }
};

HJWEasingFunction const HJWEasingFunctionEaseInBounce = ^CGFloat(CGFloat t) {
    return 1.0 - HJWEasingFunctionEaseOutBounce(1.0 - t);
};

HJWEasingFunction const HJWEasingFunctionEaseOutBounce = ^CGFloat(CGFloat t) {
    if (t < 4.0 / 11.0) {
        return POW(11.0 / 4.0, 2) * POW(t, 2);
    }

    if (t < 8.0 / 11.0) {
        return 3.0 / 4.0 + POW(11.0 / 4.0, 2) * POW(t - 6.0 / 11.0, 2);
    }

    if (t < 10.0 / 11.0) {
        return 15.0 /16.0 + POW(11.0 / 4.0, 2) * POW(t - 9.0 / 11.0, 2);
    }

    return 63.0 / 64.0 + POW(11.0 / 4.0, 2) * POW(t - 21.0 / 22.0, 2);
};

HJWEasingFunction const HJWEasingFunctionEaseInExpo = ^CGFloat(CGFloat t) {
    return t == 0 ? 0.0 : POW(2, 10 * (t - 1));
};

HJWEasingFunction const HJWEasingFunctionEaseOutExpo = ^CGFloat(CGFloat t) {
    return t == 1.0 ? 1 : 1 - POW(2, - 10 * t);
};

HJWEasingFunction const HJWEasingFunctionEaseInOutExpo = ^CGFloat(CGFloat t) {
    if (t == 0) return 0.0;
    if (t == 1) return 1.0;
    
    if (t < 0.5) {
        return POW(2, 10 * (2 * t - 1)) / 2;
    } else {
        return 1 - POW(2, -10 * (2 * t - 1)) / 2;
    }
};
