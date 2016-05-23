/*
 作者: 羊羊羊
 描述: 
 时间:
 文件名: Model.h
 */

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
