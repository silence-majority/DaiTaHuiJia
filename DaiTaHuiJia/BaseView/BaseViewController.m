//
//  BaseViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "LoginViewController.h"
#import <Masonry/Masonry.h>
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = self.view.frame;
    frame.size = [UIScreen mainScreen].bounds.size;
    self.view.frame = frame;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    [self.view addSubview:self.by_navigationBar];
    [_by_navigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(64);
    }];
    
    [_by_navigationBar addSubview:self.backButton];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-10);
        make.left.offset(16);
        make.size.mas_equalTo(CGSizeMake(25, 25));
    }];

    _by_navigationBar.backgroundColor = [UIColor whiteColor];
//    [self.view bringSubviewToFront:_by_navigationBar];
}


- (void)setIsNaviInteractivePopGestureRecognizerEnable:(BOOL)isNaviInteractivePopGestureRecognizerEnable{
    if (!isNaviInteractivePopGestureRecognizerEnable) {
        BaseNavigationController *navi = (BaseNavigationController *)self.navigationController;
        navi.isInteractivePopGestureRecognizerEnable = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (UIView *)by_navigationBar{
    if (!_by_navigationBar) {
        UIView *navigationBar = [[UIView alloc] init];
        _by_navigationBar = navigationBar;
    }
    return _by_navigationBar;
}

- (UIButton *)backButton{
    if (!_backButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"back_b"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];\
        _backButton = button;
    }
    return _backButton;
}

- (void)setBackType:(BackType)backType{
    _backType = backType;
    switch (_backType) {
        case BackTypePop:
            [_backButton setImage:[UIImage imageNamed:@"back_b"] forState:UIControlStateNormal];
            break;
         case BackTypeDismiss:
            [_backButton setImage:[UIImage imageNamed:@"fork"] forState:UIControlStateNormal];
            break;
    }
}

- (void)back{
    switch (_backType) {
        case BackTypePop:
            [self.navigationController popViewControllerAnimated:true];
            break;
        case BackTypeDismiss:
            [self dismissViewControllerAnimated:true completion:nil];
            break;
    }
}

- (void)presentLoginViewController{
    LoginViewController *target = [[LoginViewController alloc] init];
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:target];
    [baseNav setNavigationBarHidden:true];
    [self presentViewController:baseNav animated:true completion:nil];
}

@end
