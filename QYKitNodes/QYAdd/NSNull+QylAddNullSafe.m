//
//  NSNull+QylAddNullSafe.m
//  QYNodeDemo
//
//  Created by Adele on 15/11/30.
//  Copyright (c) 2015年 lqy. All rights reserved.
//

#import "NSNull+QylAddNullSafe.h"
#import <objc/runtime.h>

#ifndef NULLSAFE_ENABLED

#if DEBUG
#define NULLSAFE_ENABLED 1 // DEBUG 0 
#else
#define NULLSAFE_ENABLED 1
#endif

#endif

@implementation NSNull (QylAddNullSafe)

#if NULLSAFE_ENABLED
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    @synchronized([self class]){
        NSMethodSignature *signature = nil;
        if ([super respondsToSelector:@selector(methodSignatureForSelector:)] ) {
            signature = [super methodSignatureForSelector:aSelector];
        }
        if (signature == nil) {
            static NSMutableSet *objc_classList = nil;
            static NSMutableDictionary *objc_signatureCache = nil;
            
            if (objc_signatureCache == nil) {
                
                objc_classList = [NSMutableSet set];
                objc_signatureCache = [NSMutableDictionary dictionary];
                
                uint32_t numClasses;
                Class *classes = NULL;
                numClasses = objc_getClassList(NULL, 0);
                if (numClasses > 0) {
                    classes = (Class *)malloc(sizeof(Class) * numClasses);
                    numClasses = objc_getClassList(classes, numClasses);
                    
                }
                
                NSMutableSet *excluded = [NSMutableSet set];
                for (uint32_t i = 0; i < numClasses; i++) {
                    Class oneClass = classes[i];
                    Class superClass = class_getSuperclass(oneClass);
                    while (superClass) {
            
                        if (superClass == [NSObject class]) {
                            [objc_classList addObject:oneClass];
                            break;
                        }
                        
                        [excluded addObject:NSStringFromClass(superClass)];
                        superClass = class_getSuperclass(superClass);
                    }
                }
                
                for (Class oneClass in excluded) {
                    [objc_classList removeObject:oneClass];
                }
                
                if (classes)free(classes);
            }
            
            NSString *selectorString = NSStringFromSelector(aSelector);
            signature = objc_signatureCache[selectorString];
            if (!signature) {
                for (Class oneClass in objc_classList) {
                    if ([oneClass instancesRespondToSelector:aSelector]) {
                        signature = [oneClass instanceMethodSignatureForSelector:aSelector];
                        break;
                    }
                }
                objc_signatureCache[selectorString] = signature ? signature : [NSNull null];
            }else if ([signature isKindOfClass:[NSNull class]]){
                signature = nil;
            }
        }
        return signature;
    }
//    return nil;// if nil will be carsh
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{
    [anInvocation invokeWithTarget:nil];
}
#endif

@end
