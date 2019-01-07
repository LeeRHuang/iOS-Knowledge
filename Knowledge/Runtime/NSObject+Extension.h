//
//  NSObject+Extension.h
//  Knowledge
//
//  Created by Lee on 2019/1/7.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Extension)

- (void)encode:(NSCoder *)aDecoder;
- (void)decode:(NSCoder *)aCoder;

@end

NS_ASSUME_NONNULL_END
