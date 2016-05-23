//
//  UIImage+Extension.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  拉伸图片

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+(UIImage *)resizableImage:(NSString *)name;
//加边框
+(instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
@end
