//
//  AbstractFactory.h
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KNumber.h"

typedef NS_ENUM(NSInteger,ABNumberType){
    AbInteger = 1,
    AbFloat = 2,
    AbLong = 3,
};

@interface AbstractFactory : NSObject

+ (AbstractFactory *)numberOfType:(ABNumberType)type;
- (KNumber *)creatNumber;

@end
