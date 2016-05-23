//
//  wyrSettingArrowItem.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrSettingArrowItem.h"

@implementation wyrSettingArrowItem
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass{
    wyrSettingArrowItem *item=[self itemWithIcon:icon title:title];
    item.destVcClass=destVcClass;
    return item;
}
+(instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass{
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}

@end
