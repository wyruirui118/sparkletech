//
//  AppDelegate.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <UIKit/UIKit.h>
//在需要使用微信终端API的文件中import WXApi.h头文件,并增加WXApiDelegate协议
#import "WXApi.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

