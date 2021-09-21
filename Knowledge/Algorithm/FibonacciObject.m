//
//  FibonacciObject.m
//  Knowledge
//
//  Created by lirihuang on 2021/9/20.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "FibonacciObject.h"

@implementation FibonacciObject

int Fibonacci(int n ) {
    // f(x) = f(x-1) + f(x-2);
    // write code here
    if(n == 0 || n == 1) {
        return 1;
    }
    int pre = 0;
    int cur = 1;
    int next = 0;
    for (int i = 2; i <= n; i++) {
        next = cur + pre;
        pre = cur;
        cur = next;
    }
    return next;
}

@end
