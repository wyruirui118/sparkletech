//
//  UIImage+Extension.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+(UIImage *)resizableImage:(NSString *)name{
    UIImage *normal=[UIImage imageNamed:name];
    CGFloat w=normal.size.width*0.5;
    CGFloat h=normal.size.height*0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(w,h,w,h) resizingMode:UIImageResizingModeStretch];
}
//
+(instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor{
    //1.加载原图
    UIImage *oldImage=[UIImage imageNamed:name];
    //2.开启上下文
    CGFloat imageW=oldImage.size.width+2*borderWidth;
    CGFloat imageH=oldImage.size.height+2*borderWidth;
    CGSize imageSize=CGSizeMake(imageW,imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize,NO,0.0);
    //3.取得当前的上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    //4.画边框(大圆)
    [borderColor set];
    CGFloat bigRadius=imageW*0.5;//大圆半径
    CGFloat centerX=bigRadius;
    CGFloat centerY=bigRadius;
    CGContextAddArc(ctx,centerX,centerY,bigRadius,0,M_PI*2,0);
    CGContextFillPath(ctx); //画圆
    //5.小圆
    CGFloat smallRadius=bigRadius-borderWidth;
    CGContextAddArc(ctx,centerX,centerY,smallRadius,0,M_PI*2,0);
    //裁剪(后面画的东西才会受裁剪影响)
    CGContextClip(ctx);
    //6.画图
    [oldImage drawInRect:CGRectMake(borderWidth,borderWidth,oldImage.size.width,oldImage.size.height)];
    //7.取图
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //8.结束上下文
    UIGraphicsEndImageContext();
    return newImage;
}

@end
