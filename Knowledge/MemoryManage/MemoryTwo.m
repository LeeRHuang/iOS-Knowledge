//
//  MemoryTwo.m
//  Knowledge
//
//  Created by lirihuang on 2021/8/1.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryTwo.h"
#import <objc/runtime.h>
#import "MemoryTestDelegate.h"
#import "NSObject+Test1.h"

@interface MemoryTwo ()<MemoryTestDelegate>

@end

@implementation MemoryTwo
@synthesize str = _str;
@synthesize sex;


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self printAllIvar];
    }
    
    return self;
}

//- (void)setStr:(NSString *)str {
//    if (_str != str) {
//        _str = [str copy]; // 新的引用计数加1
//    }
//}
//
//- (NSString *)str {
//    return _str;
//}

// 利用runtime获取所有成员变量
- (void)printAllIvar {
    unsigned int outCount;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"MemoryTwo变量名称是 ==> %@",ivarName);
    }
    
    self.str = @"UUU";
    NSLog(@"XXX IS %@",self.str);
    
    NSLog(@"name is %@",self.name);
    
    self.sex = @"Man";
    NSLog(@"sex is %@",self.sex);
    
//    NSLog(@"country is %@",self.country);
}


@end
