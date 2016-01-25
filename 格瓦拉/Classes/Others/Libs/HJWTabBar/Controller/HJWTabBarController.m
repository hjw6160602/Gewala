//
//  HJWTabBarController.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBarController.h"
#import "CATransaction+TransactionWithAnimationsAndCompletion.h"
#import "DiscoverController.h"
#import "BuyTicketController.h"
#import "ActivityController.h"
#import "FlimController.h"
#import "ProfileController.h"
#import "UIImage+Extension.h"
#import "GlobleSingleton.h"
#import "HJWSpringAnimation.h"
#import "HJWTabBar.h"
#import "Const.h"

@interface HJWTabBarController ()<HJWTabBarDelegate, UITabBarControllerDelegate>
/** 用于存储TabBar*/
@property (nonatomic, strong) HJWTabBar *myTabBar;
/** 标题 */
@property (nonatomic, strong) NSArray *titles;
/** 图片名称 */
@property (nonatomic, strong) NSArray *imgNames;
@property (nonatomic, strong) CALayer *layer;

@end

@implementation HJWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initControls];
    [self initTabBar];
}

#pragma mark - Init
- (void)initControls{
    self.titles =  @[@"发现",@"购票",@"活动",@"电影圈",@""];
//    self.titles =  @[@"活动",@"电影",@""];
    self.imgNames = @[@"discover",@"buyTicket",@"activity",@"flimCircle",@"profile"];
    NSInteger index = 0;
    
    for (NSString *title in self.titles) {
        UIViewController *Controller;
        NSString * itemImgName = self.imgNames[index];
        NSMutableString *selectedImgName = [[NSMutableString alloc] initWithString:itemImgName];
        NSMutableString *bgImgName = [[NSMutableString alloc] initWithString:itemImgName];
        [bgImgName appendString:@"_bg"];
        [selectedImgName appendString:@"_sel"];
        switch (index) {
            case 0: //发现
                Controller = [[DiscoverController alloc] init];
                break;
            case 1: //购票
                Controller = [[BuyTicketController alloc] init];
                break;
            case 2: //活动
                Controller = [[ActivityController alloc] init];
                break;
            case 3: //电影圈
                Controller = [[FlimController alloc] init];
                break;
            case 4: //我的
                Controller = [[ProfileController alloc] init];
                break;
            default: break;
        }
        Controller.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:bgImgName]];
//        [self addTransitionAnimation:Controller.view.layer];
        [self addOneChlildVc:Controller title:title imageName:itemImgName selectedImageName:selectedImgName];
        index++;
    }
    //定义个转场动画
    CATransition *animation = [CATransition animation];
    //转场动画持续时间
    animation.duration = 0.2f;
    //计时函数，从头到尾的流畅度？？？
    animation.timingFunction=UIViewAnimationCurveEaseInOut;
    //转场动画类型
    animation.type = kCATransitionReveal;
    //转场动画将去的方向
    animation.subtype = kCATransitionFromBottom;
    //动画时你需要的实现
    self.tabBarController.tabBar.hidden = YES;
    //添加动画 （转场动画是添加在层上的动画）
    
    [self.tabBar.layer addAnimation:animation forKey:@"animation"];
    
    self.tabBar.tintColor = HJW_GLOBLE_R;
}

/** 为控制器的layer加转场动画*/
- (void)addTransitionAnimation:(CALayer *)layer{
    //0.创建核心动画
    CATransition *anim = [CATransition animation];
    
    //1.告诉要执行什么动画
    //设置过度效果
    anim.type = @"cube";
    //2. 设置动画的过度方向（向右）
    anim.subtype = kCATransitionFromRight;
    //3. 设置动画的时间
    anim.duration = 1.0;
    //4. 设置动画的起点
    anim.startProgress = 0.7;
    [layer addAnimation:anim forKey:nil];
}

