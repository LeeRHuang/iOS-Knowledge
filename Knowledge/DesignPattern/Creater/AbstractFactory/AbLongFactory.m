//
//  AbLongFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "AbLongFactory.h"
#import "KLong.h"

@implementation AbLongFactory

- (KNumber *)creatNumber; {
    return [KLong new];
}

@end
