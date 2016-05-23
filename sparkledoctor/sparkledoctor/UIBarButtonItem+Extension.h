//
//  UIBarButtonItem+Extension.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
