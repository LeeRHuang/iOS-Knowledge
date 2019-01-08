//
//  TFBaseModel.h
//  Knowledge
//
//  Created by Lee on 2019/1/8.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TFBaseModel : NSObject<NSCoding>

- (void)encode:(NSCoder *)aDecoder;
- (void)decode:(NSCoder *)aCoder;
- (NSArray *)ignoredNames;

@end

NS_ASSUME_NONNULL_END
