//
//  BenzFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "BenzFactory.h"
#import "ProductBenz.h"

@implementation BenzFactory

+ (ProductBenz *)creatCar {
    ProductBenz *benz = [[ProductBenz alloc] init];
    return benz;
}

@end
