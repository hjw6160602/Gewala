//
//  HJWLinearInterpolation.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef id (^HJWLinearInterpolation)(CGFloat fraction);

extern HJWLinearInterpolation HJWInterpolate(id from, id to);
