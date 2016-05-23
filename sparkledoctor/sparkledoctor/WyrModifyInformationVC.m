//
//  WyrModifyInformationVC.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "WyrModifyInformationVC.h"
#import "WryModifyView.h"
@interface WyrModifyInformationVC ()

@property (nonatomic,strong) WryModifyView * modifyView;


@end

@implementation WyrModifyInformationVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.modifyView = [[WryModifyView alloc] initWithFrame:CGRectMake(0, 0,WIDTH,HEIGTH)];
    
    [self.view addSubview:self.modifyView];
    
    NSLog(@"112");
}



@end
