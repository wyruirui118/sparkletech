//
//  wyrHomeViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/22.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrHomeViewController.h"
#import "wyrPictureBrowser.h"
#import "test2ViewController.h"
#import "SDCycleScrollView.h"
#import "Model.h"
#import "MyView.h"
@interface wyrHomeViewController ()
@property (nonatomic, strong) NSArray *appList;
@property (nonatomic, strong) SDCycleScrollView *picture;
@property (nonatomic, strong) MyView *arrangeView;
@property (nonatomic, assign) NSInteger indexCount;
@property (nonatomic, strong) UIButton *listButton;
@end

@implementation wyrHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _picture=[[SDCycleScrollView alloc]initWithFrame:CGRectMake(0,45,self.view.width,150)];
    _picture.localizationImageNamesGroup=@[@"img_01",@"img_02",@"img_03"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_picture];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)loadView
{
    //图片轮播器
    
    self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self arraysList];
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0,230, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
    //控制总列数
    int totalColumns = 3;
    
    CGFloat Y = 15;
    CGFloat W = 90;
    CGFloat H = 100;
    CGFloat X = (self.view.frame.size.width - totalColumns * W) / (totalColumns + 1);
    
    _listButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 200, 80, 40)];
    [self.view addSubview:_listButton];
    _listButton.backgroundColor = [UIColor redColor];
    
    for (int index = 0; index < _appList.count; index++) {
        
        Model *model = _appList[index];
        int row = index / totalColumns;
        int col = index % totalColumns;
        CGFloat viewX = X + col * (W + X);
        CGFloat viewY = 20 + row * (H + Y);
        _arrangeView = [[MyView alloc] initWithFrame:CGRectMake(viewX, viewY, W, H) Model:model MyButtonBlock:^(NSInteger index) {
            _indexCount = index-999;
            NSLog(@"%ld",_indexCount);
        }];
        _arrangeView.button.tag = 1000+index;
        _arrangeView.model = model;
        [scrollView addSubview:_arrangeView];
        CGFloat maxY = CGRectGetMaxY(_arrangeView.frame);
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, maxY);
    }
    
    [self.view addSubview:scrollView];
    
}

- (NSArray *)arraysList
{
    if (_appList == nil) {
        NSMutableArray *mutArray = [NSMutableArray array];
        NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];
        for (NSDictionary *dict in array) {
            [mutArray addObject:[Model modelWithDict:dict]];
        }
        _appList = mutArray;
    }
    
    return _appList;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
