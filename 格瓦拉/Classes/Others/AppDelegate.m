//
//  AppDelegate.m
//  格瓦拉
//
//  Created by shoule on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "AppDelegate.h"
#import "HJWTabBarController.h"
#import "IntroViewController.h"
#import "GlobleSingleton.h"
#import "Const.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:SCREEN_FRAME];
    self.window.rootViewController = [IntroViewController new];
    
    SINGLE.keyWindow = self.window;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
