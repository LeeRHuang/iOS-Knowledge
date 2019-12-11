//
//  MessageForwarding.m
//  Knowledge
//
//  Created by Lee on 2019/3/1.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "MessageForwarding.h"
#import <objc/runtime.h>
#import "MessageTarget.h"

@implementation MessageForwarding

void foo(id obj, SEL _cmd)
{
    NSLog(@"Doing foo");
}

///** 消息发送，动态方法解析，分为实例方法和类方法 Start */
+(BOOL)resolveInstanceMethod:(SEL)sel//实例方法的动态方法解析，如果返回NO，则进入转发，返回YES重新进入lookUpImpOrForward:的Retry标签
{
    if (sel == @selector(run)) {
        class_addMethod([self class], sel, (IMP)foo, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if(aSelector == @selector(run)){
        return [[MessageTarget alloc] init];
    }
    if(aSelector == @selector(eat)){
        return [[MessageTarget alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *methodSignature = [super methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:*"];
    }
    return methodSignature;
}


- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = invocation.selector;
    if(sel == @selector(run)) {
        [invocation invokeWithTarget:[[MessageTarget alloc] init]];
    }if(sel == @selector(drive)) {
        [invocation invokeWithTarget:[[MessageTarget alloc] init]];
    } else {
        [self doesNotRecognizeSelector:sel];
    }
}

@end
