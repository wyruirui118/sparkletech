//
//  wyrSettingItem.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrSettingItem.h"

@implementation wyrSettingItem
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title{
    wyrSettingItem *item=[[self alloc]init];
    item.icon=icon;
    item.title=title;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithIcon:nil title:title];
}
@end
