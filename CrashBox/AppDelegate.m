//
//  AppDelegate.m
//  CrashBox
//
//  Created by LuYi on 16/1/26.
//  Copyright © 2016年 LuYi. All rights reserved.
//

#import "AppDelegate.h"
#import "UncaughtExceptionHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UncaughtExceptionHandler installUncaughtExceptionHandler];
    
    return YES;
}


@end
