//
//  ViewController.m
//  CrashBox
//
//  Created by LuYi on 16/1/26.
//  Copyright © 2016年 LuYi. All rights reserved.
//

#import "ViewController.h"
#import "SendEmail.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"isOver"] == YES) {
        
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isOver"];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"崩溃信息" message:@"已获取崩溃信息，将发送邮件" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            SendEmail *mail = [[SendEmail alloc] init];
            [mail sendEmailSubjest:@"Title"
                           toEmail:@"to@email.here"
                         fromEmail:@"from@email.here"
                             login:@"from email login"
                              pass:@"from email pass"];

        }];
        [alertController addAction:action];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }

}

- (IBAction)onCrash:(id)sender {
    
    id test = nil;
    NSDictionary *dic = [NSDictionary new];
    [dic setValue:test forKey:@"test"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
