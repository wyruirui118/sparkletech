//
//  WyrSmartView.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "WyrSmartView.h"
@interface WyrSmartView()

@property (nonatomic,strong) NSArray * imageArr;

@property (nonatomic,strong) UIView * typeView;

@property (nonatomic,weak) UIButton * typeBtn;

@property (nonatomic,strong) UIButton * chengrenBtn;

@property (nonatomic,strong) UIButton * ertongBtn;






@end
@implementation WyrSmartView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:244/255.f green:244/255.f blue:244/255.f alpha:1.0];
        
        CGFloat kswidth = WIDTH / 2 - 10;
        
        CGFloat ksheigth = HEIGTH / 6 * 4;
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, HEIGTH / 6,kswidth , ksheigth)];
        
        imageView.image = [UIImage imageNamed:@"people"];
        
        [self addSubview:imageView];
        
        CGFloat smallWidth = kswidth / 2 - 10;
        
        CGFloat spacing = (ksheigth - smallWidth * 5) / 4;
        
        _imageArr = @[@"header",@"liver",@"lung",@"stomach",@"heart",@"intestine",@"teeth",@"renal",@"nerve",@"eyes"];
        
        for (int i = 0; i < 10; i++) {
            NSInteger lin = i % 2;
            
            NSInteger lie = i / 2;
            
            NSLog(@"%ld  %ld", lin , lie);
            
            UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) + (smallWidth + 10) * lin,CGRectGetMinY(imageView.frame) + (smallWidth + spacing) * lie, smallWidth, smallWidth)];
            
            btn.tag = i + 1;
            
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            
            [btn setBackgroundImage:[UIImage imageNamed:_imageArr[i]] forState:UIControlStateNormal];
            
            
            [self addSubview:btn];
        }
        
        UIButton * typeBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH / 2 - 50, CGRectGetMinY(imageView.frame) - 50, 100, 40)];
        
        [typeBtn setTitle:@"成人" forState:UIControlStateNormal];
        
        [typeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [typeBtn addTarget:self action:@selector(typeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        typeBtn.layer.masksToBounds = YES;
        
        typeBtn.layer.borderWidth = 1.f;
        
        _typeBtn = typeBtn;
        
        typeBtn.layer.borderColor = [UIColor colorWithRed:0.7686 green:0.7686 blue:0.7686 alpha:1.0].CGColor;
        
        [self addSubview:typeBtn];

        _typeView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(typeBtn.frame), CGRectGetMaxY(typeBtn.frame), CGRectGetWidth(typeBtn.frame), CGRectGetHeight(typeBtn.frame) * 2)];
        
        _typeView.hidden = YES;
        
        _typeView.alpha = 0;

        _typeView.backgroundColor = [UIColor colorWithRed:244/255.f green:244/255.f blue:244/255.f alpha:1.0];
        
        [self addSubview:_typeView];
        
        _chengrenBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        
        [_chengrenBtn setTitle:@"成人" forState:UIControlStateNormal];
        
        [_chengrenBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_chengrenBtn addTarget:self action:@selector(typeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _chengrenBtn.layer.masksToBounds = YES;
        
        _chengrenBtn.layer.borderWidth = 1.f;
        
        _chengrenBtn.layer.borderColor = [UIColor colorWithRed:0.7686 green:0.7686 blue:0.7686 alpha:1.0].CGColor;
        
        [_typeView addSubview:_chengrenBtn];
        
        _ertongBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 40, 100, 40)];
        
        [_ertongBtn setTitle:@"儿童" forState:UIControlStateNormal];
        
        [_ertongBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_ertongBtn addTarget:self action:@selector(typeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _ertongBtn.layer.masksToBounds = YES;
        
        _ertongBtn.layer.borderWidth = 1.f;
        
        _ertongBtn.layer.borderColor = [UIColor colorWithRed:0.7686 green:0.7686 blue:0.7686 alpha:1.0].CGColor;
        
        [_typeView addSubview:_ertongBtn];
        
        
    }
    return self;
}

-(void)typeBtnAction:(UIButton *)sender{
    

    [UIView animateWithDuration:0.5 animations:^{
        _typeView.hidden = !_typeView.hidden;
        
        if (_typeView.hidden == YES) {
            _typeView.hidden = !_typeView.hidden;
        }
        
        if (_typeView.alpha == 1) {
            _typeView.alpha = 0;
        }else{
            _typeView.alpha = 1;
        }
    } completion:^(BOOL finished) {
        if (_typeView.hidden == NO && _typeView.alpha == 0) {
            _typeView.hidden = !_typeView.hidden;
        }
        [_typeBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];

    }];
    
}


-(void)btnAction:(UIButton *)sender{
    
    NSString * type;
    
    if ([_typeBtn.titleLabel.text isEqualToString:@"成人"]) {
        type = @"A";
    }else{
        type = @"C";
    }
    
    _jumpLeadBlock(sender.tag,type);
    
}

@end
