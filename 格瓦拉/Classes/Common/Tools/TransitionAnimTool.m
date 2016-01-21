//
//  TransitionAnimTool.m
//  格瓦拉
//
//  Created by shoule on 16/1/21.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "TransitionAnimTool.h"


@implementation TransitionAnimTool

+ (void)Animating:(CALayer *)layer{
    CABasicAnimation *anim = [[CABasicAnimation alloc]init];
    
    anim.keyPath = @"transform.translation.x";
    
    anim.fromValue = @(20);
    
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = 1;
    
    [layer addAnimation:anim forKey:@"transitionAnimation"];
}

@end
