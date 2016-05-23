//
//  ServerModel.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "ServerModel.h"

@implementation ServerModel
+(instancetype)modelWithDict:(NSDictionary *)dict{
    return [[ServerModel alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}


@end
