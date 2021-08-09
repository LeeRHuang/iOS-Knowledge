//
//  MemoryTwo.h
//  Knowledge
//
//  Created by lirihuang on 2021/8/1.
//  Copyright © 2021 PPD. All rights reserved.
//

#import "MemoryOne.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MemoryTwo : NSObject

@property(nonatomic,copy) NSString *str;
@property(nonatomic,copy,readonly) NSString *name;

@property(nonatomic,strong) MemoryOne *one;

@end

NS_ASSUME_NONNULL_END
