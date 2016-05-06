//
//  UIColor+PlatformIndependence.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface UIColor (PlatformIndependence)

+ (instancetype)hjw_colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha;

@end
