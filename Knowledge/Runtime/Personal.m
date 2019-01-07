//
//  Personal.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "Personal.h"
#import <objc/runtime.h>

@implementation Personal

+ (void)load {
    Method m1 = class_getClassMethod(self.class, @selector(startUp));
    Method M2 = class_getClassMethod(self.class, @selector(eat));
    method_exchangeImplementations(m1, M2);
}

+ (void)startUp {
    NSLog(@"startUp");
}

+ (void)eat {
    NSLog(@"eatting");
}

@end
