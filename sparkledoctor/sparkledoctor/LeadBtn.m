//
//  LeadBtn.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "LeadBtn.h"
@interface LeadBtn ()
@property (nonatomic,strong) UIView * view;

@end
@implementation LeadBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        _view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(frame) / 5, 4, CGRectGetHeight(frame) / 5 * 3)];
        
        _view.backgroundColor = [UIColor blueColor];
        
        _view.hidden = YES;
        
        _blueSelected = NO;
        
        [self addSubview:_view];
        
    }
    
    return self;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
//    _blueSelected = selected;
    
    _view.hidden = !selected;
    
}


//-(void)setBlueSelected:(BOOL)blueSelected{
//    _blueSelected = blueSelected;
//    
//    if (_blueSelected == YES) {
//        
//        _view.hidden = NO;
//        
//    }else{
//        
//        _view.hidden = YES;
//        
//    }
//}

@end
