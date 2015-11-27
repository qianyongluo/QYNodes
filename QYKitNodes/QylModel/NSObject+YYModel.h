//
//  NSObject+YYModel.h
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YYModel)

+ (instancetype)modelWithJSON:(id)json;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictionary;

@end
