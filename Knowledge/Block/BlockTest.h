//
//  BlockTest.h
//  Knowledge
//
//  Created by 李日煌 on 2019/3/2.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockTest : NSObject

@property (nonatomic, copy) NSString* (^callBack)(NSString *name);

- (void)testBlock;

@end
