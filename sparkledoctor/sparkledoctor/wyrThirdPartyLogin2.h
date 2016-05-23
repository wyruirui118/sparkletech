//
//  wyrThirdPartyLogin2.h
//  sparkledoctor
//
//  Created by wangyunrui on 16/4/11.
//  Copyright © 2016年 sparkletech. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^loginBlock)(NSString * , NSString *);
@interface wyrThirdPartyLogin2 : UIView
@property(nonatomic,weak)UITextField *textPhone;
@property(nonatomic,weak)UITextField *passWord;
@property(nonatomic,weak)UIButton *loginBtn;
@property (nonatomic,copy) loginBlock loginBlock;

@end
