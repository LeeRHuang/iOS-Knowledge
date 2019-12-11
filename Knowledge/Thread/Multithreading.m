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
        [self ayncSerial];
        
    }
    return self;
}

- (void)test{
    NSLog(@"2");
}

- (void)test2{
    NSLog(@"4");
}

- (void)testAsync_queue {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        NSLog(@"1");
        NSLog(@"当前线程是：%@",[NSThread currentThread]);
        [self performSelector:@selector(test) withObject:nil afterDelay:0];
        [[NSRunLoop currentRunLoop] run];
        NSLog(@"3");
        [self performSelector:@selector(test2) withObject:nil];
    });
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
//        sleep(2);
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
