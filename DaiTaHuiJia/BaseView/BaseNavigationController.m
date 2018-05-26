//
//  BaseNavigationController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BaseNavigationController.h"
#import "BaseViewController.h"
@interface BaseNavigationController ()
@property (strong, nonatomic) UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setIsInteractivePopGestureRecognizerEnable:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setIsInteractivePopGestureRecognizerEnable:(BOOL)isInteractivePopGestureRecognizerEnable{
    NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
    id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
    SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
    if (isInteractivePopGestureRecognizerEnable) {
        _edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:internalTarget action:internalAction];
        _edgePanGestureRecognizer.edges = UIRectEdgeLeft;
        [self.view addGestureRecognizer:_edgePanGestureRecognizer];
    }else{
        [_edgePanGestureRecognizer removeTarget:internalTarget action:internalAction];
        [self.view removeGestureRecognizer:_edgePanGestureRecognizer];
    }
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated{
    if (self.viewControllers.count == 2) {
        [self.viewControllers.firstObject setHidesBottomBarWhenPushed:false];
    }
    return [super popViewControllerAnimated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count >= 1) {
        [self.viewControllers.firstObject setHidesBottomBarWhenPushed:true];
    }
    [super pushViewController:viewController animated:true];
}

@end
