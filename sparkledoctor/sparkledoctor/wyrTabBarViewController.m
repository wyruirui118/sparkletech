//
//  wyrTabBarViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrTabBarViewController.h"
#import "test2ViewController.h"
#import "wyrNavigationController.h"
#import "wyrHomeViewController.h"
#import "testViewController.h"
#import "wyrProfileViewController.h"
#import "WyrSmartVC.h"
@interface wyrTabBarViewController()

@end

@implementation wyrTabBarViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    //1.初始化子控制器
    WyrSmartVC *aa=[[WyrSmartVC alloc]init];
    [self addChildVc:aa title:@"智能导诊" image:@"compose_emoticonbutton_background" selectedImage:@"compose_emoticonbutton_background_highlighted"];
    
    wyrHomeViewController *home=[[wyrHomeViewController alloc]init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];

    wyrProfileViewController *profile=[[wyrProfileViewController alloc]init];
    [self addChildVc:profile title:@"个人中心" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    //进入后显示首页
    self.selectedIndex=1;
    
}

//添加一个子控制器
-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    //设置文字的样式
    childVc.tabBarItem.title=title;
    NSMutableDictionary *textAttrs=[NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName]=wyrColor(123,123,123);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:(UIControlStateNormal)];
    NSDictionary *selectTextAttrs=@{NSForegroundColorAttributeName:[UIColor orangeColor]};
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    
    //设置图片
    childVc.tabBarItem.image=[UIImage imageNamed:image];
    //声明:这张图片以后按照原始的样子显示出来(不会被tabbar渲染成蓝色)
    childVc.tabBarItem.selectedImage=[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //先给外面传进来的小控制器包装一个导航控制器
    wyrNavigationController *nav=[[wyrNavigationController alloc]initWithRootViewController:childVc];
    childVc.navigationItem.title=title;
    //childVc.title=title;相当于同时设置tabbar和navigationbar的文字
    
    //添加为子控制器
    [self addChildViewController:nav];
    
    
}

@end
