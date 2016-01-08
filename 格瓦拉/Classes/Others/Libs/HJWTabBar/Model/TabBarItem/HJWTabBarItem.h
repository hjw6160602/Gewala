//
//  HJWTabBarItem.h
//  格瓦拉
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ItemWidth       40
#define ItemSelectedW   80


@interface HJWTabBarItem : NSObject

/** 图片 */
@property (nonatomic, strong) UIImage *image;
/** 被选中时的图片 */
@property (nonatomic, strong) UIImage *selectedImage;

/** 类工厂方法 初始化TabBarItem */
- (instancetype)initWithImage:(UIImage *)image SelectedImg:(UIImage *)selctedImg;

@end
