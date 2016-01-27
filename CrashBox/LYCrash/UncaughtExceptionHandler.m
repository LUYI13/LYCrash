//
//  UncaughtExceptionHandler.m
//  textToEmail
//
//  Created by LuYi on 14-10-21.
//  Copyright (c) 2014年 LuYi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UncaughtExceptionHandler.h"
#import <sys/utsname.h>


@implementation UncaughtExceptionHandler

+(void)installUncaughtExceptionHandler
{

    NSSetUncaughtExceptionHandler(&HandleException);
}



@end

void HandleException(NSException *exception)
{

    //截屏保存
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(screenWindow.frame.size);
    [screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screnshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *screenshotPNG = UIImagePNGRepresentation(screnshot);//保存
    NSError *error = nil;
    //获得文件路径
    NSArray *pahts = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [pahts objectAtIndex:0];
    NSString *pngPath = [documentsPath stringByAppendingPathComponent:@"screenshot.png"];
    
    [screenshotPNG writeToFile: pngPath options: NSAtomicWrite error: &error];//写入沙盒
    
    struct utsname systemInfo;
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];//手机型号
    //    NSString *platform = @"iPhone";
    
    if ([platform isEqualToString:@"iPhone1,1"])    platform = @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    platform = @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    platform = @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    platform = @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,2"])    platform = @"iPhone 4 (GSM Rev A)";
    if ([platform isEqualToString:@"iPhone3,3"])    platform = @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    platform = @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    platform = @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    platform = @"iPhone 5 (Global)";
    if ([platform isEqualToString:@"iPhone5,3"])    platform = @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    platform = @"iPhone 5c (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    platform = @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    platform = @"iPhone 5s (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    platform = @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    platform = @"iPhone 6";
    
    NSString *version = [[UIDevice currentDevice] systemVersion];//系统版本
    
    NSArray *arr = [exception callStackSymbols];//得到当前调用栈信息
    NSString *reason = [exception reason];//非常重要，就是崩溃的原因
    NSString *name = [exception name];//异常类型
    
    NSString *crashLogInfo = [NSString stringWithFormat:@"exception \n Platform : %@ \n Version : %@ \n Type : %@ \n Crash reason : %@ \n Call stack info : %@", platform, version, name, reason, arr];
//    NSString *textPath = [documentsPath stringByAppendingPathComponent:@"exception.txt"];
//    [crashLogInfo writeToFile:textPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"-------崩溃处理--------");
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isOver"];
    [[NSUserDefaults standardUserDefaults] setObject:crashLogInfo forKey:@"crashString"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}


