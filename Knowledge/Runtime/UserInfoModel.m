//
//  UserInfoModel.m
//  Knowledge
//
//  Created by Lee on 2019/1/7.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "UserInfoModel.h"
#import "NSObject+Extension.h"

@implementation UserInfoModel

// 设置需要忽略的属性
- (NSArray *)ignoredNames {
    return @[@"bone"];
}

// 在系统方法内来调用我们的方法
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self decode:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

@end
