//
//  HJWAnimatingTabBarConstants.m
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "HJWAnimatingTabBarConstants.h"

CGFloat const HJWBottomSelectedDotDefaultSize = 4.f;
CGFloat const HJWBottomSelectedDotOffset = 16.f;
CGFloat const HJWTabBarViewDefaultHeight = 80.f;
CGFloat const HJWExtraTabBarItemsDefaultHeight = 48.f;
CGFloat const HJWForExtraTabBarItemsDefaultOffset = 15.f;
UIEdgeInsets const HJWTabBarViewHDefaultEdgeInsets = {10.f, 14.f, 10.f, 14.f};
UIEdgeInsets const HJWTabBarViewItemsDefaultEdgeInsets = {0.f, 0.f, 0.f, 0.f};


CFTimeInterval const kHJWExpandAnimationDuration = 1.0;

CGFloat const kDegreeToRadiansRatio = M_PI / 180.f;

HJWAnimationParameters const kHJWBounceAnimationParameters = (HJWAnimationParameters) {
    .duration = kHJWExpandAnimationDuration * 2.0 / 3.0,
    .damping = 0.5,
    .velocity = 3.0
};

HJWAnimationParameters const kHJWExtraLeftTabBarItemAnimationParameters = (HJWAnimationParameters) {
    .duration = kHJWExpandAnimationDuration * 3.0 / 4.0,
    .damping = 0.74,
    .velocity = 1.2,
    .fromValue = 0.0,
    .toValue = M_PI * 2.0 * 2.0
};

HJWAnimationParameters const kHJWExtraRightTabBarItemAnimationParameters = (HJWAnimationParameters) {
    .duration = kHJWExpandAnimationDuration * 3.0 / 4.0,
    .damping = 0.74,
    .velocity = 1.2,
    .fromValue = 0.0,
    .toValue = M_PI * 2.0 * -2.0
};

HJWAnimationParameters const kHJWTabBarExpandAnimationParameters = (HJWAnimationParameters) {
    .duration = kHJWExpandAnimationDuration / 2.0,
    .damping = 0.5,
    .velocity = 0.6
};

HJWAnimationParameters const kHJWTabBarCollapseAnimationParameters = (HJWAnimationParameters) {
    .duration = kHJWExpandAnimationDuration * 0.6,
    .damping = 1,
    .velocity = 0.2
};

HJWCenterButtonAnimationsParameters const kHJWCenterButtonExpandAnimationParameters = (HJWCenterButtonAnimationsParameters) {
    .rotation = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = M_PI * 2.0 + 45.0 * kDegreeToRadiansRatio
    },
    .bounce = (HJWAnimationParameters) {
        .beginTime = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 45.0 * kDegreeToRadiansRatio + M_PI / 8.0,
        .toValue = 45.0 * kDegreeToRadiansRatio
    }
};

HJWCenterButtonAnimationsParameters const kHJWCenterButtonCollapseAnimationParameters = (HJWCenterButtonAnimationsParameters) {
    .rotation = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = 315.0 * kDegreeToRadiansRatio
    },
    .bounce = (HJWAnimationParameters) {
        .beginTime = kHJWExpandAnimationDuration / 4.0,
        .fromValue = M_PI / 8.0,
        .toValue = 0.0
    }
};

HJWSelectedDotAnimationsParameters const kHJWSelectedDotAnimationsParameters =
(HJWSelectedDotAnimationsParameters) {
    .scaleX = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = 1.0
    },
    .scaleY = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = 1.0
    }
};

HJWAdditionalButtonsAnimationsParameters const kHJWAdditionalButtonsAnimationsParameters = (HJWAdditionalButtonsAnimationsParameters) {
    .scaleX = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = 1.0
    },
    .scaleY = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = 1.0
    },
    .rotation = (HJWAnimationParameters) {
        .duration = kHJWExpandAnimationDuration / 4.0,
        .fromValue = 0.0,
        .toValue = M_PI * 2.0 * 5.0
    },
    .bounce = (HJWAnimationParameters) {
        .beginTime = kHJWExpandAnimationDuration / 4.0,
        .fromValue = M_PI / 8.0,
        .toValue = 0.0
    }
};

HJWExtraTabBarItemViewAnimationParameters const kHJWShowExtraTabBarItemViewAnimationParameters = (HJWExtraTabBarItemViewAnimationParameters) {
    .duration = kHJWExpandAnimationDuration / 2.0,
    .damping = 0.5f,
};

HJWExtraTabBarItemViewAnimationParameters const kHJWHideExtraTabBarItemViewAnimationParameters = (HJWExtraTabBarItemViewAnimationParameters) {
    .duration = kHJWExpandAnimationDuration / 8.0,
};
