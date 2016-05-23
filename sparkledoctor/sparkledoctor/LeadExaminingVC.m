//
//  LeadExaminingVC.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "LeadExaminingVC.h"
#import "LeadExaminingView.h"
#import "WyrIllnessVC.h"
@interface LeadExaminingVC ()
@property (nonatomic,strong) LeadExaminingView * examView;

@end

@implementation LeadExaminingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%ld",_index);
    
    _examView = [[LeadExaminingView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    
    _examView.index = _index;
    
    __typeof(self)weakSelf = self;
    
    _examView.illnessBlock = ^(NSString * name,NSString * illness){
      
        [weakSelf jumpIllnessVc:name and:illness];
        
    };
    
    [self.view addSubview:_examView];

}

-(void)jumpIllnessVc:(NSString *)name and:(NSString *)illness{
    
    WyrIllnessVC * vc = [[WyrIllnessVC alloc] init];
    
    vc.type = _type;
    
    vc.name = name;
    
    vc.illness = illness;
    
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
