//
//  NSValue+PlatformIndependence.h
//  hjwAnimation
//
//  Created by Robert Böhnke on 11/04/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface NSValue (PlatformIndependence)

+ (instancetype)hjw_valueWithCGRect:(CGRect)rect;
+ (instancetype)hjw_valueWithCGSize:(CGSize)size;
+ (instancetype)hjw_valueWithCGPoint:(CGPoint)point;

- (CGRect)hjw_CGRectValue;
- (CGSize)hjw_CGSizeValue;
- (CGPoint)hjw_CGPointValue;

@end
