//
//  wyrUser.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/8.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  新浪微博第三方登录用户信息

#import <Foundation/Foundation.h>

@interface wyrUser : NSObject
@property(nonatomic,copy)NSString *idstr;//字符串类型的用户UID
@property(nonatomic,copy)NSString *name;//友好显示名称
@property(nonatomic,copy)NSString *profile_image_url;//用户头像地址 50*50
@end
