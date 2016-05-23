//
//  wyrAccount.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/8.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrAccount.h"

@implementation wyrAccount
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
//    wyrAccount *account = [[self alloc] init];
//    account.access_token = dict[@"access_token"];
//    account.uid = dict[@"uid"];
//    account.expires_in = dict[@"expires_in"];
//    account.name = dict[@"name"];
//    account.profile_image_url = dict[@"profile_image_url"];
//    //获得账号存储的时间（accessToken的产生时间）
//    account.created_time = [NSDate date];
//    return account;
    
    return [[wyrAccount alloc] initWithDict:dict];
    
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}
/**
 *  当一个对象要归档进沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒
 */
-(void)encodeWithCoder:(NSCoder *)aCoder{
//    [aCoder encodeObject:self.access_token forKey:@"access_token"];
//    [aCoder encodeObject:self.expires_in forKey:@"expires_in"];
//    [aCoder encodeObject:self.uid forKey:@"uid"];
//    [aCoder encodeObject:self.created_time forKey:@"created_time"];
//    [aCoder encodeObject:self.name forKey:@"name"];
//    [aCoder encodeObject:self.profile_image_url forKey:@"profile_image_url"];
    [aCoder encodeObject:self.created_at forKey:@"created_at"];
    
    [aCoder encodeObject:self.profile_image_url forKey:@"profile_image_url"];
    
    [aCoder encodeObject:self.user_address forKey:@"user_address"];

    [aCoder encodeObject:self.user_alipay forKey:@"user_alipay"];

    [aCoder encodeObject:self.user_cardid forKey:@"user_cardid"];

    [aCoder encodeObject:self.user_id forKey:@"user_id"];

    [aCoder encodeObject:self.user_nickName forKey:@"user_nickName"];

    [aCoder encodeObject:self.user_phone forKey:@"user_phone"];

    [aCoder encodeObject:self.user_pwd forKey:@"user_pwd"];

    [aCoder encodeObject:self.user_token forKey:@"user_token"];

    
    
}
/**
 *  当从沙盒中解档一个对象时（从沙盒中加载一个对象时），就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性该怎么解析（需要取出哪些属性）
 */
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
//        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
//        self.expires_in = [aDecoder decodeObjectForKey:@"expires_in"];
//        self.uid = [aDecoder decodeObjectForKey:@"uid"];
//        self.created_time = [aDecoder decodeObjectForKey:@"created_time"];
//        self.name=[aDecoder decodeObjectForKey:@"name"];
//        self.profile_image_url=[aDecoder decodeObjectForKey:@"profile_image_url"];
        
        self.created_at = [aDecoder decodeObjectForKey:@"created_at"];
        
        self.profile_image_url = [aDecoder decodeObjectForKey:@"profile_image_url"];
        
        self.user_address = [aDecoder decodeObjectForKey:@"user_address"];
        
        self.user_alipay = [aDecoder decodeObjectForKey:@"user_alipay"];
        
        self.user_cardid = [aDecoder decodeObjectForKey:@"user_cardid"];
        
        self.user_id = [aDecoder decodeObjectForKey:@"user_id"];
        
        self.user_nickName = [aDecoder decodeObjectForKey:@"user_nickName"];
        
        self.user_phone = [aDecoder decodeObjectForKey:@"user_phone"];
        
        self.user_pwd = [aDecoder decodeObjectForKey:@"user_pwd"];
        
        self.user_token = [aDecoder decodeObjectForKey:@"user_token"];
    }
    return self;
}

@end
