//
//  wyrThirdpartyLogin.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/5.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  第三方登录视图

#import <UIKit/UIKit.h>

@interface wyrThirdpartyLogin : UIView
@property(nonatomic,weak)UITextField *textPhone;
@property(nonatomic,weak)UIButton *btnGetCode;

@property(nonatomic,weak)UIButton *sina;
@property(nonatomic,weak)UIButton *wechat;
@property(nonatomic,weak)UIButton *qq;

//
@property(nonatomic,copy)ErrorBlock errorblock;
@property(nonatomic,copy)SMSErrorBlock SMSErrorblock;
@property(nonatomic,copy)TureBlock tureBlock;
@end
