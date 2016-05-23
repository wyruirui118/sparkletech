//
//  wyrLoginViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/11.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrLoginViewController.h"
#import "wyrThirdPartyLogin2.h"
#define  viewmargin 35
@interface wyrLoginViewController ()

@end

@implementation wyrLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //第三方登录
    wyrThirdPartyLogin2 *thridpartyLogin2=[[wyrThirdPartyLogin2 alloc]initWithFrame:CGRectMake(viewmargin,50,[UIScreen mainScreen].bounds.size.width-2*viewmargin,300)];
    [self.view addSubview:thridpartyLogin2];
    self.view.backgroundColor=[UIColor whiteColor];
    
    __typeof(self)weakSelf = self;
    
    thridpartyLogin2.loginBlock = ^(NSString * phoneNumber,NSString * password){
        
        [weakSelf longin:phoneNumber and:password];
        
    };
    
    //设置导航栏
    [self setupNav];
    
    //设置导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"img_02"] forBarMetrics:UIBarMetricsDefault];
    
}

-(void)longin:(NSString *)phoneNumber and:(NSString *)password{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    params[@"user_phone"] = phoneNumber;
    
    params[@"user_pwd"] = password;
    
    [ZmHttptool getWithJSONBaseURL:Loginer params:params success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if ([responseObject[@"status"] isEqualToString:@"error"]) return ;
            
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
        
    }];
    
    
    

}

//点击空白处键盘退下
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


//设置导航栏
-(void)setupNav{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(cancle)];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"快速注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerPage)];
    
    
}
//取消
-(void)cancle{
    [self.view endEditing:YES];  //键盘退下
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//返回快速注册
-(void)registerPage{
    [self.navigationController popViewControllerAnimated:YES];
    [self.view endEditing:YES];  //键盘退下
}

@end
