//
//  NSObject+YYModel.m
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import "NSObject+YYModel.h"

@implementation NSObject (YYModel)

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary{
    if (!dictionary || dictionary == (id)kCFNull) return nil;
    if (![dictionary isKindOfClass:[NSDictionary class]]) return nil;
    id one = [self new];
    return one;
}

@end
