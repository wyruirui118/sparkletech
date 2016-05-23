//
//  wyrBaseSettingViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrBaseSettingViewController.h"
#import "wyrSettingGroup.h"
#import "wyrSettingCell.h"
#import "wyrSettingArrowItem.h"
@interface wyrBaseSettingViewController ()

@end

@implementation wyrBaseSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景色,如果没反应,清空backgroundView,只有在group中才有backgroundView
    self.tableView.backgroundView=nil;
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    //去掉系统的分割线,以便用自定义分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    
}

//懒加载
-(NSMutableArray *)data{
    if (_data==nil) {
        _data=[NSMutableArray array];
    }
    return _data;
}
//重写init方法,设置样式为UITableViewStyleGrouped
-(instancetype)init{
    if (self=[super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
-(instancetype)initWithStyle:(UITableViewStyle)style{
    if (self=[super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}
//
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.data.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    wyrSettingGroup *group=self.data[section];
    return group.items.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建cell
    wyrSettingCell *cell=[wyrSettingCell cellWithTableView:tableView];
    
    //2.给cell传递模型数据
    wyrSettingGroup *group=self.data[indexPath.section];
    cell.item=group.items[indexPath.row];
    //3.返回cell
    return cell;
    
}
//
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.取消选中这行(选中后马上取消选中)
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //2.模型数据
    wyrSettingGroup *group=self.data[indexPath.section];
    wyrSettingItem *item=group.items[indexPath.row];
    
    //如果block有值,调用block。点击这个cell有特定的操作需要执行
    if (item.option) {
        item.option();
    }
    
    if ([item isKindOfClass:[wyrSettingArrowItem class]]) { //箭头
        wyrSettingArrowItem *arrawItem=(wyrSettingArrowItem *)item;
        //如果没有需要跳转的控制器
        if (arrawItem.destVcClass==nil) return;
       
        UIViewController *vc=[[arrawItem.destVcClass alloc]init];
        vc.title=arrawItem.title;
        [self.navigationController pushViewController:vc animated:YES];
    }

}

//头部
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    wyrSettingGroup *group=self.data[section];
    return group.header;
}
//尾部
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    wyrSettingGroup *group=self.data[section];
    return group.footer;
}



@end
