//
//  wyrAccountTool.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/8.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrAccountTool.h"
//账号的存储路径
#define HWAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]
@implementation wyrAccountTool
/**
 *  存储账号信息
 *
 *  @param account 账号模型
 */
+ (void)saveAccount:(wyrAccount *)account
{
    //自定义对象的存储必须用NSKeyedArchiver，不再有什么writeToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:HWAccountPath];
}

/**
 *  返回账号信息
 *
 *  @return 账号模型（如果账号过期，返回nil）
 */
+ (wyrAccount *)account
{
    // 加载模型
    wyrAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:HWAccountPath];
    /* 验证账号是否过期 */
    //过期的秒数
//    long long expires_in = [account.expires_in longLongValue];
    //获得过期时间
//    NSDate *expiresTime = [account.created_time dateByAddingTimeInterval:expires_in];
    //获得当前时间
//    NSDate *now = [NSDate date];
    // 如果expiresTime <= now，过期
    /**
     NSOrderedAscending = -1L, 升序，右边 > 左边
     NSOrderedSame, 一样
     NSOrderedDescending 降序，右边 < 左边
     */
//    NSComparisonResult result = [expiresTime compare:now];
//    if (result != NSOrderedDescending) { // 过期
//        return nil;
//    }
    return account;
}

//删除沙盒里的文件
+(void)deleteFile{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //文件名
    BOOL blHave=[[NSFileManager defaultManager] fileExistsAtPath:HWAccountPath];
    if (!blHave) {
        NSLog(@"沙盒里没有文件");
        return;
    }else{
        NSLog(@" have");
        BOOL blDele=[fileManager removeItemAtPath:HWAccountPath error:nil];
        if (blDele) {
            NSLog(@"dele 沙盒里文件");
        }else{
            NSLog(@"dele 失败");
        }
    }
//    [wyrAccountTool account];
}
//返回当前时间  yyyy-MM-dd HH:ss
+(id)timeString{
    NSDate *dats=[NSDate dateWithTimeIntervalSinceNow:0];
    NSDateFormatter *fmt=[[NSDateFormatter alloc]init];
    fmt.dateFormat=@"yyyy-MM-dd HH-mm";
    return [fmt stringFromDate:dats];
}

@end
