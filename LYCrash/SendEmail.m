//
//  SendEmail.m
//  textToEmail
//
//  Created by LuYi on 14-10-27.
//  Copyright (c) 2014年 LuYi. All rights reserved.
//

#import "SendEmail.h"

@implementation SendEmail

- (id)init
{
    
    self = [super init];
    
    return self;
}


- (void)sendEmail
{
    self.subject = @"崩溃报告";
    self.toEmail = @"411126004@qq.com";
    self.fromEmail = @"luyileo23@126.com";
    self.relayHost = @"smtp.126.com";
    self.login = @"luyileo23@126.com";
    self.pass = @"lu90531yi";
    self.delegate = super.delegate;
    [self setRequiresAuth:YES];
    [self setWantsSecure:YES];
    
    NSString *crash = [NSString stringWithFormat:@"%@", [[NSUserDefaults standardUserDefaults] stringForKey:@"crashString"]];
    
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey, crash, kSKPSMTPPartMessageKey, @"8bit", kSKPSMTPPartContentTransferEncodingKey, nil];
    
    NSArray *pahts = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [pahts objectAtIndex:0];
    NSString *imgPath = [documentsPath stringByAppendingPathComponent:@"screenshot.png"];
    NSData *imgData = [NSData dataWithContentsOfFile:imgPath];
    
    NSDictionary *imagePart = [NSDictionary dictionaryWithObjectsAndKeys:@"image/png;\r\n\tx-unix-mode=0644;\r\n\tname=\"screenshot.png\"", kSKPSMTPPartContentTypeKey, @"attachment:\r\n\tfilename=\"screenshot.png\"", kSKPSMTPPartContentDispositionKey, [imgData encodeBase64ForData], kSKPSMTPPartMessageKey, @"base64", kSKPSMTPPartContentTransferEncodingKey, nil];
    
    self.parts = [NSArray arrayWithObjects:plainPart, imagePart, nil];
    [self send];
    
}

#pragma mark -SKPSMTPMessage Delegate-

- (void)messageSent:(SKPSMTPMessage *)message
{
    NSLog(@"发送成功");
    UIAlertView *succeed = [[UIAlertView alloc]initWithTitle:@"发送成功" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [succeed show];
    [succeed release];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"crashString"];
    
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error
{
    
    NSLog(@"发送失败");
    UIAlertView *failed = [[UIAlertView alloc]initWithTitle:@"发送失败" message:@"" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [failed show];
    [failed release];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"crashString"];
    
}


@end
