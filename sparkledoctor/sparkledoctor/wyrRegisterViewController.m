//
//  wyrRegisterViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/3.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrRegisterViewController.h"
#import "wyrLoginViewController.h"
#import "wyrThirdpartyLogin.h"
#import "wyrAccount.h"
#import "wyrAccountTool.h"
#import "wyrOAuthViewController.h"
#import "wyrNavigationController.h"
#import "AFNetworking.h"
#import "wyrUser.h"
#import "MJExtension.h"
#import "wyrTableHeaderView.h"
#import "wyrWechatViewController.h"
#import "wyrVfcCodeController.h"

#define  viewmargin 35
@interface wyrRegisterViewController ()

@end

@implementation wyrRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //第三方登录
    wyrThirdpartyLogin *thridpartyLogin=[[wyrThirdpartyLogin alloc]initWithFrame:CGRectMake(viewmargin,50,[UIScreen mainScreen].bounds.size.width-2*viewmargin,300)];
    [self.view addSubview:thridpartyLogin];
    self.view.backgroundColor=[UIColor whiteColor];
    //block弱引用
    __weak typeof(self)weakSelf = self;
    //调用手机号不满11位执行block
    thridpartyLogin.errorblock = ^(){
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.label.text=@"请输入正确的手机号码！";
        
        
        hud.mode = MBProgressHUDModeCustomView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:NO];
        });
    };
    
    thridpartyLogin.SMSErrorblock = ^(id error){
        NSLog(@"%@",error);
        MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.label.text=@"发送失败！";
        
        
        hud.mode = MBProgressHUDModeCustomView;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [hud hideAnimated:NO];
        });
       
        
    };
    
    thridpartyLogin.tureBlock = ^(NSString * phoneNumber){
        wyrVfcCodeController * vc = [[wyrVfcCodeController alloc] init];
        
        vc.title = @"";
        
        vc.phoneNumber = phoneNumber;
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    
    //设置导航栏
    [self setupNav];
    
    self.view.backgroundColor=[UIColor whiteColor];
    


    
    
    //点击新浪微博登录
    [thridpartyLogin.sina addTarget:self action:@selector(sinaOAuthlogin) forControlEvents:UIControlEventTouchUpInside];
    
#warning 交300元后注册微信开发者才能使用微信登录功能
    //点击微信登录
    [thridpartyLogin.wechat addTarget:self action:@selector(wechatOAuthlogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    //设置导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"img_02"] forBarMetrics:UIBarMetricsDefault];

}

//wechat-OAuth授权
-(void)wechatOAuthlogin{
//    wyrWechatViewController *wechatOAuth=[[wyrWechatViewController alloc]init];
//    [self.navigationController pushViewController:wechatOAuth animated:YES];
    NSLog(@"wechatOAuthlogin");
}


//sina-OAuth授权
-(void)sinaOAuthlogin{
//    wyrAccount *account=[wyrAccountTool account];
//    if (account) {  //上次已经登陆成功过
//        wyrOAuthViewController *sinaOAuth=[[wyrOAuthViewController alloc]init];
//        [self.navigationController pushViewController:sinaOAuth animated:YES];
//    }else{
    
        wyrOAuthViewController *sinaOAuth=[[wyrOAuthViewController alloc]init];
        [self.navigationController pushViewController:sinaOAuth animated:YES];
    
    //[self setupUserInfo];
   // }
}



//点击空白处键盘退下
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


//设置导航栏
-(void)setupNav{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancle)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"手机号登录" style:UIBarButtonItemStyleDone target:self action:@selector(login)];

    
}
//取消
-(void)cancle{
    [self.view endEditing:YES];  //键盘退下
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//
-(void)login{
    wyrLoginViewController *login=[[wyrLoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    [self.view endEditing:YES];  //键盘退下
}
@end
