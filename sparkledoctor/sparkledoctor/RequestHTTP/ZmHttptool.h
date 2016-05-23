//
//  Httptool.h
//  NiaoRen
//
//  Created by cxm0307 on 15/4/14.
//  Copyright (c) 2015年 cxm0307. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^SuccessBlock)(id responseObject);
typedef void (^backDataBlock)(id operation , NSError *error);
typedef void (^FailureBlock)(NSError *error);

@interface ZmHttptool : NSObject

/**
 *  文件数据
 */
@property (nonatomic, copy) UIImage *imagedata;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *phone;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
#pragma mark POST JSON 请求上传
+ (void)postWithJSONBaseURL:(NSString *)baseURL params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;
#pragma mark GET JSON 请求上传
+ (void)getWithJSONBaseURL:(NSString *)baseURL params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;

#pragma mark GET
+ (void)getWithBaseURL:(NSString *)baseURL params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;

//+ (void)getWithJSONBaseURL:(NSString *)baseURL params:(id)params fileData:(NSData *)data fileName:(NSString *)fileName success:(SuccessBlock)success failure:(FailureBlock)failure;
#pragma mark POST
+ (void)postWithBaseURL:(NSString *)baseURL  params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure;


@end

