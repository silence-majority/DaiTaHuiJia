//
//  BaseTabBarController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"
#import "BYPublishTabBar.h"
#import "MainTabBar.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainTabBar *publishBar = [[MainTabBar alloc] init];
    publishBar.commonBarCount = 2;
    [self setValue:publishBar forKey:@"tabBar"];
    
    BaseViewController *baseVCA = [[BaseViewController alloc] init];
    baseVCA.view.backgroundColor = [UIColor whiteColor];
    BaseNavigationController *baseNavA = [[BaseNavigationController alloc] initWithRootViewController:baseVCA];
    UITabBarItem *tabBarItemA = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemMore) tag:0];
    baseNavA.tabBarItem = tabBarItemA;
    
    BaseViewController *baseVCB = [[BaseViewController alloc] init];
    baseVCB.view.backgroundColor = [UIColor whiteColor];
    BaseNavigationController *baseNavB = [[BaseNavigationController alloc] initWithRootViewController:baseVCB];
    UITabBarItem *tabBarItemB = [[UITabBarItem alloc] initWithTabBarSystemItem:(UITabBarSystemItemHistory) tag:1];
    baseNavB.tabBarItem = tabBarItemB;
    
    self.viewControllers = @[baseNavA,baseNavB];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
