//
//  BlockTest.m
//  Knowledge
//
//  Created by 李日煌 on 2019/3/2.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest

- (void)testBlock {
    void(^blockA)(void) = ^{
        NSLog(@"just a block");
    };
    NSLog(@"%@", blockA);
    
    NSInteger value = 10;
    
    void(^blockB)(void) = ^{
        NSLog(@"just a block === %ld", value);
    };
    NSLog(@"%@", blockB);
    
    void(^ __weak blockC)(void) = ^{
        NSLog(@"just a block === %ld", value);
    };
    
    NSLog(@"%@", blockC);
    
//    self.callBack(@"aaa");
    
}

@end
