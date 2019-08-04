//
//  AppDelegate.m
//  Knowledge
//
//  Created by Lee on 2018/11/26.
//  Copyright © 2018年 PPD. All rights reserved.
//

#import "AppDelegate.h"
#import "Multithreading.h"
#import "RuntimeTest.h"
#import "UserInfoModel.h"
#import "Prototype.h"
#import "Singleton.h"
#import "BuildCar.h"
#import "Director.h"
#import "CarFactory.h"
#import "BaoMaFactory.h"
#import "BenzFactory.h"
#import "ProductBaoMa.h"
#import "ProductBenz.h"
#import "AbstractFactory.h"
#import "VoltageAdapter.h"
#import "China.h"
#import "USA.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    Multithreading *threading = [[Multithreading alloc] init];
//    RuntimeTest *runtime = [[RuntimeTest alloc] init];
    
//    UserInfoModel *infoModel = [[UserInfoModel alloc] init];
//    infoModel.name = @"Lee";
//    infoModel.age = 28;
//    infoModel.mobile = @"18910898751";
//    infoModel.gennder = @"男";
//    NSError *error;
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:infoModel];
//
//    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"model"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//
//    NSData *cacheData = [[NSUserDefaults standardUserDefaults] objectForKey:@"model"];
//    UserInfoModel *cacheInfoModel = [NSKeyedUnarchiver unarchiveObjectWithData:cacheData];
    [self testPrototypePattern];
    [self testSignleton];
    [self testBuilder];
    [self testFactory];
    [self testAbstractFactory];
    [self adapter];
    return YES;
}

//原型模式
- (void)testPrototypePattern {
    Prototype *p1 = [[Prototype alloc] init];
    Prototype *p2 = [p1 copy];
    Prototype *p3 = p1;
    NSLog(@"p1 == %@,p2 == %@,p3 == %@",p1.name,p2.name,p3.name);
    
    p1.name = @"it's my way";
    
    NSLog(@"p1_new == %@,p2_new == %@,p3_new == %@",p1.name,p2.name,p3.name);

    NSArray *arr = @[@1,@2,@3];
    NSMutableArray *copy1 = [arr copy];//深复制，不可变
    NSLog(@"copy1 == %@ arr_p=%p copy1_p=%p",copy1,&arr,&copy1);
//    [copy1 removeLastObject];
//    NSLog(@"copy1__%@",copy1);

    NSMutableArray *copy2 = [arr mutableCopy];//深复制，可变
    NSLog(@"copy2 == %@ arr_p=%p copy2_p=%p",copy2,&arr,&copy2);
    [copy2 removeLastObject];
    NSLog(@"copy2__%@",copy2);

    NSMutableArray *copy3 = [copy2 copy];//深复制，不可变
    NSLog(@"copy3 == %@ copy2_p=%p copy3_p=%p",copy3,&copy2,&copy3);
//    [copy3 removeLastObject];
//    NSLog(@"copy3__%@",copy3);
    
    NSMutableArray *copy4 = [copy2 mutableCopy];//深复制，可变
    NSLog(@"copy4 == %@ copy2_p=%p copy4_p=%p",copy4,&copy2,&copy4);
    [copy4 removeLastObject];
    NSLog(@"copy4__%@",copy4);
}

//单例模式
- (void)testSignleton {
    [[Singleton shareInstance] test];
}

//构建者模式
- (void)testBuilder {
    Director *d = [[Director alloc] init];
    BuildCar *b = [[BuildCar alloc] init];
    d.buildCar = b;
    [d build];
}

//工厂方法模式
- (void)testFactory {
    ProductCar *bmwCar = [BaoMaFactory creatCar];
    [bmwCar DIY];
    NSLog(@"brand is %@,tireType is %@",bmwCar.brand,bmwCar.tireType);
    
    ProductCar *benzCar = [BenzFactory creatCar];
    [benzCar DIY];
    NSLog(@"brand is %@,tireType is %@",benzCar.brand,benzCar.tireType);
}

//抽象工厂模式
- (void)testAbstractFactory {
    AbstractFactory *abstract = [AbstractFactory numberOfType:AbLong];
    KNumber *number = [abstract creatNumber];
    [number logNumberType];
}

//适配器模式
- (void)adapter {
    
    float chainaVoltage = [China normalChargeVoltage];
    NSLog(@"chainaVoltage is %f",chainaVoltage);

    VoltageAdapter *adapter = [[VoltageAdapter alloc] initAdapterWithTarget:[USA new]];
    float usaVoltage = [adapter charge];
    NSLog(@"usaVoltage is %f",usaVoltage);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
