//
//  LeadModel.h
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LeadModel : NSObject

@property (nonatomic,strong) NSString * name;

@property (nonatomic,strong) NSArray * goodList;

+(instancetype)modelWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;

@end
