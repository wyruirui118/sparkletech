//
//  WyrSmartView.h
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^jumpLead)(NSInteger,NSString *);
@interface WyrSmartView : UIView
@property (nonatomic,copy) jumpLead jumpLeadBlock;

@end
