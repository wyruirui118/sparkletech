//
//  wyrSettingGroup.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  每一组的模型(tableView里的一组数据)

#import <Foundation/Foundation.h>

@interface wyrSettingGroup : NSObject
@property(nonatomic,copy)NSString *header;  //头部标题
@property(nonatomic,copy)NSString *footer;  //尾部标题
//存放这组中所有行的模型数据(这个数据中都是wyrSettingItem对象)
@property(nonatomic,strong)NSArray *items;
@end
