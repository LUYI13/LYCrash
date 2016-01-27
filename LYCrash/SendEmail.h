//
//  SendEmail.h
//  textToEmail
//
//  Created by LuYi on 14-10-27.
//  Copyright (c) 2014年 LuYi. All rights reserved.
//

#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"

@interface SendEmail : SKPSMTPMessage <SKPSMTPMessageDelegate>

-(void)sendEmail;

@end
