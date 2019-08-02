//
//  Director.h
//  Knowledge
//
//  Created by 李日煌 on 2019/8/1.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuildCar.h"

@interface Director : NSObject

@property (nonatomic,strong) BuildCar *buildCar;

- (void)build;

@end
