//
//  wyrPasswordController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/28.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrPasswordController.h"
#import "wyrCodeLogin.h"
#define  viewmargin 35
@interface wyrPasswordController ()

@end

@implementation wyrPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    wyrCodeLogin * login = [[wyrCodeLogin alloc] initWithFrame:CGRectMake(viewmargin,50,[UIScreen mainScreen].bounds.size.width-2*viewmargin,300)];
    
    [login setupLogin1];
    
    login.phoneNumber = _phoneNumber;
    
    [self.view addSubview:login];
    
    login.passwordTureBlock = ^(NSString * password){
        NSLog(@"%@",password);
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.label.text=@"正在注册，请稍候！";
        
        
        hud.mode = MBProgressHUDModeIndeterminate;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:NO];
        });
        
        //发送给服务器的字典
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
        params[@"user_phone"] = weakSelf.phoneNumber;
        params[@"user_pwd"] = password;
        
        [ZmHttptool getWithJSONBaseURL:kregister params:params success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                wyrAccount *account=[wyrAccount accountWithDict:responseObject];
                //存储账号信息
                [wyrAccountTool saveAccount:account];
                //切换窗口的根控制器
                //[UIWindow switchRootViewController];
                UIWindow *window=[UIApplication sharedApplication].keyWindow;
                [window switchRootViewController];
                
                NSLog(@"wyraccount%@",account);
                
            }
            
        } failure:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    };
    login.passwordErrorBlock = ^(){
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.label.text=@"两次密码不一致，请重新输入！";
        
        
        hud.mode = MBProgressHUDModeCustomView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:NO];
        });
    };

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
