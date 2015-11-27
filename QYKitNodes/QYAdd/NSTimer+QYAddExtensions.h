//
//  NSTimer+QYAddExtensions.h
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (QYAddExtensions)

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                    repeats:(BOOL)yesOrNo
                             executiveBlock:(void (^)(NSTimer *timer))block;

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                           repeats:(BOOL)yesOrNo
                    executiveBlock:(void (^)(NSTimer *timer))block;

@end
