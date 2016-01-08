//
//  HJWTabBarItem.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBarItem.h"

@implementation HJWTabBarItem

#pragma mark - Initialization

/** 类工厂方法 初始化TabBarItem */
- (instancetype)initWithImage:(UIImage *)image SelectedImg:(UIImage *)selctedImg{
    self = [super init];
    if (self) {
        _image = image;
        _selectedImage = selctedImg;
    }
    return self;
}

@end
