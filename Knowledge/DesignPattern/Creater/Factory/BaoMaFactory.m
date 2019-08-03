//
//  BaoMaFactory.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/3.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "BaoMaFactory.h"
#import "ProductBaoMa.h"

@implementation BaoMaFactory

+ (ProductBaoMa *)creatCar {
    ProductBaoMa *baoma = [[ProductBaoMa alloc] init];
    return baoma;
}

@end
