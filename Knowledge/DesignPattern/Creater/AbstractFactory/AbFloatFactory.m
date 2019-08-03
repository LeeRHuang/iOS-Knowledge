//
//  AbFloatFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "AbFloatFactory.h"
#import "KFloat.h"

@implementation AbFloatFactory

- (KNumber *)creatNumber; {
    return [KFloat new];
}

@end
