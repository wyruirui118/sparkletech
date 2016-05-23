/*
 作者: 羊羊羊
 描述: 
 时间:
 文件名: Model.m
 */

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

@end
