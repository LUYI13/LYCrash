//
//  SendEmail.h
//
//  Created by LuYi on 14-10-27.
//  Copyright (c) 2014年 LuYi. All rights reserved.
//

#import "SKPSMTPMessage.h"

@interface SendEmail : SKPSMTPMessage <SKPSMTPMessageDelegate>

- (void)sendEmailSubjest:(NSString *)sub toEmail:(NSString *)to fromEmail:(NSString *)from login:(NSString *)loginStr pass:(NSString *)passStr;

@end
