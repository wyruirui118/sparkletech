//
//  Httptool.m
//  NiaoRen
//
//  Created by cxm0307 on 15/4/14.
//  Copyright (c) 2015年 cxm0307. All rights reserved.
//
//#import "AFNetworking.h"


#import "ZmHttptool.h"
#import "JSONKit.h"
@implementation ZmHttptool
#pragma mark POST JSON 请求上传
+ (void)postWithJSONBaseURL:(NSString *)baseURL params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    NSString *requestURLUrl = [headURL stringByAppendingPathComponent:baseURL];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //2.设定类型. (这里要设置request-response的类型)
    
    manager.requestSerializer =  [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //这个决定了下面responseObject返回的类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];

//    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
  
    NSLog(@"请求地址＝%@--参数%@",requestURLUrl,params);
     [manager POST :[requestURLUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:&err];
                NSLog(@"GET请求成功dic %@- %@",[params description], [dic description]);
        success(responseObject);       //返回成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"GET请求失败=%@",[error description]);
        NSLog(@"POST请求失败=%@",error);

        failure(error);     //返回失败
    }];
    
}
#pragma mark GET JSON 请求上传
+ (void)getWithJSONBaseURL:(NSString *)baseURL params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    NSString *requestURLUrl = [headURL stringByAppendingPathComponent:baseURL];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //2.设定类型. (这里要设置request-response的类型)
    
    //    manager.requestSerializer =  [AFJSONRequestSerializer serializer];
    //    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //这个决定了下面responseObject返回的类型
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/jpeg", nil];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应

    NSLog(@"请求地址＝%@--参数%@",requestURLUrl,params);
    [manager GET :[requestURLUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"GET请求成功dic %@- %@",[params description], [dic description]);
        success(dic);       //返回成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        NSLog(@"GET请求失败=%@",[error description]);
        NSLog(@"POST请求失败=%@",error);
        
        failure(error);     //返回失败
    }];
    
}

//+ (void)getWithJSONBaseURL:(NSString *)baseURL params:(id)params fileData:(NSData *)data fileName:(NSString *)fileName success:(SuccessBlock)success failure:(FailureBlock)failure{
//    NSString *requestURLUrl = [headURL stringByAppendingPathComponent:baseURL];
//    // 1.创建请求管理者
//    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    
//    // 3.请求地址
//    NSString *url = @"http://localhost:8080/MJServer/upload";
//    // 请求参数 (只能放非文件参数) (字典只能放对象)
//    
//    
//    // 2.发送请求
//    [mgr POST:requestURLUrl parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//        
//        // 添加参数到 formData 中
//        //        [formData appendPartWithFileURL:<#(NSURL *)#> name:<#(NSString *)#> fileName:<#(NSString *)#> mimeType:<#(NSString *)#> error:<#(NSError *__autoreleasing *)#>];
//        
//        /**
//         *  FileData:需要上传的文件的具体类型
//         *  name:服务器那边要接受到的文件名
//         *  fileName:(告诉服务器)所上传的文件名
//         *  mimeType:上传得文件类型
//         */
//        UIImage *image = [UIImage imageNamed:@"123.jpg"];
//        //        NSData *fileData = UIImagePNGRepresentation(image);
//        NSData *fileData = UIImageJPEGRepresentation(image, 1.0);
//        [formData appendPartWithFileData:fileData name:@"file" fileName:@"beautiful.jpg" mimeType:@"image/jpeg"];
//        
//    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSLog(@"上传成功");
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"上传失败");
//    }];
//
//    
//    
//    
//    
//}



#pragma mark POST请求
+ (void)postWithBaseURL:(NSString *)baseURL params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    NSString *requestURLUrl = [headURL stringByAppendingPathComponent:baseURL];
    NSLog(@"requestURLUrl=%@",requestURLUrl);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//                    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    dispatch_async(dispatch_get_main_queue(), ^{

    [manager POST:[requestURLUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        success(dic);       //返回成功
        NSLog(@"POST请求成功=%@",[dic description]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"POST请求失败=%@",error);
        failure(error);     //返回失败
     }];
//    });
    
}
#pragma mark GET请求 获取个人信息
+ (void)getWithBaseURL:(NSString *)baseURL  params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    NSString *requestURLUrl = [headURL stringByAppendingPathComponent:baseURL];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSLog(@"requestURLUrl=%@",requestURLUrl);
    [manager GET:[requestURLUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"GET请求成功postData %@===%@" , [responseObject class] , [dic description] );
        success(dic);       //返回成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"GET请求失败=%@",error);
        failure(error);     //返回失败
     }];
    
}

#pragma mark GET请求 获取天气信息
+ (void)getWithWeatherURL:(NSString *)baseURL  params:(NSDictionary *)params success:(SuccessBlock)success failure:(FailureBlock)failure{
//    NSString *requestURLUrl = [weatherURL stringByAppendingPathComponent:baseURL];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //                    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSLog(@"requestURLUrl=%@",baseURL);
    [manager GET:[baseURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *err;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
        NSLog(@"GET请求成功 =%@",[dic description]);
        success(dic);       //返回成功
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"GET请求失败=%@",error);
        failure(error);     //返回失败
     }];
    
}

@end
