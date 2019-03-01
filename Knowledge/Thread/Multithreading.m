//
//  Multithreading.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "Multithreading.h"

@implementation Multithreading

- (instancetype)init {
    self = [super init];
    if (self) {
        [self syncSerial];
    }
    return self;
}

- (void)asyncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("com.ppdai.66qianzhuang", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"--start--%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"任务1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务4--%@",[NSThread currentThread]);
    });
    NSLog(@"--end--%@",[NSThread currentThread]);
}

- (void)syncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("com.ppdai.66qianzhuang", DISPATCH_QUEUE_SERIAL);
    NSLog(@"--start--%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"任务4--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3--%@",[NSThread currentThread]);
    });
    NSLog(@"--end--%@",[NSThread currentThread]);
}

- (void)ayncSerial {
    dispatch_queue_t queue = dispatch_queue_create("com.ppdai.66qianzhuang", DISPATCH_QUEUE_SERIAL);
    NSLog(@"--start--%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        NSLog(@"任务1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务3--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务4--%@",[NSThread currentThread]);
    });
    NSLog(@"--end--%@",[NSThread currentThread]);
}

- (void)syncSerial {
    dispatch_queue_t queue = dispatch_queue_create("com.ppdai.66qianzhuang", DISPATCH_QUEUE_SERIAL);
    NSLog(@"--start--%@",[NSThread currentThread]);
    dispatch_sync(queue, ^{
        NSLog(@"任务1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务4--%@",[NSThread currentThread]);
    });
    NSLog(@"--end--%@",[NSThread currentThread]);
}

- (void)syncMain {
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"--start--%@",[NSThread currentThread]);
    dispatch_sync(queue, ^{
        NSLog(@"任务1--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务2--%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"任务3--%@",[NSThread currentThread]);
    });
    NSLog(@"--end--");
}


@end
