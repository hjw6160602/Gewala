//
//  ScreenSize.h
//  贝思客
//
//  Created by shoule on 15/12/21.
//  Copyright © 2015年 SaiDicaprio. All rights reserved.
//

#ifndef ScreenSize_h
#define ScreenSize_h

/** 屏幕宽高 */
#define SCREEN_FRAME        [UIScreen mainScreen].bounds
#define SCREEN_HEIGHT       [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH        [[UIScreen mainScreen] bounds].size.width

#define INCH3_0             SCREEN_WIDTH==320 && SCREEN_HEIGHT==480
#define INCH4_0             SCREEN_WIDTH==320 && SCREEN_HEIGHT==568
#define INCH4_7             SCREEN_WIDTH==375 && SCREEN_HEIGHT==667
#define INCH5_5             SCREEN_WIDTH==414 && SCREEN_HEIGHT==736

#define NaviBar_H           64
#define TabBar_H            49


#endif /* ScreenSize_h */
