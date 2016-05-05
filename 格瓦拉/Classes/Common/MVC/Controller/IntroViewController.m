//
//  IntroViewController.m
//  格瓦拉
//
//  Created by shoule on 16/5/5.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "IntroViewController.h"
#import "UIView+Extension.h"

@interface IntroViewController ()
@property (weak, nonatomic) IBOutlet UIView *AnimContainerView;
@property (nonatomic, strong) UIImageView *AnimImgView;
@property (nonatomic, strong) CALayer *AnimLayer;
@end

@implementation IntroViewController

static CGFloat AnimateDuration = 1.0;
static NSInteger ImgCount = 9;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControls];
}

#pragma mark - Inits
- (void)initControls{
    //0. 设置背景层的cornerRadius
    self.AnimContainerView.layer.cornerRadius = self.AnimContainerView.width / 2;
    //注意：self.AnimContainerView.layer.masksToBounds = YES 这句话不能写
    
    //1. 初始化动画层
    [self setupAnimLayer];
    
    //2. 将图片层添加上来
    [self setupImgView];
}

- (void)setupImgView{
    NSMutableArray *imgArr = [NSMutableArray array];
    NSString *imgPrefix = @"icon_xg";
    for (NSInteger index = 1; index<= ImgCount; index++) {
        NSString *imgName = [NSString stringWithFormat:@"%@%ld",imgPrefix,index];
        UIImage *img = [UIImage imageNamed:imgName];
        [imgArr addObject:img];
    }
    
    self.AnimImgView = [[UIImageView alloc]init];
    self.AnimImgView.size = CGSizeMake(150, 150);
    self.AnimImgView.center = self.AnimContainerView.center;
    self.AnimImgView.image = [UIImage imageNamed:@"icon_xg9"];
    
    self.AnimImgView.animationImages = imgArr;
    self.AnimImgView.animationDuration = 2;
    self.AnimImgView.animationRepeatCount = 1;
    [self.AnimImgView startAnimating];
    
    [self.view addSubview:self.AnimImgView];
}

- (void)setupAnimLayer{
    self.AnimLayer = [CALayer layer];
    self.AnimLayer.frame = self.AnimContainerView.bounds;
    self.AnimLayer.cornerRadius = self.AnimLayer.frame.size.width /2;
    self.AnimLayer.backgroundColor = [UIColor whiteColor].CGColor;
    
    [self.AnimContainerView.layer insertSublayer:self.AnimLayer below:self.AnimContainerView.layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.toValue = @8;
    animation.duration = AnimateDuration;
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    [self performSelector:@selector(Animating:) withObject:animation afterDelay:3];
}

- (void)Animating:animation{
    [UIView animateWithDuration:AnimateDuration animations:^{
        self.AnimImgView.alpha = 0;
    }];
    [self.AnimLayer addAnimation:animation forKey:@"scaleAnimation"];
}


@end
