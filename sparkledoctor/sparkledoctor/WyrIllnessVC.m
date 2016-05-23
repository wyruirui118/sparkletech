//
//  WyrIllnessVC.m
//  sparkledoctor
//
//  Created by 李海洋 on 16/5/21.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "WyrIllnessVC.h"
#import "ServerModel.h"
@interface WyrIllnessVC () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray * array;

@property (nonatomic,strong) UITableView * tab;

@end

@implementation WyrIllnessVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
    
    _tab.delegate = self;
    
    _tab.dataSource = self;
    
    [self.view addSubview:_tab];
    
    [self load];

    
}

-(void)load{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
    params[@"patient_type"] = _type;
    params[@"part"] = _name;
    params[@"ill"] = _illness;
    
    [ZmHttptool getWithJSONBaseURL:sendIllness params:params success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        NSMutableArray * marr = [NSMutableArray array];
        
        for (NSDictionary * dic in responseObject) {
            ServerModel * model = [ServerModel modelWithDict:dic];
            
            [marr addObject:model];
        }
        
        _array = marr;
        
        [_tab reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ServerModel * model = _array[indexPath.row];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    cell.textLabel.text = model.department_floor;
    
    cell.detailTextLabel.text = model.department_name;
    
    
    return cell;
    
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
