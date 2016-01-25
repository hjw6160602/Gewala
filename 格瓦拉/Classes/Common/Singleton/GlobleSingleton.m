//
//  GlobleSingleton.m
//  格瓦拉
//
//  Created by shoule on 16/1/21.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "GlobleSingleton.h"

@implementation GlobleSingleton
singleton_implementation(GlobleSingleton)

- (UIImageView *)RenderBGView{
    UIImageView *imageView;
    if (self.RenderBGImg) {
        imageView = [[UIImageView alloc]initWithImage:self.RenderBGImg];
    }
    return imageView;
}

@end
