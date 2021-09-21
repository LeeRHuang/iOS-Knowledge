//
//  TwoStackQueue.m
//  Knowledge
//
//  Created by lirihuang on 2021/9/21.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "TwoStackQueue.h"

@interface TwoStackQueue () {
    NSMutableArray *_stack1;
    NSMutableArray *_stack2;
}

@end

@implementation TwoStackQueue

- (instancetype)init {
    self = [super init];
    if (self) {
        _stack1 = [NSMutableArray array];
        _stack2 = [NSMutableArray array];
    }
    return self;
}

- (void)appendTail:(NSInteger)value {
    [_stack1 addObject:@(value)];
}

- (NSNumber *)deleateHead {
    
    /*
    1、如果栈2没有元素，那么将栈1的元素依次取出来，放入栈2中，将栈2的栈顶元素删除就是队列的head元素
    2、如果栈2为空那么返回-1
    3、如果栈2有元素，那么已有的元素就是步骤2中从栈1取出来放进来的，直接将要加到队列tail的元素放入
       栈1，将栈2的栈顶元素删除也就是head的元素
     */
    if (_stack2.count == 0) {
        while (_stack1.count > 0) {
            NSNumber *value = [_stack1 objectAtIndex:_stack1.count - 1];
            [_stack2 addObject:value];
            [_stack1 removeObject:value];
        }
    }
    
    if (_stack2.count == 0) {
        return @(-1);
    }else {
        NSNumber *value = [_stack2 objectAtIndex:_stack2.count - 1];
        [_stack2 removeObject:value];
        return value;
    }
}

@end
