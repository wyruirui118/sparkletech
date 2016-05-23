//
//  wyrSettingItem.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  每一个cell都对应一个wyrSettingItem模型
//  每一行的模型

#import <Foundation/Foundation.h>
//声明block类型
typedef void (^wyrSettingItemOption)();

@interface wyrSettingItem : NSObject
@property(nonatomic,copy)NSString *icon; //图标
@property(nonatomic,copy)NSString *title; //标题
@property(nonatomic,copy)NSString *subtitle; //子标题,显示在右边

//点击cell需要做的事情,block
@property(nonatomic,copy)wyrSettingItemOption option;


//不需要跳转的
+(instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
//不需要传icon的
+(instancetype)itemWithTitle:(NSString *)title;

@end
