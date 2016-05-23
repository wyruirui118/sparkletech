//
//  wyrOAuthViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/7.
//  Copyright © 2016年 sparkletech. All rights reserved.
//
#import "wyrOAuthViewController.h"
#import "AFNetworking.h"
#import "wyrAccountTool.h"
#import "wyrAccount.h"
#import "wyrProfileViewController.h"
@interface wyrOAuthViewController () <UIWebViewDelegate>

@end

@implementation wyrOAuthViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    //1.创建一个webView
    UIWebView *webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate=self;
    [self.view addSubview:webView];
    //2.用webView加载登录页面(新浪提供的),请求地址和参数在新浪的文档中有说明
    //client_id:申请应用时分配的AppKey   redirect_uri授权回调地址,站外应用需与设置的回调地址一致,站内应用需填写canvas page的地址
    NSURL *url=[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=407396000&redirect_uri=http://&forcelogin=true"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

//拦截请求
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //1.获得url
    NSString *url=request.URL.absoluteString;
    //2.判断是否为回调地址
    NSRange range=[url rangeOfString:@"code="];
    NSLog(@"aaa%@",url);
    if (range.length!=0) { //是回调地址
        //截取code=后面的参数值
        unsigned long fromIndex=range.location+range.length;
        NSString *code=[url substringFromIndex:fromIndex];
        //利用code换取一个accessToken
        [self accessTokenWithCode:code];
        //禁止加载回调地址,仅仅返回accessToken即可
        return NO;
    }
    NSLog(@"bbb%@",url);
    return YES;
}


/* 新浪规定的POST请求方式.url:https://api.weibo.com/oauth2/access_token
 client_id 申请应用时分配的AppKey。
 client_secret 申请应用时分配的AppSecret。
 grant_type 请求的类型，填写authorization_code
 grant_type为authorization_code时
 code 调用authorize获得的code值。
 redirect_uri 回调地址，需需与注册应用里的回调地址一致。
 */
//利用code(授权成功后的request token)换取一个accessToken
-(void)accessTokenWithCode:(NSString *)code{
    //1.请求管理者
    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
    mgr.responseSerializer=[AFJSONResponseSerializer serializer];
    //2.拼接请求参数
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"]=@"407396000";
    params[@"client_secret"]=@"16f078dd738a70d2eab975ee451aff41";
    params[@"grant_type"]=@"authorization_code";
    params[@"code"]=code;
    params[@"redirect_uri"]=@"http://";
    //3.发送请求
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary * responseObject) {
        
        NSLog(@"发送请求");
        
        NSMutableDictionary *param=[NSMutableDictionary dictionary];
        param[@"access_token"]=responseObject[@"access_token"];
        param[@"uid"]=responseObject[@"uid"];
        __block  NSString * token = responseObject[@"access_token"];
        __block  NSString * uid = responseObject[@"uid"];
        __block  NSString * expires_in = responseObject[@"expires_in"];
        [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:param success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"获取信息%@",responseObject);
            //将返回的账号字典数据转为模型数据,存进沙盒
          
            NSMutableDictionary * mdic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
            mdic[@"access_token"] = token;
            mdic[@"uid"] = uid;
            mdic[@"expires_in"] = expires_in;
            
            
            wyrAccount *account=[wyrAccount accountWithDict:mdic];
            //存储账号信息
            [wyrAccountTool saveAccount:account];
            //切换窗口的根控制器
            //[UIWindow switchRootViewController];
            UIWindow *window=[UIApplication sharedApplication].keyWindow;
            [window switchRootViewController];
            
//            NSLog(@"用户姓名%@",account.name);
//            NSLog(@"用户头像地址%@",account.profile_image_url);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"error%@",error);
        }];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail %@",error);
    }];
}


@end
