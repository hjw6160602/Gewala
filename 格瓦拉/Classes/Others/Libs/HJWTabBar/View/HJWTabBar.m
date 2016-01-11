//
//  HJWTabBar.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBar.h"
#import "CAAnimation+HJWTabBarViewAnimations.h"
#import "CATransaction+TransactionWithAnimationsAndCompletion.h"
#import "HJWTabBarItem.h"
#import "UIView+Extension.h"
#import "Const.h"

@interface HJWTabBar ()

/** 定义变量记录当前选中的按钮 */
@property (nonatomic, weak) UIButton *selectedBtn;
/** tabBar所存储的所有HJWTabBarItem */
@property (nonatomic, weak) NSMutableArray *myItems;

/** tabBar所存储的所有HJWTabBarItem对应的Button */
@property (nonatomic, weak) NSMutableArray *myItemBtns;
@property (nonatomic, assign) BOOL isAnimated;
@end

@implementation HJWTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        _myItems = [NSMutableArray array];
        _myItemBtns = [NSMutableArray array];
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.94];
    }
    return self;
}

- (void)addTabBarButtonWithTitle:(NSString *)title Image:(NSString *)name selectedImage:(NSString *)selName
{
    // 0. 创建按钮
    UIImage * image = [UIImage imageNamed:name];
    UIImage * selectedImg = [UIImage imageNamed:selName];
    HJWTabBarItem *tabBarItem = [[HJWTabBarItem alloc]initWithImage:image SelectedImg:selectedImg];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 1.设置普通状态下的Item
    [btn setImage:tabBarItem.image forState:UIControlStateNormal];
    
    // 2.设置选中状态下的Item
    // 2.1设置默认状态图片
    [btn setTitle:title forState:UIControlStateDisabled];
    [btn setTitleColor:HJW_GLOBLE_R forState:UIControlStateDisabled];
    // 2.2设置不可用状态图片
    [btn setImage:tabBarItem.selectedImage forState:UIControlStateDisabled];
    
    // 3.添加按钮到自定义TabBar
    [self addSubview:btn];
    
    // 4.监听按钮点击事件
    [btn addTarget:self action:@selector(itemOnClick:) forControlEvents:UIControlEventTouchDown];
    
    // 5.设置默认选中按钮
    if (1 == self.subviews.count) {
        [self itemOnClick:btn];
    }
    
    // 6.设置按钮高亮状态不调整图片
    btn.adjustsImageWhenHighlighted = NO;
    /** 将所创建的Item 加入数组*/
    [self.myItems addObject:tabBarItem];
    [self.myItemBtns addObject:btn];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    //tabBarItem的个数
    NSInteger count = self.subviews.count;
    NSInteger lastItemTag = count - 1;
    for (int i = 0; i < count ; i++) {
        
        // 取出当前item
        UIButton *btn = self.subviews[i];
        if (i == 0) {
            btn.frame = CGRectMake(0, 0, ItemSelectedW, TabBar_H);
        }
        else if (i == lastItemTag) {//最后一个item
            btn.frame = CGRectMake(SCREEN_WIDTH - ItemWidth, 0, ItemWidth, TabBar_H);
        }
        else{
            // 设置frame
            CGFloat itemW = ItemWidth;
            CGFloat itemX = ItemSelectedW + ItemWidth * (i-1);
            btn.frame = CGRectMake(itemX, 0, itemW, TabBar_H);
        }
        // 设置按钮的Tag作为将来切换子控制器的索引
        btn.tag = i;
    }
}

#pragma mark - Getter
- (NSArray *)items{
    return [self.myItems copy];
}

#pragma mark - Setter
- (void)setSelectedIndex:(NSInteger)selectedIndex {
    UIButton *btn = self.myItemBtns[selectedIndex];
    [self itemOnClick:btn];
}

#pragma mark - Actions
- (void)itemOnClick:(UIButton *)sender{
    // 0.切换子控制器
//    self.selectedIndex = sender.tag;
    // 通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectBtnFrom:to:)]) {
        [self.delegate tabBarDidSelectBtnFrom:self.selectedBtn.tag to:sender.tag];
    }
    
    // 1.取消上一次选中的按钮
    self.selectedBtn.enabled = YES;
    
    // 2.设置当前被点击按钮为选中状态
    sender.enabled = NO;
    // 3.记录当前选中的按钮
    self.selectedBtn = sender;
    [self transaction];
}

#pragma mark - expand/collapse

- (void)transaction {
    NSInteger index = 0;
    for (UIButton *btn in self.myItemBtns) {
        if (index == self.selectedBtn.tag) {
            btn.width = ItemSelectedW;
        }
        else btn.width = ItemWidth;
        index++;
    }

//    [CATransaction transactionWithAnimations:^{
//        self.isAnimated = YES;
//        [self animate];
//    } andCompletion:^{
////        if ([self.delegate respondsToSelector:@selector(tabBarViewDidAnimated:)]) {
//            NSLog(@"[self.delegate tabBarViewDidAnimated:self]");
////        }
//        self.isAnimated = NO;
//    }];
}

- (void)tabBarViewDidAnimated:(id)sender{
    
}



- (void)animate{
    UIButton *selectedBtn = self.myItemBtns[self.selectedIndex];
    
    CAAnimation *animation = [CAAnimation animationForAdditionalButton];
    
    CABasicAnimation *translationX = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];

//    translationX.fromValue = 2;
//    translationX.toValue = 0;
//    translationX.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [selectedBtn.layer.mask addAnimation:animation forKey:nil];
}


@end
