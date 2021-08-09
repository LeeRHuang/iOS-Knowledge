//
//  MemoryOne.m
//  Knowledge
//
//  Created by lirihuang on 2021/8/1.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryOne.h"
#import <objc/runtime.h>

@interface MemoryOne ()

//@property(nonatomic,copy,readonly) NSString *str;

@end

@implementation MemoryOne

//@dynamic str;

@synthesize str = _str;

- (void)setStr:(NSString *)str {
    if (_str != str) {
        [_str release]; // 旧的引用计数减1
        _str = [str copy]; // 新的引用计数加1
    }
}

- (NSString *)str {
    return _str;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self testMemoryManage];
        [self printAllIvar];
    }
    
    return self;
}

// 利用runtime获取所有成员变量
- (void)printAllIvar {

    unsigned int outCount;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i++) {
        Ivar ivar = ivarList[i];
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        NSLog(@"变量名称是 ==> %@",ivarName);
    }
    
}

- (void)testTaggedPointer {
    self.str = @"111";
    self.str = @"222";
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
//        dispatch_async(queue, ^{
//            for (int i = 0 ; i<1000000; i++) {
//                self.str = @"abcd";
//            }
//        });
//        dispatch_async(queue, ^{
//            for (int i = 0 ; i<1000000; i++) {
//                self.str = [NSString stringWithFormat:@"adfalkdjfldkasjflakjsdkflasf-- %d",i];
//            }
//        });
}

- (void)testMemoryManage {
    id obj = [[NSObject alloc] init];
    NSObject *a1 = obj;
    NSLog(@"%p %p",&obj,&a1);
    
    NSLog(@"obj retainCount 是 ==> %ld",[obj retainCount]);
    NSObject *obj2 = [obj retain]; //
    NSLog(@"obj retainCount 是 ==> %ld",[obj retainCount]);
    NSLog(@"obj 内存地址是 %p obj2 内存地址是 %p",&obj,&obj2);
    [obj release];
    [obj2 release];
//    NSLog(@"obj retainCount 是 ==> %ld",[obj retainCount]);
}

@end
