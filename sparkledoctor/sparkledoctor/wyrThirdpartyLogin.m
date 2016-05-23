//
//  wyrThirdpartyLogin.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/5.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrThirdpartyLogin.h"
#define margin 5
@implementation wyrThirdpartyLogin
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //注册
        UILabel *labelone=[[UILabel alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,40)];
        labelone.text=@"注册就医通账户";
        labelone.font=[UIFont systemFontOfSize:25];
        labelone.textAlignment=NSTextAlignmentCenter;
        labelone.backgroundColor=[UIColor redColor];
        [self addSubview:labelone];

#warning 未解决问题:把"填写手机号"的文字居中显示
        //输入手机号
        UITextField *textPhone=[[UITextField alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(labelone.frame)+margin,self.frame.size.width,40)];
        textPhone.placeholder=@"填写手机号";
        textPhone.layer.masksToBounds=YES;  //下三行设置边框
        textPhone.layer.borderWidth=3;
        textPhone.layer.borderColor=[UIColor grayColor].CGColor;
        textPhone.keyboardType=UIKeyboardTypeNumberPad; //数字形式
        self.textPhone=textPhone;
        [self addSubview:textPhone];
        textPhone.backgroundColor=[UIColor greenColor];
        
        //获取验证码
        UIButton *btnGetCode=[[UIButton alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(textPhone.frame)+margin,self.frame.size.width,40)];
        btnGetCode.backgroundColor=[UIColor blackColor];
        [btnGetCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        btnGetCode.titleLabel.textAlignment=NSTextAlignmentCenter;
        self.btnGetCode=btnGetCode;
        [btnGetCode addTarget:self action:@selector(btnGetCodeAction:) forControlEvents:UIControlEventTouchUpInside];  //点击获取验证码
        [self addSubview:btnGetCode];
        
        //第三方登录文字
        UILabel *labeltwo=[[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(btnGetCode.frame)+margin,self.frame.size.width,30)];
        labeltwo.text=@"或使用以下方式直接登录";
        labeltwo.font=[UIFont systemFontOfSize:12];
        labeltwo.textColor=[UIColor greenColor];
        labeltwo.textAlignment=NSTextAlignmentCenter;
        [self addSubview:labeltwo];

        //圆形图标
        //新浪
        CGFloat sinaX=4*margin;
        CGFloat btnY=CGRectGetMaxY(labeltwo.frame)+margin;
        CGFloat btnW=50;
        CGFloat btnH=50;
        UIButton *sina=[[UIButton alloc]initWithFrame:CGRectMake(sinaX,btnY,btnW,btnH)];
        [sina setBackgroundImage:[UIImage imageNamed:@"sina"] forState:UIControlStateNormal];
        sina.layer.masksToBounds=YES;
        sina.layer.cornerRadius=CGRectGetWidth(sina.frame)/2;
        self.sina=sina;
        [self addSubview:sina];
        
        //微信
        CGFloat wechatX=self.frame.size.width/3+4*margin;
        UIButton *wechat=[[UIButton alloc]initWithFrame:CGRectMake(wechatX,btnY,btnW,btnH)];
        [wechat setBackgroundImage:[UIImage imageNamed:@"wechat"] forState:UIControlStateNormal];
        wechat.layer.masksToBounds=YES;
        wechat.layer.cornerRadius=CGRectGetWidth(sina.frame)/2;
        self.wechat=wechat;
        [self addSubview:wechat];
        
        //qq
        CGFloat qqX=self.frame.size.width/3*2+4*margin;
        UIButton *qq=[[UIButton alloc]initWithFrame:CGRectMake(qqX,btnY,btnW,btnH)];
        [qq setBackgroundImage:[UIImage imageNamed:@"qq"] forState:UIControlStateNormal];
        qq.layer.masksToBounds=YES;
        qq.layer.cornerRadius=CGRectGetWidth(sina.frame)/2;
        self.qq=qq;
        [self addSubview:qq];
        
        
        self.backgroundColor=[UIColor orangeColor];
    }
    return self;
}

//获取短信
-(void)btnGetCodeAction:(UIButton *)sender{
    NSLog(@"%@",_textPhone.text);
    //判断获取电话号码是否满足11位
    if (_textPhone.text.length!=11) {
        _errorblock();
    }else{
//        [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_textPhone.text
//                                       zone:@"86"
//                           customIdentifier:nil
//                                     result:^(NSError *error){
//                                         if (!error) {
//                                             NSLog(@"获取验证码成功");
//                                             _tureBlock(_textPhone.text);
//                                             
//                                         } else {
//                                             NSLog(@"错误信息：%@",error);
//                                             _SMSErrorblock(error);
//                                         }
//                                     }];
        _tureBlock(_textPhone.text);
    }
}

@end
