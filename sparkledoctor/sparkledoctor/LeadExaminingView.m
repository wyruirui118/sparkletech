//
//  LeadExaminingView.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "LeadExaminingView.h"
#import "LeadModel.h"
#import "LeadBtn.h"
@interface LeadExaminingView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UIScrollView * scrollView;

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) NSArray * array;

@property (nonnull,strong) NSArray * goodList;

@property (nonatomic,strong) NSString * selectName;

@property (nonatomic,assign) NSInteger selectIndex;

@end
@implementation LeadExaminingView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame) / 3, CGRectGetHeight(frame))];
        
        _scrollView.backgroundColor = [UIColor colorWithRed:0.9223 green:0.9223 blue:0.9223 alpha:1.0];
        
        for (int i = 0; i < self.array.count; i++){
            
            LeadModel * model = _array[i];
            
            CGFloat H = 50;
            
            LeadBtn * btn = [[LeadBtn alloc] initWithFrame:CGRectMake(0, H * i, CGRectGetWidth(_scrollView.frame), H)];
            
            btn.tag = i + 1;
            
            [btn setTitle:model.name forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_nomal"] forState:UIControlStateNormal];
            
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_select"] forState:UIControlStateSelected];
            
            [btn addTarget:self action:@selector(btn1Action:) forControlEvents:UIControlEventTouchUpInside];
            
            [_scrollView addSubview:btn];
            
            CGFloat maxY = CGRectGetMaxY(btn.frame);
            
            if (maxY > CGRectGetHeight(_scrollView.frame)) {
                _scrollView.contentSize = CGSizeMake(0, maxY);
            }
        }
        
        [self addSubview:_scrollView];
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_scrollView.frame), 64, CGRectGetWidth(frame) / 3 * 2, CGRectGetHeight(frame))];
        
        _tableView.delegate = self;
        
        _tableView.dataSource = self;
        
        [self addSubview:_tableView];
        
    }
    return self;
}

-(NSArray *)array{
    if (!_array) {
        
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"people" ofType:@"plist"]];
        
        NSMutableArray * marr = [NSMutableArray array];
        
        for (NSDictionary * dic in array) {
            LeadModel * model = [LeadModel modelWithDict:dic];
            
            [marr addObject:model];
        }
        
        _array = marr;
        
    }
    return _array;
}


-(void)btn1Action:(UIButton *)sender{
    
    _selectIndex = sender.tag;
    
    for (int i = 1; i <= _array.count; i++) {
        
        UIButton * btn = [_scrollView viewWithTag:i];
        
        if (btn.tag == sender.tag) {
            
            btn.selected = YES;
            
            LeadModel * model = _array[btn.tag - 1];
            
            _selectName = model.name;
            
            _goodList = model.goodList;
            
            [self.tableView reloadData];
            
        }else{
            
            btn.selected = NO;
            
        }
        
    }
    
}


-(void)setIndex:(NSInteger)index{
    _index = index;
    
    _selectIndex = index;
    
    for (int i = 1; i <= _array.count; i++) {
        
        UIButton * btn = [_scrollView viewWithTag:i];
        
        if (btn.tag == index) {
            
            btn.selected = YES;
            
            LeadModel * model = _array[btn.tag - 1];
            
            _selectName = model.name;
            
            _goodList = model.goodList;
            
            [self.tableView reloadData];
            
        }else{
            
            btn.selected = NO;
            
        }
        
    }

    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _goodList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
        
    }
    
    cell.textLabel.text = _goodList[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@%@",_selectName,_goodList[indexPath.row]);
    
    _illnessBlock(_selectName,_goodList[indexPath.row]);
}
@end
