//
//  BaseRootController.m
//  格瓦拉
//
//  Created by shoule on 16/1/21.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "BaseRootController.h"
#import "TransitionAnimTool.h"
#import "UIImage+Extension.h"
#import "GlobleSingleton.h"
#import "Const.h"

@interface BaseRootController () <UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) CALayer *BGLayer;
//@property (nonatomic, strong) CALayer *currentLayer;
@end

@implementation BaseRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.view.layer.opacity = 0.85f;
    [UIView animateWithDuration:0.3 animations:^{
        self.view.layer.opacity = 1.0f;
        SINGLE.RenderBGLayer.opacity = 1.0f;
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    SINGLE.RenderBGImg = [UIImage RenderImageWithObject:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
//    
//}


@end
