//
//  wyrSettingCell.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrSettingCell.h"
#import "wyrSettingItem.h"
#import "wyrSettingSwitchItem.h"
#import "wyrSettingArrowItem.h"
#import "wyrSettingLabelItem.h"

@interface wyrSettingCell()
//箭头,例外:用强指针,因为要一直存在
@property(nonatomic,strong)UIImageView *arrowView;//箭头
@property(nonatomic,strong)UISwitch *switchView;//开关
@property(nonatomic,strong)UILabel *labelView; //标签

@property(nonatomic,weak)UIView *divider; //分割线
@end

@implementation wyrSettingCell
-(void)setItem:(wyrSettingItem *)item{
    _item=item;
    //1.设置数据
    [self setupData];
    //2.设置右边的内容
    [self setupRightContent];
    
}
//设置数据
-(void)setupData{
    if (self.item.icon) {
        self.imageView.image=[UIImage imageNamed:self.item.icon];
    }
    self.textLabel.text=self.item.title;
    //子标题
    self.detailTextLabel.text=self.item.subtitle;
}
//懒加载
-(UIImageView *)arrowView{
    if (_arrowView==nil) {
        _arrowView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}
-(UISwitch *)switchView{
    if (_switchView==nil) {
        _switchView=[[UISwitch alloc]init];
        //监听switch状态改变,存储数据
        [_switchView addTarget:self action:@selector(switchStateChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
-(UILabel *)labelView{
    if (_labelView==nil) {
        _labelView=[[UILabel alloc]init];
        _labelView.bounds=CGRectMake(0,0,100,30);
        _labelView.backgroundColor=[UIColor redColor];
    }
    return _labelView;
}

//
-(void)setupRightContent{
    if ([self.item isKindOfClass:[wyrSettingArrowItem class]]) {//箭头
        self.accessoryView=self.arrowView;
        //除开关外需要把状态设置成默认,否则cell循环利用后会有一些cell点不了
        self.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    }else if ([self.item isKindOfClass:[wyrSettingSwitchItem class]]){//开关
        self.accessoryView=self.switchView;
        self.selectionStyle=UITableViewCellSelectionStyleNone;//不能长按
        //设置开关状态
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        self.switchView.on=[defaults boolForKey:self.item.title];
        
    }else if ([self.item isKindOfClass:[wyrSettingLabelItem class]]){//标签
        self.accessoryView=self.labelView;
        self.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    }else{  //右边不显示
        self.accessoryView=nil;//防止cell循环利用时右边有箭头或开关
        self.selectionStyle=UITableViewCellSelectionStyleDefault;
    }
 
}

//
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID=@"setting";
    wyrSettingCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[wyrSettingCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    return cell;
}

//监听开关状态改变
-(void)switchStateChange{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setBool:self.switchView.isOn forKey:self.item.title];
    [defaults synchronize];
}


//这里做一些初始化操作
//如果cell是通过手写代码创建,才会调用这个方法来初始化cell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化操作
        //设置选中时的背景
        UIView *selectedBg=[[UIView alloc]init];
        selectedBg.backgroundColor=wyrColor(241,240,236);
        self.selectedBackgroundView=selectedBg;
        
        //添加自定义的分割线
        UIView *divider=[[UIView alloc]init];
        divider.backgroundColor=[UIColor blackColor];
        divider.alpha=0.5;
        [self.contentView addSubview:divider];
        self.divider=divider;
    }
    return self;
}


//cell的frame发生改变会调用这个方法
-(void)layoutSubviews{
    [super layoutSubviews];
    //添加分割线
    CGFloat dividerH=1;CGFloat dividerW=self.frame.size.width;
    CGFloat dividerX=0; CGFloat dividerY=self.frame.size.height-1;
    self.divider.frame=CGRectMake(dividerX,dividerY,dividerW,dividerH);
}
//如果cell是通过storyboard或者xib创建的,就会调用这个方法来初始化cell
-(void)awakeFromNib{
    UIView *divider=[[UIView alloc]init];
    divider.backgroundColor=[UIColor blackColor];
    divider.alpha=0.5;
    [self.contentView addSubview:divider];
    self.divider=divider;
}







@end
