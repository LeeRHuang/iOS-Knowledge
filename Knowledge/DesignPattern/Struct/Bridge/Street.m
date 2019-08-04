//
//  Street.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/4.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "Street.h"

@implementation Street

@synthesize bus;
@synthesize car;

- (void)run {
    NSLog(@"running on Street!");
    if ([self.bus respondsToSelector:@selector(run)]) {
        [self.bus run];
    }
    if ([self.car respondsToSelector:@selector(run)]) {
        [self.car run];
    }
}

@end
