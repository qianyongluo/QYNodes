//
//  NSTimer+QYAddExtensions.m
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import "NSTimer+QYAddExtensions.h"

@implementation NSTimer (QYAddExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                    repeats:(BOOL)yesOrNo
                             executiveBlock:(void (^)(NSTimer *timer))block
                                    {
    
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(__executive_block:) userInfo:[block copy] repeats:yesOrNo];
    
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                           repeats:(BOOL)yesOrNo
                    executiveBlock:(void (^)(NSTimer *timer))block {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(__executive_block:) userInfo:[block copy] repeats:yesOrNo];
}

+ (void)__executive_block:(NSTimer *)timer{
    if ([timer userInfo]) {
        void (^block)(NSTimer *timer) = [timer userInfo];
        block(timer);
    }
}


@end
