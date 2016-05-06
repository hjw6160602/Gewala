//
//  UIImage+Extension.h
//  BestCake3.0
//
//  Created by shoule on 15/8/20.
//  Copyright © 2015年 shoule. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/*!
 * @brief 输入一个viewController截图后返回一个UIImage对象
 * @param UIViewController类型
 * @return 返回一个UIImage对象
 */
+ (UIImage *)RenderImageWithObject:(UIViewController *)viewController;

/*!
 * @brief 输入一个viewController截图后返回一个CALayer对象
 * @param UIViewController类型
 * @return 返回一个CALayer对象
 */
+ (CALayer *)RenderImageLayerWithObject:(UIViewController *)viewController;

@end
