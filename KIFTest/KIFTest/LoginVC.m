//
//  LoginVC.m
//  KIFTest
//
//  Created by bomo on 2017/3/3.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "LoginVC.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface LoginVC ()

@property (weak, nonatomic) IBOutlet UITextField *unameTf;
@property (weak, nonatomic) IBOutlet UITextField *pwdTf;

@end

@implementation LoginVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.unameTf.text = @"bomo";
    self.pwdTf.text = @"111111";
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    // Do any additional setup after loading the view.
}

- (void)dealloc {
	NSLog(@"%@-释放了",self.class);
}


#pragma mark - Private Method
- (IBAction)login:(id)sender
{
    
    if (self.unameTf.text.length > 0 && self.pwdTf.text.length > 0) {
        [SVProgressHUD showWithStatus:@"正在登录"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD showSuccessWithStatus:@"登录成功"];
            [SVProgressHUD dismissWithDelay:1];
            [self.navigationController popViewControllerAnimated:YES];
        });
        
    }
}

@end
