//
//  HJWTabBarItem.h
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ItemMargin      10
#define ItemWidth       32
#define ItemSelectedW   70

@class HJWBarItem;

@interface HJWTabBarItem : UIButton

/** 拥有的barItem */
@property (nonatomic, strong) HJWBarItem *barItem;
/** 设置文字颜色 */
@property (nonatomic, strong) UIColor *titleColor;
/** 设置Title */
@property (nonatomic, copy) NSString *Title;
/** 设置TitleLabel */
@property (nonatomic, strong) UILabel *txtLabel;
/** 选中状态标记 */
@property (nonatomic, assign, getter = isItemSelected) BOOL itemSelected;

/** 类工厂方法 初始化TabBarItem */
- (instancetype)initWithImage:(UIImage *)image SelectedImg:(UIImage *)selctedImg;
- (instancetype)initWithTitle:(NSString *)title Image:(UIImage *)image SelectedImg:(UIImage *)selctedImg;

@end
