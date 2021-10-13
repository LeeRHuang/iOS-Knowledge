//
//  MemoryAutoReleasePool.m
//  Knowledge
//
//  Created by lirihuang on 2021/9/2.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryAutoReleasePool.h"

@implementation MemoryAutoReleasePool

- (instancetype)init {
    self = [super init];
    if (self) {
//        [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        [self createObserver];
    }
    return self;
}

- (void)timerFired
{
    NSLog(@"---- timer fired ----");
}

- (void)dealloc {
    NSLog(@"MemoryAutoReleasePool 被释放了");
}

- (void)createObserver
{
    //创建监听者
    /*
    第一个参数 CFAllocatorRef allocator：分配存储空间 CFAllocatorGetDefault()默认分配
    第二个参数 CFOptionFlags activities：要监听的状态 kCFRunLoopAllActivities 监听所有状态
    第三个参数 Boolean repeats：YES:持续监听 NO:不持续
    第四个参数 CFIndex order：优先级，一般填0即可
    第五个参数 ：回调 两个参数observer:监听者 activity:监听的事件
    */

    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"RunLoop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"RunLoop要处理Timers了");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"RunLoop要处理Sources了");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"RunLoop要休息了");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"RunLoop醒来了");
                break;
            case kCFRunLoopExit:
                NSLog(@"RunLoop退出了");
                break;

            default:
                break;
        }
    });
 
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);  // 添加监听者，关键！
    CFRelease(observer); // 释放
}

@end
