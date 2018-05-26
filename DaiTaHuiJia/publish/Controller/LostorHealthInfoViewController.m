//
//  LostorHealthInfoViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorHealthInfoViewController.h"

@interface LostorHealthInfoViewController ()

@end

@implementation LostorHealthInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"完善信息（2/3）";
    [self.view bringSubviewToFront:self.by_navigationBar];
    [self.rigthButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.rigthButton setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
    self.rigthButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rigthButton addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
