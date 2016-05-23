//
//  wyrTableHeaderView.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/1.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrTableHeaderView.h"
@implementation wyrTableHeaderView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor orangeColor];
        //第一个按钮
        self.mainBtn=[[wyrTableHeaderButton alloc]initWithFrame:CGRectMake(0,0,CGRectGetWidth(self.frame),120)];
        //self.mainBtn.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.mainBtn];
        //第二,三,四个按钮
        CGFloat btnY=self.mainBtn.size.height;
        CGFloat btnW=self.mainBtn.size.width/3;
        CGFloat btnH=self.bounds.size.height-self.mainBtn.size.height;
        self.btn2=[[UIButton alloc]initWithFrame:CGRectMake(0,btnY,btnW,btnH)];
        [self.btn2 setImage:[UIImage imageNamed:@"found_icons_qzone"] forState:UIControlStateNormal];
        [self.btn2 setTitle:@"赵虹" forState:UIControlStateNormal];
        [self.btn2 verticalImageAndTitle:3.0];
        [self addSubview:self.btn2];
        self.btn2.titleLabel.backgroundColor=[UIColor orangeColor];
        
        
        CGFloat btn3X=btnW;
        self.btn3=[[UIButton alloc]initWithFrame:CGRectMake(btn3X,btnY,btnW,btnH)];
        [self addSubview:self.btn3];
        [self.btn3 setImage:[UIImage imageNamed:@"found_icons_qzone"] forState:UIControlStateNormal];
        [self.btn3 setTitle:@"李海" forState:UIControlStateNormal];
        [self.btn3 verticalImageAndTitle:3.0];
        self.btn3.titleLabel.backgroundColor=[UIColor orangeColor];
        
        
        CGFloat btn4X=btnW*2;
        self.btn4=[[UIButton alloc]initWithFrame:CGRectMake(btn4X,btnY,btnW,btnH)];
        [self addSubview:self.btn4];
        [self.btn4 setImage:[UIImage imageNamed:@"found_icons_qzone"] forState:UIControlStateNormal];
        [self.btn4 setTitle:@"李海洋" forState:UIControlStateNormal];
        [self.btn4 verticalImageAndTitle:3.0];
        self.btn4.titleLabel.backgroundColor=[UIColor orangeColor];
        
    }
    return self;
}






@end
