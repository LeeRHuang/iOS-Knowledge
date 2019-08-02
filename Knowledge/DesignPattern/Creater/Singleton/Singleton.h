//
//  Singleton.h
//  Knowledge
//
//  Created by 李日煌 on 2019/7/31.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+ (Singleton *)shareInstance;
- (void)test;

@end
