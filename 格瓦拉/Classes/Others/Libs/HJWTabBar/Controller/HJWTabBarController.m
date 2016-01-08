//
//  HJWTabBarController.m
//  贺嘉炜
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWTabBarController.h"
#import "DiscoverController.h"
#import "BuyTicketController.h"
#import "ActivityController.h"
#import "FlimController.h"
#import "ProfileController.h"
#import "HJWTabBar.h"
#import "Const.h"

@interface HJWTabBarController ()<HJWTabBarDelegate>
/** 用于存储TabBar*/
@property (nonatomic, strong) HJWTabBar *myTabBar;
/** 标题 */
@property (nonatomic, strong) NSArray *titles;
/** 图片名称 */
@property (nonatomic, strong) NSArray *imgNames;
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
        [self addOneChlildVc:Controller title:title imageName:itemImgName selectedImageName:selectedImgName];
        index++;
    }
    self.tabBar.tintColor = HJW_GLOBLE_R;
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
    // 切换子控制器
    self.selectedIndex = to;
}




@end
