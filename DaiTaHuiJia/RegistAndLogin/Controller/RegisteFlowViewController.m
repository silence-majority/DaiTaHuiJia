//
//  RegisteFlowViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegisteFlowViewController.h"
#import "RegisteMobileFlowView.h"
#import <Masonry/Masonry.h>
@interface RegisteFlowViewController ()
@property (nonatomic,strong) UIView *progressLineView;
@property (nonatomic,strong) RegisteMobileFlowView *mobileFlowView;
@property (nonatomic,strong) RegisteMobileFlowView *verifyCodeFlowView;
@end

@implementation RegisteFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.mobileFlowView];
    [_mobileFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(80, 0, 0, 0));
    }];
    
    [self.view addSubview:self.verifyCodeFlowView];
    [_verifyCodeFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.left.offset(screenW);
        make.bottom.offset(0);
        make.width.mas_equalTo(screenW);
    }];
    __weak typeof(self) weakSelf = self;
    [_mobileFlowView setNextStepBlock:^{
        weakSelf.verifyCodeFlowView.alpha = 0;
        [weakSelf moveProgressLineWithStep:2];
        [weakSelf.verifyCodeFlowView setTitle:@"2 / 5 输入验证码"];
        weakSelf.verifyCodeFlowView.subTitle.text = @"短信验证码已经发送至+86*******6065";
        [UIView animateWithDuration:0.4 animations:^{
            weakSelf.mobileFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
            weakSelf.mobileFlowView.alpha = 0;
            weakSelf.verifyCodeFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
            weakSelf.verifyCodeFlowView.alpha = 1;
        }];
    }];
    
    [self.view addSubview:self.progressLineView];
    [self moveProgressLineWithStep:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (RegisteMobileFlowView *)mobileFlowView{
    if (!_mobileFlowView) {
        _mobileFlowView = [[RegisteMobileFlowView alloc] initWithFrame:CGRectZero];
    }
    return _mobileFlowView;
}

- (RegisteMobileFlowView *)verifyCodeFlowView{
    if (!_verifyCodeFlowView) {
        _verifyCodeFlowView = [[RegisteMobileFlowView alloc] initWithFrame:CGRectZero];
    }
    return _verifyCodeFlowView;
}

- (UIView *)progressLineView{
    if (!_progressLineView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(-screenW, 64, screenW, 2)];
        view.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR];
        _progressLineView = view;
    }
    return _progressLineView;
}

- (void)moveProgressLineWithStep:(NSUInteger)step{
    [UIView animateWithDuration:0.4 animations:^{
        self.progressLineView.transform = CGAffineTransformMakeTranslation(screenW/5.0, 0);
    } completion:^(BOOL finished) {
        CGRect frame = self.progressLineView.frame;
        frame.origin.x = screenW/5.0*step-screenW;
        self.progressLineView.frame = frame;
    }];
}


@end
