//
//  Const.h
//  新浪微博
//
//  Created by SaiDicaprio on 15/7/8.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#ifndef _____Const_h
#define _____Const_h

#import "ScreenSize.h"

#pragma mark - 日志输出
#ifdef DEBUG
/** 调试状态 打开LOG功能 */
#define HJWLog(...) NSLog(__VA_ARGS__)
#else
/** 发布状态 关闭LOG功能 */
#define HJWLog(...)
#endif

#pragma mark - 功能性函数
/** 全局颜色 */
#define HJW_GLOBLE_BG      HJWColor(230, 230, 230)
#define HJW_GLOBLE_R       HJWColor (233, 97, 45)
#define HJWColorGray(Gray) HJWColor (Gray, Gray, Gray)
/** 颜色 */
#define HJWColor(R, G, B)  [UIColor colorWithRed:(R)/255.0 green:(G)/255.0 blue:(B)/255.0 alpha:1.0]

/** 随机色 */
#define HJWRandomColor HJWColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))


#pragma mark - 宏
/** 沙盒缓存路径 */
#define DOC_PATH            [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject]
/** 全局单例 */
#define SINGLE              [Single single]
/** 全局单例 [NSUserDefaults standardUserDefaults] */
#define USER_DEFAULT        [NSUserDefaults standardUserDefaults]
/** 通知中心 */
#define NOTI_CENTER         [NSNotificationCenter defaultCenter]
/** KeyWindow [UIApplication sharedApplication].keyWindow */
#define KEY_WINDOW          [UIApplication sharedApplication].keyWindow
/** Cell复用标识 */
#define CELL     @"Cell"

#endif
