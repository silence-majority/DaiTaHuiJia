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
#import "ChoosePublishViewController.h"
#import "MainPageViewController.h"
#import "MineViewController.h"
@interface BaseTabBarController ()<BYPublishTabBarDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MainTabBar *publishBar = [[MainTabBar alloc] init];
    publishBar.publishDelegate = self;
    publishBar.commonBarCount = 2;
    [self setValue:publishBar forKey:@"tabBar"];
    MainPageViewController *baseVCA = [[MainPageViewController alloc] init];
    BaseNavigationController *baseNavA = [[BaseNavigationController alloc] initWithRootViewController:baseVCA];
    UITabBarItem *homeBarItem = [self tabBarItemWithTitle:@"主页" TitleColor:[UIColor redColor] image:@"homeBarItem_normal" selectedImage:@"homeBarItem_focu"];
    baseNavA.tabBarItem = homeBarItem;
    
    MineViewController *baseVCB = [[MineViewController alloc] init];
    BaseNavigationController *baseNavB = [[BaseNavigationController alloc] initWithRootViewController:baseVCB];
    UITabBarItem *mineBarItem = [self tabBarItemWithTitle:@"我的" TitleColor:[UIColor redColor] image:@"mineBarItem_normal" selectedImage:@"mineBarItem_focu"];
    
    baseNavB.tabBarItem = mineBarItem;
    
    self.viewControllers = @[baseNavA,baseNavB];
}

- (UITabBarItem*)tabBarItemWithTitle:(NSString*)title
                          TitleColor:(UIColor*)titleColor
                               image:(NSString*)image
                       selectedImage:(NSString*)selectedImage{
    UITabBarItem *tabBarItem;
    tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                               image:[self renderImageWithName:image]
                                       selectedImage:[self renderImageWithName:selectedImage]];
    //改变tabBar字体颜色
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:255/255.0 green:132/255.0 blue:123/255.0 alpha:1],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    return tabBarItem;
}

- (UIImage*)renderImageWithName:(NSString*)imageName {
    UIImage * image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)didTouchPublishView{
    ChoosePublishViewController *target = [[ChoosePublishViewController alloc] init];
    [self presentViewController:target animated:false completion:nil];
}


@end
