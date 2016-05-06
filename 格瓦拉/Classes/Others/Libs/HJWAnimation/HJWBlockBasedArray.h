//
//  HJWBlockBasedArray.h
//  HJWAnimation
//
//  Created by Sai DiCaprio. on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^HJWBlockBasedArrayBlock)(NSUInteger idx);

@interface HJWBlockBasedArray : NSArray

+ (instancetype)arrayWithCount:(NSUInteger)count block:(HJWBlockBasedArrayBlock)block;

- (instancetype)initWithCount:(NSUInteger)count block:(HJWBlockBasedArrayBlock)block;

@end
