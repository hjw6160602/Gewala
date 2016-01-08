//
//  CATransaction+TransactionWithAnimationsAndCompletion.m
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import "CATransaction+TransactionWithAnimationsAndCompletion.h"

@implementation CATransaction (TransactionWithAnimationsAndCompletion)

+ (void)transactionWithAnimations:(void(^)(void))animations andCompletion:(void(^)(void))completion {
    [CATransaction begin]; {
        [CATransaction setCompletionBlock:completion];
        if (animations) {
            animations();
        }
    } [CATransaction commit];
}

@end
