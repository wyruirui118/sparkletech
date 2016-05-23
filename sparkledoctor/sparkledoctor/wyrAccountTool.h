//
//  wyrAccountTool.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/8.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  处理账号相关的所有操作:存储账号,取出账号,验证账号

#import <Foundation/Foundation.h>
#import "wyrAccount.h"
@interface wyrAccountTool : NSObject
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+(void)saveAccount:(wyrAccount *)account;

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+(wyrAccount *)account;



//删除沙盒里的文件
+(void)deleteFile;
//返回当前时间
+(id)timeString;


@end
