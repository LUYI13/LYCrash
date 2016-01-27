//
//  UncaughtExceptionHandler.h
//  textToEmail
//
//  Created by LuYi on 14-10-21.
//  Copyright (c) 2014年 LuYi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UncaughtExceptionHandler : NSObject

+(void)installUncaughtExceptionHandler;

@end

void HandleException(NSException *exception);

