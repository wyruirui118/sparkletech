//
//  wyrVfcCodeController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/27.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrVfcCodeController.h"
#import "wyrCodeLogin.h"
#import "wyrPasswordController.h"

#define viewmargin 35
@interface wyrVfcCodeController ()

@end

@implementation wyrVfcCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //
    wyrCodeLogin * login = [[wyrCodeLogin alloc] initWithFrame:CGRectMake(viewmargin,50,[UIScreen mainScreen].bounds.size.width-2*viewmargin,300)];
    [login setupLogin];
    login.phoneNumber=_phoneNumber;
    
    //
    __weak typeof(self)weakSelf = self;
    login.errorBlock = ^(){
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.label.text=@"验证码错误，请重新输入！";
        
        
        hud.mode = MBProgressHUDModeCustomView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:NO];
        });
    };
    
    login.tureBlock = ^(NSString * phoneNumber){
        NSLog(@"%@",phoneNumber);
        wyrPasswordController * vc = [[wyrPasswordController alloc] init];
        vc.phoneNumber = weakSelf.phoneNumber;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    [self.view addSubview:login];
    
    
    
}
@end
