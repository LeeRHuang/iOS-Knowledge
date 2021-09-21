//
//  TFDelegateObject.m
//  Knowledge
//
//  Created by lirihuang on 2021/9/17.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "TFDelegateObject.h"

@implementation TFDelegateObject

+ (void)check_pp {
    if ([self respondsToSelector:@selector(test1)]) {
        [self test1];
    }
}

@end
