//
//  UIBarButtonItem+Extension.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
//创建一个item
+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    //设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    //设置尺寸(在分类方法中已经实现)
    btn.size=btn.currentBackgroundImage.size;
    //添加
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
