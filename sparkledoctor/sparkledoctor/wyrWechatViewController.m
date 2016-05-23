//
//  wyrWechatViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/12.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrWechatViewController.h"
#import "WXApi.h"
@interface wyrWechatViewController () <WXApiDelegate>

@end

@implementation wyrWechatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建一个webview
//    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
//    webView.delegate=self;
//    [self.view addSubview:webView];
    
    //1.请求code
    [self sendAuthRequest];
    //2.通过code获取access_token
    
    
}
//请求code
-(void)sendAuthRequest{
    /*构造SendAuthReq结构体
      scope:应用授权作用域，如获取用户个人信息则填写snsapi_userinfo
      state:用于保持请求和回调的状态，授权请求后原样带回给第三方。该参数可用于防止csrf攻击（跨站请求伪造攻击），建议第三方带上该参数，可设置为简单的随机数加session进行校验
     */
    if([WXApi isWXAppInstalled]){  //是否安装微信
    SendAuthReq *req=[[SendAuthReq alloc]init];
    req.scope=@"snsapi_userinfo";
    req.state=@"sparkletech";
    //第三方向微信终端发送一个SendAuthReq消息请求
    [WXApi sendReq:req];
    }
}


@end
