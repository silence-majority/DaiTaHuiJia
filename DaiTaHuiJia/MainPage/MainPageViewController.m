//
//  MainPageViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MainPageViewController.h"
#import "BYSearchSegmentNavgationBar.h"
@interface MainPageViewController ()
@property (nonatomic,strong) BYSearchSegmentNavgationBar *navigationBar;

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    self.navigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 106);
    self.navigationBar.backgroundColor = [UIColor redColor];
    self.navigationBar.translucent = false;
    [self.view addSubview:self.navigationBar];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BYSearchSegmentNavgationBar *)navigationBar{
    if (!_navigationBar) {
        _navigationBar = [[BYSearchSegmentNavgationBar alloc] initWithFrame:CGRectZero];
    }
    return _navigationBar;
}


@end
