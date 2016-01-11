//
//  HJWAnimatingTabBarConstants.h
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <UIKit/UIKit.h>

extern CGFloat const HJWBottomSelectedDotDefaultSize;
extern CGFloat const HJWBottomSelectedDotOffset;
extern CGFloat const HJWTabBarViewDefaultHeight;
extern CGFloat const HJWExtraTabBarItemsDefaultHeight;
extern CGFloat const HJWForExtraTabBarItemsDefaultOffset;
extern UIEdgeInsets const HJWTabBarViewHDefaultEdgeInsets;
extern UIEdgeInsets const HJWTabBarViewItemsDefaultEdgeInsets;


extern CFTimeInterval const kHJWExpandAnimationDuration;

typedef struct {
    CFTimeInterval beginTime;
    CFTimeInterval duration;
    double fromValue;
    double toValue;
    double damping;
    double velocity;
} HJWAnimationParameters;

typedef struct {
    HJWAnimationParameters scaleX;
    HJWAnimationParameters scaleY;
    HJWAnimationParameters rotation;
    HJWAnimationParameters bounce;
} HJWAdditionalButtonsAnimationsParameters;

typedef struct {
    HJWAnimationParameters rotation;
    HJWAnimationParameters bounce;
} HJWCenterButtonAnimationsParameters;

typedef struct {
    NSTimeInterval duration;
    NSTimeInterval delay;
    CGFloat damping;
    CGFloat velocity;
    UIViewAnimationOptions options;
} HJWExtraTabBarItemViewAnimationParameters;

typedef struct {
    HJWAnimationParameters scaleX;
    HJWAnimationParameters scaleY;
} HJWSelectedDotAnimationsParameters;

extern HJWAdditionalButtonsAnimationsParameters const kHJWAdditionalButtonsAnimationsParameters;
extern HJWSelectedDotAnimationsParameters const kHJWSelectedDotAnimationsParameters;
extern HJWAnimationParameters const kHJWExtraLeftTabBarItemAnimationParameters;
extern HJWAnimationParameters const kHJWExtraRightTabBarItemAnimationParameters;
extern HJWAnimationParameters const kHJWTabBarExpandAnimationParameters;
extern HJWAnimationParameters const kHJWTabBarCollapseAnimationParameters;
extern HJWCenterButtonAnimationsParameters const kHJWCenterButtonExpandAnimationParameters;
extern HJWCenterButtonAnimationsParameters const kHJWCenterButtonCollapseAnimationParameters;
extern HJWAnimationParameters const kHJWBounceAnimationParameters;
extern HJWExtraTabBarItemViewAnimationParameters const kHJWShowExtraTabBarItemViewAnimationParameters;
extern HJWExtraTabBarItemViewAnimationParameters const kHJWHideExtraTabBarItemViewAnimationParameters;