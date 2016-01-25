//
//  HJWTabBar.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBar.h"
#import "CATransaction+TransactionWithAnimationsAndCompletion.h"
#import "HJWTabBarItem.h"
#import "UIView+Extension.h"
#import "Const.h"

#define  TO_VALUE  -10
@interface HJWTabBar ()

/** 定义变量记录当前选中的按钮 */
@property (nonatomic, weak) HJWTabBarItem *selectedItem;

@property (nonatomic, assign) BOOL isAnimated;
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
    UIImage * image = [UIImage imageNamed:name];
    UIImage * selectedImg = [UIImage imageNamed:selName];
    
    // 1.设置普通状态下的Item图片和不可用状态下的Item图片
    HJWTabBarItem *item = [[HJWTabBarItem alloc]initWithTitle:title Image:image SelectedImg:selectedImg];
    
    // 2.设置tabBarItem的title颜色
    item.titleColor = HJW_GLOBLE_R;
    
    // 3.添加按钮到自定义TabBar
    [self addSubview:item];
    
    // 4.监听按钮点击事件
    [item addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.设置默认选中按钮
    if (1 == self.subviews.count) {
        [self itemOnClick:item];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //tabBarItem的个数
    NSInteger count = self.subviews.count;
    NSInteger lastItemTag = count - 1;
    NSInteger itemX = 10;
    for (int i = 0; i < count ; i++) {
        // 取出当前item
        HJWTabBarItem *item = self.subviews[i];
        item.size = CGSizeMake(ItemWidth, TabBar_H);
        if (item.itemSelected) {
            item.width = ItemSelectedW;
            if (i == lastItemTag-1) item.width += 20;//电影券（3个字）
        }
        
        if (i == 0){
            item.x = itemX;
        }
        
        else if (i == lastItemTag) {//最后一个item
            item.x = SCREEN_WIDTH - ItemWidth;
        }
        
        else{
            // 设置frame
            item.x = itemX;
        }
        itemX += item.width + 10;
//        NSLog(@"items[%d].frame:%@",i ,NSStringFromCGRect(item.frame));
        // 设置按钮的Tag作为将来切换子控制器的索引
        item.tag = i;
    }
//    [CATransaction transactionWithAnimations:^{
//        self.selectedItem.layer.bounds = CGRectMake(0, 0, 40, 49);
////        [self Animating];
//    } Completion:^{
//        self.selectedItem.width = ItemWidth;
//    }];
    
}

#pragma mark - Getter
- (NSArray *)items{
    return [self.subviews copy];
}

#pragma mark - Setter
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    HJWTabBarItem *item = self.subviews[selectedIndex];
    [self itemOnClick:item];
}

#pragma mark - Actions
- (void)itemOnClick:(HJWTabBarItem *)sender{
    // 0.切换子控制器
//    self.selectedIndex = sender.tag;
    // 通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:)]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectedItem.tag to:sender.tag];
    }
    
    // 1.取消上一次选中的按钮
    self.selectedItem.enabled = YES;
    self.selectedItem.itemSelected = NO;
    // 2.设置当前被点击按钮为选中状态
    sender.enabled = NO;
    
    // 3.记录当前选中的按钮
    self.selectedItem = sender;
    self.selectedItem.itemSelected = YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutSubviews];
    }];
    
//    [CATransaction transactionWithAnimations:^{
//        self.selectedItem.layer.bounds = CGRectMake(0, 0, 40, 49);
////        [self Animating];
//    } Completion:^{
//        self.selectedItem.width = ItemWidth;
//    }];
}

#pragma mark - Animation
- (void)Animating{
    CABasicAnimation *anim = [CABasicAnimation animation];
//    anim.fromValue = 
//    anim.keyPath = @"transform.scale.x";
    
    
    anim.keyPath = @"frame.size.width";
    anim.toValue = @(TO_VALUE);
    [self.selectedItem.layer addAnimation:anim forKey:@"tabBarSelected"];
}



@end
