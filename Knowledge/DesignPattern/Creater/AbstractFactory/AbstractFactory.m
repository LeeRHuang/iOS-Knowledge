//
//  AbstractFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "AbstractFactory.h"
#import "AbIntegerFactory.h"
#import "AbFloatFactory.h"
#import "AbLongFactory.h"

@implementation AbstractFactory

+ (AbstractFactory *)numberOfType:(ABNumberType)type {
    AbstractFactory *_factory;
    switch (type) {
        case AbInteger:
            _factory = [[AbIntegerFactory alloc] init];
            break;
        case AbFloat:
            _factory =  [AbFloatFactory new];
            break;
        case AbLong:
            _factory = [AbLongFactory new];
            break;
        default:
            break;
    }
    return _factory;
}

- (KNumber *)creatNumber; {
    return nil;
}

@end
