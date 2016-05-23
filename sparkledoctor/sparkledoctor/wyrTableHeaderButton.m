//
//  wyrTableHeaderButton.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/1.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrTableHeaderButton.h"
#import "wyrAccountTool.h"
#import "UIImageView+WebCache.h"
@interface wyrTableHeaderButton()
@property(nonatomic,strong)UIImageView *headView;
@property(nonatomic,strong)UILabel *titleLab;
@end

@implementation wyrTableHeaderButton
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        CGFloat width=CGRectGetWidth(frame);
        _headView=[[UIImageView alloc]initWithFrame:CGRectMake(width/20,width/20,width/5,width/5)];
        _headView.layer.masksToBounds = YES;
        _headView.layer.borderColor = [UIColor whiteColor].CGColor;
        _headView.layer.borderWidth = 4.f;
        _headView.layer.cornerRadius = CGRectGetWidth(_headView.frame) / 2;
        [self addSubview:_headView];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_headView.frame) + width / 20, CGRectGetMaxY(_headView.frame) - CGRectGetHeight(_headView.frame) / 2 - 10, width -CGRectGetMaxX(_headView.frame) - width / 20, 20)];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.font = [UIFont systemFontOfSize:18];
        [self addSubview:_titleLab];
       
        //通知
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(changeBtn) name:@"viewWillAppear" object:nil];
        
//        //设置
//        [self setTitle:@"登录／注册" forState:UIControlStateNormal];
//        [self setImage:[UIImage circleImageWithName:@"placeholder" borderWidth:4.0 borderColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        
        //
        [self addTarget:self action:@selector(toRegisterPage) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
//
-(void)changeBtn{
    NSLog(@"%@",[wyrAccountTool account].user_token);
    if ([wyrAccountTool account].user_token) {
        NSLog(@"名字%@",[wyrAccountTool account].user_nickName);
        NSLog(@"图片%@",[wyrAccountTool account].profile_image_url);
        _titleLab.text=[wyrAccountTool account].user_nickName;
        [_headView sd_setImageWithURL:[NSURL URLWithString:[wyrAccountTool account].profile_image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.userInteractionEnabled=NO;
    }else{
        _titleLab.text=@"登录／注册";
        [_headView sd_setImageWithURL:[NSURL URLWithString:[wyrAccountTool account].profile_image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.userInteractionEnabled=YES;
    }
}



//设置按钮内部的imageView的frame
//contentRect是按钮的bounds
//-(CGRect)imageRectForContentRect:(CGRect)contentRect{
//    CGFloat imageW=80;
//    CGFloat imageX=20; CGFloat imageY=30;
//    CGFloat imageH=80;
//    return CGRectMake(imageX,imageY,imageW,imageH);
//}
//设置按钮内部titleLabel的frame
//-(CGRect)titleRectForContentRect:(CGRect)contentRect{
//    CGFloat imageW=100;
//    CGFloat imageX=130; CGFloat imageY=40;
//    CGFloat imageH=60;
//    return CGRectMake(imageX,imageY,imageW,imageH);
//
//}
//点击按钮调用代理
-(void)toRegisterPage{
    if(_delegate && [_delegate conformsToProtocol:@protocol(wyrTableHeaderButtonDelegate)] &&
       [_delegate respondsToSelector:@selector(tableHeaderButtonClick)]){
        [_delegate tableHeaderButtonClick];
    }
}
@end
