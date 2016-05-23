//
//  wyrCodeLogin.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/27.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrCodeLogin.h"
@interface wyrCodeLogin()
@property(nonatomic,strong)UITextField *codeField;  //验证码
@property(nonatomic,strong)UIButton *vfcBtn;  //验证
@property(nonatomic,strong)UIButton *nVfcBtn;  //重发验证码
@property(nonatomic,strong)NSTimer *timer;  //定时器
@property(nonatomic,assign)NSInteger timeIndex;
@property(nonatomic,strong)UITextField *passWordFiled; //输入密码
@property(nonatomic,strong)UITextField *passWordFiled1;  //确认输入密码
@property (nonatomic,strong)UIButton * loginBtn;  //登录按钮

@end

@implementation wyrCodeLogin
//
-(void)setupLogin{
        CGFloat margin = 5;
        CGFloat heigth = 40;
        CGFloat width = CGRectGetWidth(self.frame) - 60;
        
        //请填写验证码
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame),heigth)];
        lab.text = @"请填写验证码";
        lab.font = [UIFont systemFontOfSize:25];
        lab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:lab];
        
        //填写验证码
        _codeField = [[UITextField alloc] initWithFrame:CGRectMake(30,CGRectGetMaxY(lab.frame) + margin,width,heigth)];
        _codeField.placeholder=@"填写验证码";
        _codeField.layer.masksToBounds=YES;  //下三行设置边框
        _codeField.layer.borderWidth=3;
        _codeField.layer.borderColor=[UIColor grayColor].CGColor;
        _codeField.keyboardType=UIKeyboardTypeNumberPad; //数字形式
        [self addSubview:_codeField];
        
        //验证
        _vfcBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(_codeField.frame),CGRectGetMaxY(_codeField.frame)+margin,CGRectGetWidth(_codeField.frame),CGRectGetHeight(_codeField.frame))];
        _vfcBtn.backgroundColor=[UIColor blackColor];
        [_vfcBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_vfcBtn setBackgroundColor:[UIColor greenColor]];
        _vfcBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        [_vfcBtn addTarget:self action:@selector(vfcBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_vfcBtn];
        
        //重发验证码
        _nVfcBtn =[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(_vfcBtn.frame),CGRectGetMaxY(_vfcBtn.frame)+margin,CGRectGetWidth(_vfcBtn.frame),CGRectGetHeight(_vfcBtn.frame))];
        _nVfcBtn.backgroundColor=[UIColor blackColor];
        [_nVfcBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_nVfcBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        _nVfcBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
        _nVfcBtn.backgroundColor = [UIColor whiteColor];
        [_nVfcBtn addTarget:self action:@selector(nVfcBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_nVfcBtn];
}
//
-(void)setupLogin1{
    CGFloat margin = 5;
    
    CGFloat heigth = 40;
    
    CGFloat width = CGRectGetWidth(self.frame) - 60;
    
    _passWordFiled = [[UITextField alloc] initWithFrame:CGRectMake(30, 0, width,heigth)];
    
    _passWordFiled.placeholder=@"请输入密码";
    _passWordFiled.secureTextEntry = YES;
    _passWordFiled.layer.masksToBounds=YES;  //下三行设置边框
    _passWordFiled.layer.borderWidth=3;
    _passWordFiled.layer.borderColor=[UIColor grayColor].CGColor;
    
    [self addSubview:_passWordFiled];
    
    _passWordFiled1 = [[UITextField alloc] initWithFrame:CGRectMake(30,CGRectGetMaxY(_passWordFiled.frame) + margin,width,heigth)];
    
    _passWordFiled1.placeholder=@"请再次确认密码";
    _passWordFiled1.secureTextEntry = YES;
    _passWordFiled1.layer.masksToBounds=YES;  //下三行设置边框
    _passWordFiled1.layer.borderWidth=3;
    _passWordFiled1.layer.borderColor=[UIColor grayColor].CGColor;
    
    [self addSubview:_passWordFiled1];
    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(30,CGRectGetMaxY(_passWordFiled1.frame) + margin,width,heigth)];
    
    [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    
    [_loginBtn setBackgroundColor:[UIColor lightGrayColor]];
    
    [_loginBtn addTarget:self action:@selector(loginBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _loginBtn.userInteractionEnabled = NO;
    
    [self addSubview:_loginBtn];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldChange) name:UITextFieldTextDidChangeNotification object:nil];
}



//验证
-(void)vfcBtnAction:(UIButton *)sender{
//    __weak typeof(self)weakSelf=self;
//    [SMSSDK commitVerificationCode:self.codeField.text phoneNumber:_phoneNumber zone:@"86" result:^(NSError *error) {
//        
//        if (!error) {
//            NSLog(@"验证成功");
//            weakSelf.tureBlock(weakSelf.phoneNumber);
//    
//         _tureBlock(self.phoneNumber);
//    
//        }
//        else
//        {
//            NSLog(@"错误信息:%@",error);
//            _errorBlock();
//        }
//    }];
    self.tureBlock(self.phoneNumber);

    

}

//重发验证码
-(void)nVfcBtnAction:(UIButton *)sender{
    _nVfcBtn.userInteractionEnabled = NO;
    _timeIndex = 60;
    [_nVfcBtn setTitle:[NSString stringWithFormat:@"重发验证码(%ld)",_timeIndex] forState:UIControlStateNormal];
    [_nVfcBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phoneNumber
                                   zone:@"86"
                       customIdentifier:nil
                                 result:^(NSError *error){
                                     if (!error) {
                                         NSLog(@"获取验证码成功");
                                         
                                     } else {
                                         NSLog(@"错误信息：%@",error);
                                     }
                                 }];

}
//
-(void)timerAction{
    _timeIndex--;
    [_nVfcBtn setTitle:[NSString stringWithFormat:@"重发验证码(%ld)",_timeIndex] forState:UIControlStateNormal];
    if (_timeIndex == 0) {
        _nVfcBtn.userInteractionEnabled = YES;
        [_nVfcBtn setTitle:@"重新发送验证码" forState:UIControlStateNormal];
        [_nVfcBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
        
    }
}

//监听textfiled输入
-(void)textFieldChange{
    if (_passWordFiled.text.length >= 6 && _passWordFiled1.text.length >= 6) {
        [_loginBtn setBackgroundColor:[UIColor greenColor]];
        _loginBtn.userInteractionEnabled = YES;
    }else{
        [_loginBtn setBackgroundColor:[UIColor lightGrayColor]];
        
        _loginBtn.userInteractionEnabled = NO;
    }
}

//注册
-(void)loginBtnAction:(UIButton *)sender{
    __weak typeof(self)weakSelf = self;
    if ([_passWordFiled.text isEqualToString:_passWordFiled1.text]) {
        weakSelf.passwordTureBlock(_passWordFiled1.text);
    }else{
        weakSelf.passwordErrorBlock();
    }
}


@end
