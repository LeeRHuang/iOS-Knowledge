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
    
    return YES;
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
