//
//  wyrTableHeaderButton.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/1.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  第一个按钮

#import <UIKit/UIKit.h>

//谁想监听谁就做代理
//监听对象:定义协议,id属性,delegate调用方法
//代理:实现方法,delegate=self

@protocol wyrTableHeaderButtonDelegate <NSObject>
-(void)tableHeaderButtonClick;
@end

@interface wyrTableHeaderButton : UIButton
@property(nonatomic,weak)id<wyrTableHeaderButtonDelegate> delegate;
@end
