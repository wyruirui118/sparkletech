//
//  MyView.m
//  九宫格
//
//  Created by mj on 14-9-9.
//  Copyright (c) 2014年 Mr.Li. All rights reserved.
//

#import "MyView.h"
#import "Model.h"
@interface MyView ()
{
    MyButtonBlock _myButtonBlock;
}


@end

@implementation MyView

- (id)initWithFrame:(CGRect)frame Model:(Model *)model MyButtonBlock:(MyButtonBlock)myButtonBlock
{
    _myButtonBlock = myButtonBlock;
    _model = model;
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat W = 90;
        
        _imageView = [[UIImageView alloc] init];
        
        _label = [[UILabel alloc] init];
        CGFloat labelX = 0;
        CGFloat labelY = CGRectGetMaxY(_imageView.frame) + 88;
        CGFloat labelW = W;
        CGFloat labelH = 10;
        _label.frame = CGRectMake(labelX, labelY, labelW, labelH);
        _label.font = [UIFont systemFontOfSize:13];
        _label.textAlignment = UITextAlignmentCenter;
        _label.text = model.name;
        
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat buttonX = 0;
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width;
        CGFloat buttonH = (self.frame.size.height-20);
        [_button setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(tapButton) forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [self addSubview:_button];
        [self addSubview:_label];

    }
    return self;
}

- (void)tapButton
{
    _myButtonBlock(self.button.tag);
}

@end
