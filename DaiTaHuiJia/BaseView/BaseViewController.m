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
@property (nonatomic,strong) CAShapeLayer *bottomLineLayer;
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
    
    [_by_navigationBar addSubview:self.navTitleLabel];
    [_navTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.mas_equalTo(_backButton);
    }];

    _by_navigationBar.backgroundColor = [UIColor whiteColor];
    
//    [_by_navigationBar.layer addSublayer:self.bottomLineLayer];
//    [self.view bringSubviewToFront:_by_navigationBar];
}

- (void)setNavTitle:(NSString *)navTitle{
    _navTitleLabel.text = navTitle;
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

- (UIButton *)rigthButton{
    if (!_rigthButton) {
        UIButton *button = [[UIButton alloc] init];
        _rigthButton = button;
        [self.by_navigationBar addSubview:_rigthButton];
        [_rigthButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16);
            make.centerY.mas_equalTo(_navTitleLabel);
        }];
    }
    return _rigthButton;
}

- (void)viewWillAppear:(BOOL)animated{
    _by_navigationBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _by_navigationBar.layer.shadowOffset = CGSizeMake(0, 0.5);
    _by_navigationBar.layer.shadowRadius = 4;
    _by_navigationBar.layer.shadowOpacity = 0.4;
}

- (UILabel *)navTitleLabel{
    if (!_navTitleLabel) {
        UILabel *label = [UILabel new];
        label.font = [UIFont boldSystemFontOfSize:16];
        label.textColor = [UIColor blackColor];
        _navTitleLabel = label;
    }
    return _navTitleLabel;
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

- (CAShapeLayer *)bottomLineLayer{
    if (!_bottomLineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 64)];
        [path addLineToPoint:CGPointMake(screenW, 64)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.lineWidth = 0.5;
        layer.strokeColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        _bottomLineLayer = layer;
    }
    return _bottomLineLayer;
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
