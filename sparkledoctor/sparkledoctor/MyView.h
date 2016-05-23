//
//  MyView.h
//  九宫格
//
//  Created by mj on 14-9-9.
//  Copyright (c) 2014年 Mr.Li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^MyButtonBlock)(NSInteger);
@class Model;

@interface MyView : UIView
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *label;

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) Model *model;

- (id)initWithFrame:(CGRect)frame Model:(Model *)model MyButtonBlock:(MyButtonBlock)myButtonBlock;

@end
