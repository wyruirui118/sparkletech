//
//  UIView+Extension.h
//  xiangmu-weibo
//
//  Created by wangyunrui on 15/12/19.
//  Copyright © 2015年 cookiex. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIView (Extension)
//分类只能扩充方法,这样写只会扩充方法的声明,并不会实现.所以要自己写set,get方法
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;
@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;
@end
