//
//  GlobleSingleton.h
//  格瓦拉
//
//  Created by shoule on 16/1/21.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

@interface GlobleSingleton : NSObject
singleton_interface(GlobleSingleton)

/** 截图渲染好的layer */
@property (nonatomic, strong) CALayer *RenderBGLayer;
/** 截图渲染好的image */
@property (nonatomic, strong) UIImage *RenderBGImg;
/** keyWindow  */
@property (nonatomic, strong) UIWindow *keyWindow;

@end
