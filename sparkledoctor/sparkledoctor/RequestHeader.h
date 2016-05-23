//
//  RequestHeader.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/27.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#ifndef RequestHeader_h
#define RequestHeader_h

static NSString *const headURL = @"http://192.168.111.114:8080";


//注册
#define kregister                              @"/treatguide/v1/user/register"
//登录
#define Loginer                                @"/treatguide/v1/user/login"
//修改个人信息
#define modifyMessage                          @"/treatguide/v1/user/update"
//获取疾病详情
#define sendIllness                            @"/treatguide/v1/treatment/getSympton"

#endif /* RequestHeader_h */
