//
//  HJWTabBarItem.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBarItem.h"
#import "HJWBarItem.h"

@implementation HJWTabBarItem

#pragma mark - Initialization

/** 类工厂方法 初始化TabBarItem */
- (instancetype)initWithImage:(UIImage *)image SelectedImg:(UIImage *)selctedImg{
    self = [super init];
    if (self) {
        //拿到一个HJWBarItem对象
        self.barItem = [[HJWBarItem alloc]initWithImage:image SelectedImg:selctedImg];

        //1. 设置普通状态下的Item
        [self setImage:self.barItem.image forState:UIControlStateNormal];
        //2. 设置不可用状态图片
        [self setImage:self.barItem.selectedImage forState:UIControlStateDisabled];
        //3. 设置按钮高亮状态不调整图片
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title Image:(UIImage *)image SelectedImg:(UIImage *)selctedImg{
    self = [super init];
    if (self) {
        //拿到一个HJWBarItem对象
        self.barItem = [[HJWBarItem alloc]initWithImage:image SelectedImg:selctedImg];
        self.Title = title;
        //1. 设置普通状态下的Item
        [self setImage:self.barItem.image forState:UIControlStateNormal];
        //2. 设置不可用状态图片
        [self setImage:self.barItem.selectedImage forState:UIControlStateDisabled];
        //3. 设置按钮高亮状态不调整图片
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

#pragma mark - Setter方法
- (void)setTitle:(NSString *)Title{
    _Title = Title;
    [self setTitle:Title forState:UIControlStateNormal];
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}




@end
