//
//  NSObject+Extension.m
//  Knowledge
//
//  Created by Lee on 2019/1/7.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)

- (NSArray *)ignoredNmaes {
    return nil;
}

- (void)encode:(NSCoder *)aDecoder {
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCounts = 0;
        Ivar *ivars = class_copyIvarList(c, &outCounts);
        for (int i = 0;i < outCounts; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if ([self respondsToSelector:@selector(ignoredNmaes)]) {
                if ([[self ignoredNmaes] containsObject:key]) {
                    continue;
                }
            }
            id value = [self valueForKey:key];
            [aDecoder encodeObject:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

- (void)decode:(NSCoder *)aCoder {
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCounts = 0;
        Ivar *ivars = class_copyIvarList(c, &outCounts);
        for (int i = 0;i < outCounts; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            if ([self respondsToSelector:@selector(ignoredNmaes)]) {
                if ([[self ignoredNmaes] containsObject:key]) {
                    continue;
                }
            }
            id value = [aCoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        c = [c superclass];
    }
}

@end
