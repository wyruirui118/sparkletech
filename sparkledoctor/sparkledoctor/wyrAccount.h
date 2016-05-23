//
//  wyrAccount.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/8.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wyrAccount : NSObject
////用于调用access_token,接口获取授权后的access token
//@property (nonatomic, copy) NSString *access_token;
////access_token的生命周期，单位是秒数
//@property (nonatomic, copy) NSNumber *expires_in;
////当前授权用户的UID,本字段只是为了方便开发者，减少一次user/show接口调用而返回的，第三方应用不能用此字段作为用户登录状态的识别，只有access_token才是用户授权的唯一票据.
//@property (nonatomic, copy) NSString *uid;
//
////access token的创建时间
//@property (nonatomic, strong) NSDate *created_time;
////用户的昵称
//@property(nonatomic,copy)NSString *name;
//
////用户的头像
//@property(nonatomic,copy)NSString *profile_image_url;//用户头像地址 50*50
/**
 *  @author 李海洋, 16-05-21 00:05:17
 *
 *  手机号
 */
@property (nonatomic,strong) NSString * user_phone;
/**
 *  @author 李海洋, 16-05-21 00:05:19
 *
 *  密码
 */
@property (nonatomic,strong) NSString * user_pwd;
/**
 *  @author 李海洋, 16-05-21 00:05:25
 *
 *  创建时间
 */
@property (nonatomic,strong) NSString * created_at;
/**
 *  @author 李海洋, 16-05-21 00:05:31
 *
 *  头像
 */
@property (nonatomic,strong) NSString * profile_image_url;
/**
 *  @author 李海洋, 16-05-21 00:05:38
 *
 *  地址
 */
@property (nonatomic,strong) NSString * user_address;
/**
 *  @author 李海洋, 16-05-21 00:05:41
 *
 *  支付宝
 */
@property (nonatomic,strong) NSString * user_alipay;
/**
 *  @author 李海洋, 16-05-21 00:05:48
 *
 *  医疗卡
 */
@property (nonatomic,strong) NSString * user_cardid;
/**
 *  @author 李海洋, 16-05-21 00:05:54
 *
 *  用户ID
 */
@property (nonatomic,strong) NSString * user_id;
/**
 *  @author 李海洋, 16-05-21 00:05:03
 *
 *  昵称
 */
@property (nonatomic,strong) NSString * user_nickName;

@property (nonatomic,strong) NSString * user_token;

+(instancetype)accountWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
