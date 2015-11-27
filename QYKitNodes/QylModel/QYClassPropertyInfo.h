//
//  QYClassPropertyInfo.h
//  QYNodeDemo
//
//  Created by Adele on 15/11/27.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface QYClassPropertyInfo : NSObject

@property (nonatomic, assign, readonly) objc_property_t property;

@property (nonatomic, strong, readonly) NSString *name; //property name;

@property (nonatomic, assign) Class cls;

@property (nonatomic, strong) NSString *structName;

@property (nonatomic, copy) NSString *protocol;

@property (nonatomic, assign) BOOL isOptional;

@property (nonatomic, assign) BOOL isIngore;

@property (nonatomic, strong) NSString *getter;

@property (nonatomic, strong) NSString *setter;

@property (nonatomic, strong) NSString *ivarName;



@end
