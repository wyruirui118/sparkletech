//
//  LeadExaminingView.h
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^IllnessBlock)(NSString *,NSString *);
@interface LeadExaminingView : UIView
@property (nonatomic,assign) NSInteger index;

@property (nonatomic,copy) IllnessBlock illnessBlock;

@end