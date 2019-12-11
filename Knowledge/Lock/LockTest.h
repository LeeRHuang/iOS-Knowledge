//
//  LockTest.h
//  Knowledge
//
//  Created by Lee on 2018/12/25.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LockTest : NSObject

- (void)testSynchornized;
- (void)testSsemaphore;
-(void)testRecursiveLock;
- (void)testConditionLock;
- (void)testCondition;

@end

NS_ASSUME_NONNULL_END
