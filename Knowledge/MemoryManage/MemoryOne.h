//
//  MemoryOne.h
//  Knowledge
//
//  Created by lirihuang on 2021/8/1.
//  Copyright © 2021 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemoryOne : NSObject

@property(nonatomic,copy) NSString *str;

- (void)testTaggedPointer;

@end

NS_ASSUME_NONNULL_END
