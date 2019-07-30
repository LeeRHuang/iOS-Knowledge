//
//  Prototype.m
//  Knowledge
//
//  Created by 李日煌 on 2019/7/30.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "Prototype.h"

@implementation Prototype

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"Propotype";
    }
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return [[[self class] allocWithZone:zone] init];
}

@end
