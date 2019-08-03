//
//  CarFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//
#import "CarFactory.h"

@implementation CarFactory

+ (ProductCar *)creatCar {
    ProductCar *car = [[ProductCar alloc] init];
    return car;
}

@end
