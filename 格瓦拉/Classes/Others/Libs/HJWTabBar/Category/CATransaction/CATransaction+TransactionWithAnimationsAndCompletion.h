//
//  CATransaction+TransactionWithAnimationsAndCompletion.h
//  贺嘉炜
//
//  Created by SaiDicaprio on 16/1/7.
//  Copyright © 2016年 SaiDicaprio. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransaction (TransactionWithAnimationsAndCompletion)

+ (void)transactionWithAnimations:(void(^)(void))animations andCompletion:(void(^)(void))completion;

@end
