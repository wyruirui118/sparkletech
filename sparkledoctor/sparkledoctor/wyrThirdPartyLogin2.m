//
//  wyrThirdPartyLogin2.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/11.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrThirdPartyLogin2.h"
#define margin 5
@implementation wyrThirdPartyLogin2

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //登录
        UILabel *labelone=[[UILabel alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width,40)];
        labelone.text=@"登录就医通账号";
        labelone.font=[UIFont systemFontOfSize:25];
        labelone.textAlignment=NSTextAlignmentCenter;
        labelone.backgroundColor=[UIColor redColor];
        [self addSubview:labelone];
        
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
        
        //输入密码
        UITextField *passWord=[[UITextField alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(textPhone.frame)+margin,self.frame.size.width,40)];
        passWord.placeholder=@"填写密码";
        passWord.layer.masksToBounds=YES;  //下三行设置边框
        passWord.layer.borderWidth=3;
        passWord.layer.borderColor=[UIColor grayColor].CGColor;
        passWord.secureTextEntry=YES;  //密码形式输入
        self.passWord=passWord;
        [self addSubview:passWord];
        
        //登录
        UIButton *loginBtn=[[UIButton alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(passWord.frame)+margin,self.frame.size.width,40)];
        loginBtn.backgroundColor=[UIColor blackColor];
        [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        loginBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        [loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        self.loginBtn.userInteractionEnabled = NO;
        self.loginBtn=loginBtn;
        [self addSubview:loginBtn];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText) name:UITextFieldTextDidChangeNotification object:nil];
        
    }
    return self;
}

-(void)changeText{
    
    if (self.textPhone.text.length < 11) {
        self.loginBtn.userInteractionEnabled = NO;
    }else if(self.passWord.text.length < 6){
        self.loginBtn.userInteractionEnabled = NO;
    }else{
        self.loginBtn.userInteractionEnabled = YES;
    }
    
}

-(void)loginBtnAction:(UIButton *)sender{
    
    self.loginBlock(self.textPhone.text,self.passWord.text);
}

@end
