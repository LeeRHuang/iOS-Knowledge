//
//  TFBaseModel.m
//  Knowledge
//
//  Created by Lee on 2019/1/8.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "TFBaseModel.h"
#import <objc/runtime.h>

@implementation TFBaseModel

+ (NSArray *)ignoredNames {
    return nil;
}

// 在系统方法内来调用我们的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

- (void)encode:(NSCoder *)aDecoder {
    Class c = self.class;
    while (c && c != [NSObject class]) {
        unsigned int outCounts = 0;
        Ivar *ivars = class_copyIvarList(c, &outCounts);
        for (int i = 0;i < outCounts; i++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([key hasPrefix:@"__"]) {
                continue;
            }
            if ([key hasPrefix:@"_"]) {
                key = [key stringByReplacingOccurrencesOfString:@"_" withString:@""];
            }
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) {
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
            if ([key hasPrefix:@"__"]) {
                continue;
            }
            if ([key hasPrefix:@"_"]) {
                key = [key stringByReplacingOccurrencesOfString:@"_" withString:@""];
            }
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) {
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
