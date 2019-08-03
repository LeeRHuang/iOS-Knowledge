//
//  AbIntegerFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "AbIntegerFactory.h"
#import "KInteger.h"

@implementation AbIntegerFactory

- (KNumber *)creatNumber; {
    return [KInteger new];
}

@end
