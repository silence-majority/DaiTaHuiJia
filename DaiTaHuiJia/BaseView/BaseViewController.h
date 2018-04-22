//
//  BaseViewController.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYNavigationBar.h"
@interface BaseViewController : UIViewController
@property (nonatomic,strong) UIView *by_navigationBar;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UILabel *navTitleLabel;
@property (nonatomic,copy) NSString *navTitle;
@end
