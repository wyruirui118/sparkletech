//
//  wyrCodeLogin.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/27.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  填写验证码视图

#import <UIKit/UIKit.h>

@interface wyrCodeLogin : UIView
@property(nonatomic,strong)NSString *phoneNumber;
@property(nonatomic,strong)ErrorBlock errorBlock;
@property(nonatomic,copy)TureBlock tureBlock;
@property (nonatomic,copy) PassWordTureBlock passwordTureBlock;
@property (nonatomic,copy) passWordErrorBlock passwordErrorBlock;
-(void)setupLogin;
-(void)setupLogin1;
@end