- (void)initTabBar{
    // 0.创建自定义的TabBar
    self.myTabBar = [[HJWTabBar alloc] init];
    self.myTabBar.frame = self.tabBar.frame;
    self.myTabBar.delegate = self;
    [self.view addSubview:self.myTabBar];
    
    //    NSLog(@"viewControllers = %d", self.viewControllers.count);
    // 1.根据系统子控制器的个数来创建自定义TabBar上按钮的个数
    for (int i = 0; i < self.viewControllers.count; i++) {
        // 通知自定义TabBar创建按钮
        NSString *selName = [NSString stringWithFormat:@"%@_sel",self.imgNames[i]];
        
        // 只要调用自定义TabBar的该方法就会创建一个按钮
        [self.myTabBar addTabBarButtonWithTitle:self.titles[i] Image:self.imgNames[i] selectedImage:selName];
    }
    
    // 2.删除系统自带的tabBar
    [self.tabBar removeFromSuperview];
}

//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    //将tabBar放在KEYWINDOW上,在这里
////    self.myTabBar.hidden = YES;
//    UIWindow *window = SINGLE.keyWindow;
//    
//    [window addSubview:self.myTabBar];
//}

#pragma mark - Getter
/** hjwTabBar的getter */
- (HJWTabBar *)hjwTabBar{
    return self.myTabBar;
}

#pragma mark - Actions
/**
 *  添加一个子控制器
 *
 *  @param childVc           子控制器对象
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)addOneChlildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    // 设置标题
    // 相当于同时设置了tabBarItem.title和navigationItem.title
    // childVc.title = title;
    // 设置图标
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    nav.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    [nav setNavigationBarHidden:YES];
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    nav.tabBarItem.selectedImage = selectedImage;
    
    // 添加为tabbar控制器的子控制器
    
    // 相当于同时设置了tabBarItem.title和navigationItem.title
    //    nav.title = title;
    [self addChildViewController:nav];
}

#pragma mark - HJWTabBarDelegate
- (void)tabBarDidSelectBtnFrom:(NSInteger)from to:(NSInteger)to{
    //0.  切换子控制器
    self.selectedIndex = to;
    //1.  取出子数组东中的控制器
    UINavigationController *Controller = self.childViewControllers[to];
    //1.1 拿到该控制器的根layer
    CALayer *layer = Controller.view.layer;
    
    //2. 将渲染好的背景插入到KEY_WINDOW的底下
    [KEY_WINDOW insertSubview:SINGLE.RenderBGView belowSubview:self.view];
    
    //3. 传入layer开始动画
    [CATransaction transactionWithAnimations:^{
        [self Animating:layer];
    } Completion:^{
        //将背景从KEY_WINDOW上面移除
        [SINGLE.RenderBGView removeFromSuperview];
    }];
}

//动画函数（仍待拓展）
- (void)Animating:(CALayer*)layer{
    self.layer = layer;
    
//    CATransition *animation =[CATransition animation];
//    animation.duration = 0.3f;
//    animation.type = kCATransitionMoveIn;
//    //（0~1）数字默认为0，数字越大越靠近结束位置
//    animation.startProgress = 0.7;
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    [animation setSubtype:kCATransitionFromRight];
    
    
//    CATransition *transitionAnim =[CATransition animation];
//    transitionAnim.type = kCATransitionFade;
//    transitionAnim.duration = 0.4f;
//    transitionAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];

//    CAKeyframeAnimation *KeyframeAnim = [CAKeyframeAnimation animation];
//    KeyframeAnim.keyPath = @"transform.translation.x";
//    KeyframeAnim.values = @[@(100),@(0), @(-3), @(0)];
//    KeyframeAnim.keyTimes = @[@(0.0),@(0.4),@(0.7),@(1)];
//    KeyframeAnim.duration = 0.4f;
//    KeyframeAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    HJWSpringAnimation *springAnim = [HJWSpringAnimation animation];
    springAnim.keyPath = @"position.x";
    springAnim.fromValue = @(SCREEN_WIDTH/3);
    springAnim.toValue = @(0.0f);
    springAnim.velocity = 13;
    springAnim.mass = 0.6;
    springAnim.damping = 13;
    springAnim.stiffness = 100;
    springAnim.additive = YES;
    springAnim.duration = [springAnim durationForEpsilon:0.01];
    [self.layer addAnimation:springAnim forKey:@"transition"];
}



@end
