//
//  UIAlertView+QYAddExtensions.m
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import "UIAlertView+QYAddExtensions.h"
#import <objc/runtime.h>
@implementation UIAlertView (QYAddExtensions)

- (void)__qylSetAssociatedBlock:(void (^)(UIAlertView *, NSInteger))associatedBlock{
    objc_setAssociatedObject(self, @selector(__qylassociatedBlock), [associatedBlock copy], OBJC_ASSOCIATION_COPY);
}

- (void (^)(UIAlertView *, NSInteger))__qylassociatedBlock{
   return objc_getAssociatedObject(self, _cmd);
}

+ (UIAlertView *)alertWithTitle:(NSString *)t
                        message:(NSString *)m
                          block:(void (^)(UIAlertView *alertView,NSInteger clickIndex))block
              cancelButtonTitle:(NSString *)cbt
              otherButtonTitles:(NSString *)otherButtonTitles, ...

{
    UIAlertView *alt = [[UIAlertView alloc] initWithTitle:t message:m delegate:self cancelButtonTitle:cbt otherButtonTitles:otherButtonTitles, nil];
    [alt __qylSetAssociatedBlock:block];
    return alt;
}

+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    void (^block)(UIAlertView *, NSInteger) = [alertView __qylassociatedBlock];
    if (block) {
        block(alertView,buttonIndex);
    }
}

@end
