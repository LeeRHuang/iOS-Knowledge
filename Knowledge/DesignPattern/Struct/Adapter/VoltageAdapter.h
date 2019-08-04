//
//  VoltageAdapter.h
//  Knowledge
//
//  Created by 李日煌 on 2019/8/4.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoltageDeleagte.h"

@interface VoltageAdapter : NSObject<VoltageDeleagte>

@property (nonatomic, strong) id country;
@property (nonatomic, weak) id<VoltageDeleagte> delegate;

- (instancetype)initAdapterWithTarget:(id)country;

@end
