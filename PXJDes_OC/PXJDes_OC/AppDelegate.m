//
//  AppDelegate.m
//  PXJDes_OC
//
//  Created by hh on 16/5/5.
//  Copyright © 2016年 pxj. All rights reserved.
//

#import "AppDelegate.h"
#import "PXJDes.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    NSString *string = @"我正在使用Des对此段数据进行加密";
    NSString *encrypt1 = [PXJDes encryptUseDES:string];
    NSString *decrypt1 = [PXJDes decryptUseDES:encrypt1];
    NSLog(@"encrypt1 = %@",encrypt1);
    NSLog(@"decrypt1 = %@",decrypt1);
    NSString *key = @"isDes!!!";
    NSString *encrypt2 = [PXJDes encryptUseDES:string key:key];
    NSString *decrypt2 = [PXJDes decryptUseDES:encrypt2 key:key];
    NSLog(@"encrypt2 = %@",encrypt2);
    NSLog(@"decrypt2 = %@",decrypt2);
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
