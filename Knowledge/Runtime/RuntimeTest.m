//
//  RuntimeTest.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "RuntimeTest.h"
#import "MessageForwarding.h"
#import "MessageTarget.h"
#import "Personal.h"
#import "UIImage+KZ_Load.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation RuntimeTest

- (instancetype)init {
    self = [super init];
    if (self) {
//        MessageForwarding *target = [MessageForwarding new];
//        [target performSelector:@selector(eat)];
//        [target performSelector:@selector(drive)];
        [Personal startUp];
//        [Personal eat];

        [UIImage imageNamed:@"xxx"];
    }
    return self;
}

@end
