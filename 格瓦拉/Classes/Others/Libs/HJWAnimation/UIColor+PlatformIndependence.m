//
//  UIColor+PlatformIndependence.m
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "UIColor+PlatformIndependence.h"

@implementation UIColor (PlatformIndependence)

+ (instancetype)hjw_colorWithHue:(CGFloat)hue saturation:(CGFloat)saturation brightness:(CGFloat)brightness alpha:(CGFloat)alpha {
    return [self colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

@end
