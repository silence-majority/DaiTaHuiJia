//
//  BaseViewController.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYNavigationBar.h"
typedef NS_ENUM(NSUInteger,BackType){
    BackTypePop = 0,
    BackTypeDismiss
};
@interface BaseViewController : UIViewController
@property (nonatomic,strong) UIView *by_navigationBar;
@property (nonatomic,assign) BackType backType;
@property (nonatomic,strong) UIButton *backButton;
@property (nonatomic,strong) UIButton *rigthButton;
@property (nonatomic,strong) UILabel *navTitleLabel;
@property (nonatomic,copy) NSString *navTitle;

- (void)presentLoginViewController;
@end
