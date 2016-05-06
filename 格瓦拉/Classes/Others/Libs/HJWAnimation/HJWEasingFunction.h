//
//  HJWEasingFunction.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef CGFloat (^HJWEasingFunction)(CGFloat t);

extern HJWEasingFunction const HJWEasingFunctionLinear;

extern HJWEasingFunction const HJWEasingFunctionEaseInQuad;
extern HJWEasingFunction const HJWEasingFunctionEaseOutQuad;
extern HJWEasingFunction const HJWEasingFunctionEaseInOutQuad;

extern HJWEasingFunction const HJWEasingFunctionEaseInCubic;
extern HJWEasingFunction const HJWEasingFunctionEaseOutCubic;
extern HJWEasingFunction const HJWEasingFunctionEaseInOutCubic;

extern HJWEasingFunction const HJWEasingFunctionEaseInQuart;
extern HJWEasingFunction const HJWEasingFunctionEaseOutQuart;
extern HJWEasingFunction const HJWEasingFunctionEaseInOutQuart;

extern HJWEasingFunction const HJWEasingFunctionEaseInBounce;
extern HJWEasingFunction const HJWEasingFunctionEaseOutBounce;

extern HJWEasingFunction const HJWEasingFunctionEaseInExpo;
extern HJWEasingFunction const HJWEasingFunctionEaseOutExpo;
extern HJWEasingFunction const HJWEasingFunctionEaseInOutExpo;
