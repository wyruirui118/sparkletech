//
//  wyrSettingCell.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  自定义cell

#import <UIKit/UIKit.h>
@class wyrSettingItem;

@interface wyrSettingCell : UITableViewCell
@property(nonatomic,strong)wyrSettingItem *item;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
