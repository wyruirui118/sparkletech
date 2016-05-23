//
//  UIWindow+Extension.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "UIWindow+Extension.h"
#import "wyrNewfeatureViewController.h"
#import "wyrTabBarViewController.h"

@implementation UIWindow (Extension)
+(void)switchRootViewController{
    //上一次使用的版本(存储在沙盒中的版本号)
    NSString *key=@"CFBundleVersion";
    NSString *lastVersion=[[NSUserDefaults standardUserDefaults]objectForKey:key];
    //当前软件的版本号(在info.plist中获得)
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    if ([currentVersion isEqualToString:lastVersion]) { //版本号相同:这次打开的和上次是同一个版本
        window.rootViewController=[[wyrTabBarViewController alloc]init];
    }else{  //这次打开的版本和上一次不一样,显示新特性
        window.rootViewController=[[wyrNewfeatureViewController alloc]init];
        //将当前版本号存到沙盒
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize]; //立即同步
    }
}
-(void)switchRootViewController{
    //上一次使用的版本(存储在沙盒中的版本号)
    NSString *key=@"CFBundleVersion";
    NSString *lastVersion=[[NSUserDefaults standardUserDefaults]objectForKey:key];
    //当前软件的版本号(在info.plist中获得)
    NSString *currentVersion=[NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {  //版本号相同:这次打开的和上次是同一个版本
        self.rootViewController=[[wyrTabBarViewController alloc]init];
    }else{  //这次打开的版本和上一次不一样,显示新特性
        self.rootViewController=[[wyrNewfeatureViewController alloc]init];
        //将当前版本号存到沙盒
        [[NSUserDefaults standardUserDefaults]setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize]; //立即同步
    }
}
@end
