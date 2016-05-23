//
//  ServerModel.h
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServerModel : NSObject
@property (nonatomic,strong) NSString * department_floor;

@property (nonatomic,strong) NSString * department_location;

@property (nonatomic,strong) NSString * department_name;

@property (nonatomic,strong) NSString * hos_id;

@property (nonatomic,strong) NSString * id;

@property (nonatomic,strong) NSString * ill;

@property (nonatomic,strong) NSString * part;

@property (nonatomic,strong) NSString * patient_type;

@property (nonatomic,strong) NSString * pay;

@property (nonatomic,strong) NSString * register_type;

+(instancetype)modelWithDict:(NSDictionary *)dict;

-(instancetype)initWithDict:(NSDictionary *)dict;
@end
