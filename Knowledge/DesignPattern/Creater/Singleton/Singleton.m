//
//  Singleton.m
//  Knowledge
//
//  Created by 李日煌 on 2019/7/31.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (Singleton *)shareInstance {
    static Singleton *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[Singleton alloc] init];
    });
    return instance;
}

- (void)test {
    NSLog(@"this is Singleton!");
}

@end
