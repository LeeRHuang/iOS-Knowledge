//
//  TFDelegateObject.h
//  Knowledge
//
//  Created by lirihuang on 2021/9/17.
//  Copyright © 2021 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TestPP <NSObject>

+ (void)test1;

@end

@interface TFDelegateObject : NSObject<TestPP>

+ (void)check_pp;

@end

NS_ASSUME_NONNULL_END
