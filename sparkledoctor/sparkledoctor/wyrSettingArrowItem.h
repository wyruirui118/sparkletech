//
//  wyrSettingArrowItem.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  箭头

#import "wyrSettingItem.h"

@interface wyrSettingArrowItem : wyrSettingItem

//点击这行cell需要跳转的控制器
@property(nonatomic,assign)Class destVcClass;

+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
//不需要icon
+(instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;


@end
