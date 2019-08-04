//
//  VoltageAdapter.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/4.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "VoltageAdapter.h"
#import "China.h"
#import "USA.h"

@implementation VoltageAdapter

- (instancetype)initAdapterWithTarget:(id)country {
    self = [super self];
    if (self) {
        _country = country;
        _delegate = _country;
    }
    return self;
}


- (float)charge {
    if ([_country isKindOfClass:[USA class]]) {
        return [China normalChargeVoltage]/2.0f;
    }
    return [China normalChargeVoltage];
}

@end
