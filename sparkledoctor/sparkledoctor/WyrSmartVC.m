//
//  WyrSmartVC.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "WyrSmartVC.h"
#import "WyrSmartView.h"
#import "LeadExaminingVC.h"
@interface WyrSmartVC ()
@property (nonatomic,strong) WyrSmartView * smartView;

@end

@implementation WyrSmartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _smartView = [[WyrSmartView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    __typeof(self)weakSelf = self;
    _smartView.jumpLeadBlock = ^(NSInteger index,NSString *type){
        
        [weakSelf jumpLead:index and:type];
        
    };
    
    [self.view addSubview:_smartView];
    
}


-(void)jumpLead:(NSInteger)index and:(NSString *)type{
    
    LeadExaminingVC * vc = [[LeadExaminingVC alloc] init];
    
    vc.index = index;
    
    vc.type = type;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
