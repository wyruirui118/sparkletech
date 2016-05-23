//
//  AppDelegate.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//app启动完毕后调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //1.创建窗口
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //2.显示窗口,如果用UIWindow+Extension的类方法,一定要先显示再设置根控制器,要不窗口会不存在
    [self.window makeKeyAndVisible];
    //3.设置根控制器
    [self.window switchRootViewController];
    
    //向微信注册
    [WXApi registerApp:@"wxb86aeb86ec190aeb"];
    
    //短信sdk注册
    [SMSSDK registerApp:appKey withSecret:appSecret];
    
    return YES;
}
//当应用程序从活动状态转入不活动状态时
- (void)applicationWillResignActive:(UIApplication *)application {
    
}
//当应用程序进入后台时调用
- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}
//当应用程序将要进入前台时调用
- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}
//当应用程序已经进入前台，进入活动状态时
- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}
//当应用程序被终止时调用
- (void)applicationWillTerminate:(UIApplication *)application {
    
}
//当程序接收到内存警告时调用
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    
}

#warning 微信要求重写的方法过期了
////微信重写方法
-(BOOL)application:(UIApplication *)application openURL:(nonnull NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(nonnull id)annotation{
    return [WXApi handleOpenURL:url delegate:self];
}
-(BOOL)application:(UIApplication *)application handleOpenURL:(nonnull NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}
-(void) onReq:(BaseReq*)req{
    
}
-(void) onResp:(BaseResp*)resp{
    
}

@end
