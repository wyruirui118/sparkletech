//
//  wyrPictureBrowser.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrPictureBrowser.h"
@interface wyrPictureBrowser() <UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pageControl;  //分页控制
@property(nonatomic,weak)UIScrollView *scrollView;  //滚动的控件
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation wyrPictureBrowser
int pictureCount=3;
-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //创建UIScrollView
        UIScrollView *scrollView=[[UIScrollView alloc]init];
        scrollView.frame=self.frame;
        CGFloat svW=CGRectGetWidth(frame)*pictureCount;
        scrollView.contentSize=CGSizeMake(svW,0);
        //隐藏水平滚动条
        scrollView.showsHorizontalScrollIndicator=NO;
        //自动分页
        //原理:根据scrollView的宽度进行分页
        scrollView.pagingEnabled=YES;
        [self addSubview:scrollView];
        self.scrollView=scrollView;
        scrollView.delegate=self;  //设置代理
        //创建UIImageView
        CGFloat imageW=CGRectGetWidth(self.frame);
        CGFloat imageH=CGRectGetHeight(self.frame);
        for (int i=0;i<pictureCount;i++) {
            CGFloat imageX=i*imageW;
            UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(imageX,0,imageW,imageH)];
            [image setImage:[UIImage imageNamed:[NSString stringWithFormat:@"img_0%d",i+1]]];
            [scrollView addSubview:image];
        }
        //创建UIPageControl分页控制器
        UIPageControl *pageControl=[[UIPageControl alloc]init];
        pageControl.frame=CGRectMake(150,90,100,37);
        //设置PageControl的总页数
        pageControl.numberOfPages=pictureCount;
        //设置其他页面颜色
        pageControl.pageIndicatorTintColor=[UIColor blueColor];
        //设置当前页面颜色
        pageControl.currentPageIndicatorTintColor=[UIColor redColor];
        [self addSubview:pageControl];
        self.pageControl=pageControl;
        //添加定时器
        [self addTimer];
    }
    return self;
}
//设置定时器,自动开始下一张
-(void)nextImage{
    //增加pageControl的页码
    int page=0;
    if (self.pageControl.currentPage==pictureCount-1) {
        page=0;
    }else{
        page=(int)self.pageControl.currentPage+1;
    }
    //计算滚动的位置
    CGFloat offsexX=page*self.scrollView.frame.size.width;
    CGPoint offset=CGPointMake(offsexX,0);
    [self.scrollView setContentOffset:offset animated:YES];
}
//代理方法
//滑动时切换页面
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page=(scrollView.contentOffset.x+scrollView.frame.size.width*0.5)/scrollView.frame.size.width;
    self.pageControl.currentPage=page;
}
//开始拖拽的时候关掉定时器.防止拖拽不动的时候定时器还走
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //一旦定时器停止就不能使用了,只能清空
    [self.timer invalidate];
    self.timer=nil;
}
//完全停止拖拽的时候调用
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //再次开启定时器
    [self addTimer];
}
//创建定时器
-(void)addTimer{
    self.timer=[NSTimer scheduledTimerWithTimeInterval:6.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //消息循环,线程的分流
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
