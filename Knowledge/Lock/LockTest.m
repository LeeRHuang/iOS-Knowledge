//
//  LockTest.m
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "LockTest.h"

@implementation LockTest

- (void)testSynchornized {
    NSObject *obj = [[NSObject alloc] init];
    NSObject *obj2 = [[NSObject alloc] init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(obj) {
           NSLog(@"需要线程同步的操作1 开始");
           sleep(3);
           NSLog(@"需要线程同步的操作1 结束");
        }
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        @synchronized(obj) {
           NSLog(@"需要线程同步的操作2");
        }
    });
}

- (void)testSsemaphore {
    dispatch_semaphore_t signal = dispatch_semaphore_create(3);
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, overTime);
                NSLog(@"需要线程同步的操作1 开始");
                sleep(2);
                NSLog(@"需要线程同步的操作1 结束");
       dispatch_semaphore_signal(signal);
    });
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(1);
            dispatch_semaphore_wait(signal, overTime);
                NSLog(@"需要线程同步的操作2");
            dispatch_semaphore_signal(signal);
    });
}

- (void)testRecursiveLock {
    NSLock *lock = [[NSLock alloc] init];

//    NSRecursiveLock *lock = [[NSRecursiveLock alloc] init];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    static void (^RecursiveMethod)(int);

    RecursiveMethod = ^(int value) {

    [lock lock];

    if (value > 0) {

    NSLog(@"value = %d", value);

    sleep(1);

    RecursiveMethod(value - 1);

    }
    [lock unlock];


    };

    RecursiveMethod(5);

    });

}

- (void)testConditionLock {
    NSConditionLock *lock = [[NSConditionLock alloc] init];
    NSMutableArray *products = [NSMutableArray array];

    NSInteger HAS_DATA = 1;

    NSInteger NO_DATA = 0;

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    while (1) {

    [lock lockWhenCondition:NO_DATA];

    [products addObject:[[NSObject alloc] init]];

    NSLog(@"produce a product,总量:%zi",products.count);

    [lock unlockWithCondition:HAS_DATA];

    sleep(1);

    }

    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    while(1) {

    NSLog(@"wait for product");

    [lock lockWhenCondition:HAS_DATA];

    [products removeObjectAtIndex:0];

    NSLog(@"custome a product");

    [lock unlockWithCondition:NO_DATA];
        }

        });
}

- (void)testCondition {
    NSCondition *condition = [[NSCondition alloc] init];

    NSMutableArray *products = [NSMutableArray array];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    while  (1) {

    [condition lock];

    if ([products count] == 0) {

    NSLog(@"wait for product");

    [condition wait];

    }

    [products removeObjectAtIndex:0];

    NSLog(@"custome a product");

    [condition unlock];

    }

    });

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

    while (1) {

    [condition lock];

    [products addObject:[[NSObject alloc] init]];

    NSLog(@"produce a product,总量:%zi",products.count);

    [condition signal];

    [condition unlock];

    sleep(1);

    }

    });


}

@end
