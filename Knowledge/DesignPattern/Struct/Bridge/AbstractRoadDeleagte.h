//
//  AbstractRoadDeleagte.h
//  Knowledge
//
//  Created by 李日煌 on 2019/8/4.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BBus.h"
#import "BCar.h"

@protocol AbstractRoadDeleagte <NSObject>

@property (nonatomic,strong) BCar *car;
@property (nonatomic,strong) BBus *bus;

- (void)run;

@end
