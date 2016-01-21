//
//  UIImage+Extension.m
//  BestCake3.0
//
//  Created by shoule on 15/8/20.
//  Copyright © 2015年 shoule. All rights reserved.
//

#import "UIImage+Extension.h"
#import "Const.h"
@implementation UIImage (Extension)
/*!
 * @brief 输入一个viewController截图后返回一个UIImage对象
 * @param UIViewController类型
 * @return 返回一个UIImage对象
 */
+ (UIImage *)RenderImageWithObject:(UIViewController *)viewController
{
    UIGraphicsBeginImageContextWithOptions(viewController.view.bounds.size, viewController.view.opaque, 0.0);
    [viewController.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

/*!
 * @brief 输入一个viewController截图后返回一个CALayer对象
 * @param UIViewController类型
 * @return 返回一个CALayer对象
 */
+ (CALayer *)RenderImageLayerWithObject:(UIViewController *)viewController
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage RenderImageWithObject:viewController]];
    return imageView.layer;
}

@end
