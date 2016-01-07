//
//  HJWTabBar.m
//  格瓦拉
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBar.h"
#import "HJWTabBarItem.h"
#import "Const.h"

@interface HJWTabBar ()

// 定义变量记录当前选中的按钮
@property (nonatomic, weak) HJWTabBarItem *selectItem;

@end

@implementation HJWTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.94];
    }
    return self;
}

- (void)addTabBarButtonWithTitle:(NSString *)title Image:(NSString *)name selectedImage:(NSString *)selName
{
    // 0. 创建按钮
    HJWTabBarItem *tabBarItem = [HJWTabBarItem buttonWithType:UIButtonTypeCustom];
    
    // 1.设置普通状态下的Item
    [tabBarItem setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    
    
    // 2.设置选中状态下的Item
    // 2.1设置默认状态图片
    [tabBarItem setTitle:title forState:UIControlStateDisabled];
    [tabBarItem setTitleColor:HJW_GLOBLE_R forState:UIControlStateDisabled];
    // 2.2设置不可用状态图片
    [tabBarItem setImage:[UIImage imageNamed:selName] forState:UIControlStateDisabled];
    
    // 3.添加按钮到自定义TabBar
    [self addSubview:tabBarItem];
    
    // 4.监听按钮点击事件
    [tabBarItem addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.设置默认选中按钮
    if (1 == self.subviews.count) {
        [self itemOnClick:tabBarItem];
    }

    // 6.设置按钮高亮状态不调整图片
    tabBarItem.adjustsImageWhenHighlighted = NO;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //tabBarItem的个数
    NSInteger count = self.subviews.count;
    NSInteger lastItemTag = count - 1;
    for (int i = 0; i < count ; i++) {
        
        // 取出当前item
        HJWTabBarItem *item = self.subviews[i];
        if (i == 0) {
            item.frame = CGRectMake(0, 0, ItemSelectedW, TabBar_H);
        }
        else if (i == lastItemTag) {//最后一个item
            item.frame = CGRectMake(SCREEN_WIDTH - ItemWidth, 0, ItemWidth, TabBar_H);
        }
        else{
            // 设置frame
            CGFloat itemW = ItemWidth;
            CGFloat itemX = ItemSelectedW + ItemWidth * (i-1);
            item.frame = CGRectMake(itemX, 0, itemW, TabBar_H);
        }
        
        // 设置按钮的Tag作为将来切换子控制器的索引
        item.tag = i;
    }
}

#pragma mark - Actions
- (void)itemOnClick:(HJWTabBarItem *)item{
    // 0.切换子控制器
    // self.selectedIndex = btn.tag;
    // 通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:)]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectItem.tag to:item.tag];
    }
    
    // 1.取消上一次选中的按钮
    self.selectItem.enabled = YES;
    
    // 2.设置当前被点击按钮为选中状态
    item.enabled = NO;
    // 3.记录当前选中的按钮
    self.selectItem = item;
    [self layoutSubviews];
}

@end
