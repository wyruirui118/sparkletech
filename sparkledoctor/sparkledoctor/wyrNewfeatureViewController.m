//
//  wyrNewfeatureViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//  版本新特性

#import "wyrNewfeatureViewController.h"
#import "testViewController.h"
#import "wyrTabBarViewController.h"

#define wyrNewfeatureCount 3
@interface wyrNewfeatureViewController () <UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;
@end

@implementation wyrNewfeatureViewController
-(void)viewDidLoad {
    [super viewDidLoad];
    //1.创建一个scollview:显示所有的新特性图片
    UIScrollView *scrollview=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scrollview];
    //2.添加图片到scollview
    CGFloat scrollW=scrollview.width;
    CGFloat scrollH=scrollview.height;
    for (int i=0; i<wyrNewfeatureCount; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        imageView.width=scrollW;
        imageView.height=scrollH;
        imageView.y=0;
        imageView.x=i*imageView.width;
        NSString *name=[NSString stringWithFormat:@"new_feature_%d",i+1];
        imageView.image=[UIImage imageNamed:name];
        [scrollview addSubview:imageView];
        //如果是最后一个imageView,就往里面添加其他内容
        if (i==wyrNewfeatureCount-1) {
            [self setupLastImageView:imageView];
        }
    }
    //3.设置scollview其他属性
    scrollview.contentSize=CGSizeMake(wyrNewfeatureCount*scrollview.width, 0);
    scrollview.bounces=NO; //去掉弹簧效果
    scrollview.pagingEnabled=YES;  //分页
    scrollview.showsHorizontalScrollIndicator=NO; //去除水平滚动条
    scrollview.delegate=self;
    //4.添加pagecontrol:分业,展示第几页
    UIPageControl *pageControl=[[UIPageControl alloc]init];
    //pageControl不设置尺寸也正常显示,且不和用户交互
    pageControl.centerX=scrollW*0.5;
    pageControl.centerY=scrollH-50;
    pageControl.numberOfPages=wyrNewfeatureCount;
    pageControl.currentPageIndicatorTintColor=wyrColor(253, 98, 42);
    pageControl.pageIndicatorTintColor=wyrColor(189, 189, 189);
    self.pageControl=pageControl;
    [self.view addSubview:pageControl];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page=(scrollView.contentOffset.x+scrollView.width*0.5)/scrollView.width;
    self.pageControl.currentPage=page;
}
//初始化最后一个imageView
-(void)setupLastImageView:(UIImageView *)imageView{
    //开启交互功能
    imageView.userInteractionEnabled=YES;
    //1.分享给大家
    UIButton *shareBtn=[[UIButton alloc]init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    shareBtn.width=200; shareBtn.height=30;
    shareBtn.centerX=imageView.width * 0.5;
    shareBtn.centerY=imageView.height * 0.65;
    shareBtn.titleEdgeInsets=UIEdgeInsetsMake(0,10,0,0);
    [imageView addSubview:shareBtn];
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    //2.开始体验
    UIButton *startBtn=[[UIButton alloc]init];
    UIImage *normalImage=[UIImage resizableImage:@"new_feature_finish_button"];
    UIImage *highlightImage=[UIImage resizableImage:@"new_feature_finish_button_hightlighted"];
    [startBtn setBackgroundImage:normalImage forState:UIControlStateNormal];
    [startBtn setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
   
    
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_hightlighted"] forState:UIControlStateHighlighted];
    [startBtn setTitle:@"开始医疗新体验" forState:UIControlStateNormal];
    //startBtn.size=startBtn.currentBackgroundImage.size;
    startBtn.size=CGSizeMake(300, 200);
    startBtn.centerX=shareBtn.centerX;
    startBtn.centerY=imageView.height*0.75;
    [imageView addSubview:startBtn];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)shareClick:(UIButton *)shareBtn{
    //状态取反
    shareBtn.selected=!shareBtn.isSelected;
}
-(void)startClick{
    //切换到wyrTabBarViewController,即切换window的rootViewController
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    window.rootViewController=[[wyrTabBarViewController alloc]init];
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
