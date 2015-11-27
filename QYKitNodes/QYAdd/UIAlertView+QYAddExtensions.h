//
//  UIAlertView+QYAddExtensions.h
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (QYAddExtensions)

/**
 *  block for alertView delegate
 */
+ (UIAlertView *)alertWithTitle:(NSString *)t
                        message:(NSString *)m
                          block:(void (^)(UIAlertView *alertView,NSInteger clickIndex))block
              cancelButtonTitle:(NSString *)cbt
              otherButtonTitles:(NSString *)otherButtonTitles, ...;

@end
