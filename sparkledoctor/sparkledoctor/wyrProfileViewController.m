//
//  wyrProfileViewController.m
//  sparkledoctor
//
//  Created by wangyunrui on 16/3/30.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import "wyrProfileViewController.h"
#import "wyrSettingItem.h"
#import "wyrSettingArrowItem.h"
#import "wyrSettingSwitchItem.h"
#import "wyrSettingLabelItem.h"
#import "test2ViewController.h"
#import "wyrSettingGroup.h"
#import "wyrTableHeaderView.h"
#import "wyrTableHeaderButton.h"
#import "wyrRegisterViewController.h"
#import "wyrNavigationController.h"
#import "AFNetworking.h"
#import "wyrUser.h"
#import "MJExtension.h"
#import "wyrAccount.h"
#import "wyrAccountTool.h"
#import "UIButton+WebCache.h" 
#import "UIImageView+WebCache.h"
#import "WyrModifyInformationVC.h"
@interface wyrProfileViewController () <wyrTableHeaderButtonDelegate>
@property(nonatomic,weak)wyrTableHeaderView *headView;
@end

@implementation wyrProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加数据
    [self setupGroup0];
    [self setupGroup1];
    
    //设置tableview头部
    wyrTableHeaderView *headView=[[wyrTableHeaderView alloc]initWithFrame:CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width,200)];
    self.headView=headView;
    self.tableView.tableHeaderView=headView;
    
    //设置代理
    headView.mainBtn.delegate=self;
    
    //改变头像和昵称
//    wyrAccount *account=[wyrAccountTool account];
//    if (account.access_token) {
//    //[self setupUserInfo:headView];
//    [self setupUserInfo:headView account:(wyrAccount *)account];
//        headView.userInteractionEnabled=NO;  //不能点击
//        NSLog(@"%@haha ",account);
//    }
    
//    UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
//    
//    [imageview sd_setImageWithURL:[NSURL URLWithString:@"http://img4.imgtn.bdimg.com/it/u=1635259526,3753247068&fm=21&gp=0.jpg"] placeholderImage:nil];
//    
//    [self.view addSubview:imageview];
    
    
}


//改变头像和昵称
//-(void)setupUserInfo:(wyrTableHeaderView *)headView account:(wyrAccount *)account{
////-(void)setupUserInfo:(wyrTableHeaderView *)headView{
//    //url:https://api.weibo.com/2/users/show.json
//    //access_token string 	采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
//    //uid int64 需要查询的用户ID。
//    //1.请求管理者
//    AFHTTPRequestOperationManager *mgr=[AFHTTPRequestOperationManager manager];
//    
//    //2.拼接请求参数
//   // wyrAccount *account=[wyrAccountTool account];
//   // if (account.access_token) {  //access_token有值
//        NSMutableDictionary *params=[NSMutableDictionary dictionary];
//        params[@"access_token"]=account.access_token;
//        params[@"uid"]=account.uid;
//        //3.发送请求
//        [mgr GET:@"https://api.weibo.com/2/users/show.json" parameters:params success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
//            
//            //设置名字和头像
//            wyrUser *user=[wyrUser objectWithKeyValues:responseObject];
//            //        wyrTableHeaderView *aa=[[wyrTableHeaderView alloc]init];
//            //        [aa.mainBtn setTitle:user.name forState:UIControlStateNormal];
//            [headView.mainBtn setTitle:user.name forState:UIControlStateNormal];
//#warning 这里应该是用SDWebImage,但是怎么用？
//            //        [headView.mainBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:user.profile_image_url] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder"]];
//            //        [headView.mainBtn setImage:[UIImage circleImageWithName:user.profile_image_url borderWidth:4.0 borderColor:[UIColor whiteColor]] forState:UIControlStateNormal];
//            
//            
//            //存储昵称和头像到沙盒中
//            account.name=user.name;
//            //account.profile_image_url=user.profile_image_url;
//            [wyrAccountTool saveAccount:account];
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"%@",error);
//        }];
//
//    //}
//}



//隐藏navigationBar
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:YES];
    //
    [[NSNotificationCenter defaultCenter]postNotificationName:@"viewWillAppear" object:nil];
}
//显示navigationBar
-(void)viewDidDisappear:(BOOL)animated{
    //self.navigationController.navigationBarHidden=NO;
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [super viewWillDisappear:YES];
}
//0组
-(void)setupGroup0{
    wyrSettingItem *pushNotice=[wyrSettingArrowItem itemWithIcon:@"found_icons_folder" title:@"推送和提醒" destVcClass:[test2ViewController class]];
    wyrSettingItem *handShake=[wyrSettingSwitchItem itemWithIcon:@"found_icons_folder" title:@"李海洋"];
    wyrSettingItem *soundEffect=[wyrSettingSwitchItem itemWithIcon:@"found_icons_folder" title:@"声音效果"];
    soundEffect.option=^{
        NSLog(@"声音");
    };
    wyrSettingGroup *group0=[[wyrSettingGroup alloc]init];
    group0.items=@[pushNotice,handShake,soundEffect];
    [self.data addObject:group0];
}
//1组
-(void)setupGroup1{
    wyrSettingItem *update=[wyrSettingArrowItem itemWithIcon:@"found_icons_folder" title:@"检查新版本"];
    //用block快
    update.option=^{
        NSLog(@"aa");
    };
    wyrSettingItem *product=[wyrSettingArrowItem  itemWithIcon:@"found_icons_folder" title:@"修改个人信息" destVcClass:[WyrModifyInformationVC class]];
    wyrSettingItem *share=[wyrSettingArrowItem  itemWithIcon:@"found_icons_folder" title:@"分享" destVcClass:[test2ViewController class]];
    wyrSettingItem *viewMsg=[wyrSettingArrowItem  itemWithIcon:@"found_icons_folder" title:@"查看消息" destVcClass:[test2ViewController class]];
    wyrSettingItem *quitlogin=[wyrSettingArrowItem  itemWithIcon:@"found_icons_folder" title:@"退出当前账号" destVcClass:[test2ViewController class]];
    quitlogin.option=^{
        NSLog(@"tuichu");
        [wyrAccountTool deleteFile];
    };
    
    wyrSettingItem *about=[wyrSettingArrowItem  itemWithIcon:@"found_icons_folder" title:@"关于" destVcClass:[test2ViewController class]];
    wyrSettingGroup *group1=[[wyrSettingGroup alloc]init];
    group1.items=@[update,product,share,viewMsg,quitlogin,about];
    [self.data addObject:group1];
}

//wyrTableHeaderButtonDelegate的代理方法
//点击按钮跳转到wyrRegisterViewController
-(void)tableHeaderButtonClick{
    wyrRegisterViewController *registerPage=[[wyrRegisterViewController alloc]init];
    wyrNavigationController *nav=[[wyrNavigationController alloc]initWithRootViewController:registerPage];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
