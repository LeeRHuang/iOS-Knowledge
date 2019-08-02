//
//  BuildCar.m
//  Knowledge
//
//  Created by 李日煌 on 2019/8/1.
//  Copyright © 2019年 PPD. All rights reserved.
//

#import "BuildCar.h"
#import "BaoMa.h"
#import "Benz.h"

@implementation BuildCar

- (void)buildBaoMa {
    NSLog(@"command build BMW!");
    [BaoMa startBuild];
}

- (void)buildBenz {
    NSLog(@"command build BENZ!");
    [Benz startBuild];
}

@end
