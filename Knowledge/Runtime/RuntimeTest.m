//
//  RuntimeTest.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "RuntimeTest.h"
#import "Personal.h"
#import "UIImage+KZ_Load.h"

@implementation RuntimeTest

- (instancetype)init {
    self = [super init];
    if (self) {
        [Personal startUp];
        [Personal eat];
        [UIImage imageNamed:@"xxx"];
    }
    return self;
}

@end
