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

@interface BaseRootController ()
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
//    if (SINGLE.RenderBGLayer) {
//        [KEY_WINDOW.layer addSublayer:SINGLE.RenderBGLayer];
//        [self.view.layer insertSublayer:self.BGLayer atIndex:0];
//        id pLayer = self.view.layer;
//        NSArray *array = self.view.layer.sublayers;
//        
//        NSLog(@"");
//        self.currentLayer = [[CALayer alloc]initWithLayer:self.view.layer];
//        [self.view.layer addSublayer:self.BGLayer];
//        [self.view.layer addSublayer:self.currentLayer];
//    }
//    [TransitionAnimTool Animating:self.view.layer];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    SINGLE.RenderBGLayer = [UIImage RenderImageLayerWithObject:self];
    SINGLE.RenderBGImg = [UIImage RenderImageWithObject:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
