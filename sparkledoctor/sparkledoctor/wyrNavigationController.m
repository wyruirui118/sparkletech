//
//  wyrNavigationController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrNavigationController.h"

@interface wyrNavigationController ()

@end
@implementation wyrNavigationController
//重写push方法目的:能够拦截所有push进来的控制器
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) { //这时push进来的控制器,不是第一个控制器(不是根控制器)
        viewController.hidesBottomBarWhenPushed=YES;
        //返回按钮
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
        //更多按钮
        viewController.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"navigationbar_more" highImage:@"navigationbar_more_highlighted"];
    }
    
    [super pushViewController:viewController animated:animated];
}
-(void)back{
    [self popViewControllerAnimated:YES];
}
-(void)more{
    [self popToRootViewControllerAnimated:YES];
}
//设置导航栏主题
+(void)initialize{
    //设置整个项目所有item的主题样式
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //设置普通状态
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=[UIColor orangeColor];
    textAttrs[NSFontAttributeName]=[UIFont systemFontOfSize:15];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //设置不可用状态
    NSMutableDictionary *disabletextAttrs=[NSMutableDictionary dictionary];
    disabletextAttrs[NSForegroundColorAttributeName]=[UIColor lightGrayColor];
    disabletextAttrs[NSFontAttributeName]=textAttrs[NSFontAttributeName];
    [item setTitleTextAttributes:disabletextAttrs forState:UIControlStateDisabled];
}


@end
