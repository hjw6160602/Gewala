//
//  HJWTabBar.h
//  格瓦拉
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HJWTabBarDelegate <NSObject>
/**
 *  @param from 从哪个视图(视图索引)
 *  @param to   到哪个视图(视图索引)
 */
- (void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface HJWTabBar : UIView

@property (nonatomic, weak) id<HJWTabBarDelegate> delegate;

/**
 *  提供给外界创建按钮
 *
 *  @param norName 默认状态的图片
 *  @param disName 高亮状态的图片
 */
- (void)addTabBarButtonWithTitle:(NSString *)title Image:(NSString *)name selectedImage:(NSString *)selName;

@end
