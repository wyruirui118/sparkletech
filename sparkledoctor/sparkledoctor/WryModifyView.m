//
//  WryModifyView.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "WryModifyView.h"
@interface WryModifyView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@property (nonatomic,strong) NSArray * nameArr;

@property (nonatomic,strong) NSMutableArray * valueArr;

@property (nonatomic,strong) NSArray * placehoderArr;

@property (nonatomic,weak) UIButton * senderBtn;



@end
@implementation WryModifyView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), 400) style:UITableViewStylePlain];
        
        self.tableView.delegate = self;
        
        self.tableView.dataSource = self;
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:self.tableView];
        
        _nameArr = @[@"医 保 卡",@"用户地址",@"用户昵称",@"支付宝账号"];
        
        wyrAccount * acc = [wyrAccountTool account];
        
        _valueArr = [NSMutableArray array];
  
        if (acc.user_cardid) {
            [_valueArr addObject:acc.user_cardid];
        }else{
            [_valueArr addObject:@""];
        }
        if (acc.user_address) {
            [_valueArr addObject:acc.user_address];
        }else{
            [_valueArr addObject:@""];
        }
        if (acc.user_nickName) {
            [_valueArr addObject:acc.user_nickName];
        }else{
            [_valueArr addObject:@""];
        }
        if (acc.user_alipay) {
            [_valueArr addObject:acc.user_alipay];
        }else{
            [_valueArr addObject:@""];
        }
  
        self.placehoderArr = @[@"请输入医保卡信息",@"请输入地址信息",@"请输入昵称",@"请输入支付宝账号"];
        
        UIButton * senderBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH / 2 - 50, CGRectGetMaxY(_tableView.frame) + 40, 100, 40)];
        
        [senderBtn setTitle:@"保存信息" forState:UIControlStateNormal];
        
        [senderBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        
        [senderBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        
        senderBtn.hidden = YES;
        
        [senderBtn addTarget:self action:@selector(senderBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _senderBtn = senderBtn;
        
        [self addSubview:senderBtn];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeText:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return _nameArr.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
        }
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, WIDTH / 2, 100)];
        
//        lab.center = CGPointMake(WIDTH / 2 + 10, 50 / 2);
        
        lab.font = [UIFont systemFontOfSize:20];
        
        lab.text = @"头    像";
        
        [cell.contentView addSubview:lab];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 80, 20, 60, 60)];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:[wyrAccountTool account].profile_image_url] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        
        imageView.layer.masksToBounds = YES;
        
        imageView.layer.borderWidth = 2.f;
        
        imageView.layer.borderColor = [UIColor colorWithRed:0.2857 green:0.0 blue:0.0 alpha:1.0].CGColor;
        
        imageView.layer.cornerRadius = M_PI * 2;
        
        [cell.contentView addSubview:imageView];
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 99, WIDTH - 20, 1)];
        
        view.backgroundColor = [UIColor colorWithRed:0.802 green:0.802 blue:0.802 alpha:1.0];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell addSubview:view];

        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell2"];
        }
        
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(30, 0, WIDTH / 3, 50)];
        
        //        lab.center = CGPointMake(WIDTH / 2 + 10, 50 / 2);
        
        lab.font = [UIFont systemFontOfSize:20];
        
        lab.text = _nameArr[indexPath.row];
        
        [cell.contentView addSubview:lab];
        
        UITextField * lab1 = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lab.frame), 0, WIDTH / 3 * 2 - 60, 50)];
        
        //        lab.center = CGPointMake(WIDTH / 2 + 10, 50 / 2);
        
        lab1.font = [UIFont systemFontOfSize:20];
        
        lab1.text = _valueArr[indexPath.row];
        
        lab1.textAlignment = NSTextAlignmentRight;
        
        lab1.placeholder = _placehoderArr[indexPath.row];
        
        lab1.tag = indexPath.row + 1;
        
        [cell.contentView addSubview:lab1];
        
        UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 49, WIDTH - 20, 1)];
        
        view.backgroundColor = [UIColor colorWithRed:0.802 green:0.802 blue:0.802 alpha:1.0];
        
        [cell addSubview:view];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
        return cell;
    }
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if (indexPath.section == 1) {
//        
//    }
//    
//    
//}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 50;
    }
}

-(void)changeText:(NSNotification *)sender{
//    NSLog(@"%@,%@",sender.object,sender.userInfo);
    
    UITextField * text = sender.object;
    
    NSLog(@"%ld",text.tag);
    
    _valueArr[text.tag] = text.text;
    
    self.senderBtn.hidden = NO;
    
    
}

-(void)senderBtnAction:(UIButton *)sender{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    params[@"user_id"] = [wyrAccountTool account].user_id;
    params[@"user_token"] = [wyrAccountTool account].user_token;
    params[@"user_cardid"] = _valueArr[0];
    params[@"user_address"] = _valueArr[1];
    params[@"user.nickName"] = _valueArr[2];
    params[@"user.alipay"] = _valueArr[3];
    
    [ZmHttptool getWithJSONBaseURL:modifyMessage params:params success:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(NSError *error) {
        
        NSLog(@"%@",error);
        
    }];
}
@end
