//
//  RegisteFlowViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegisteFlowViewController.h"
#import "RegisteMobileFlowView.h"
#import "VerifyCodeFlowView.h"
#import "SetPasswordFlowView.h"
#import "PersonalInfoFlowView.h"
#import "AuthFlowView.h"
#import <Masonry/Masonry.h>
@interface RegisteFlowViewController ()
@property (nonatomic,strong) UIView *progressLineView;
@property (nonatomic,strong) RegisteMobileFlowView *mobileFlowView;
@property (nonatomic,strong) VerifyCodeFlowView *verifyCodeFlowView;
@property (nonatomic,strong) SetPasswordFlowView *setPasswordFlowView;
@property (nonatomic,strong) PersonalInfoFlowView *personalInfoFlowView;
@property (nonatomic,strong) AuthFlowView *authFlowView;
@property (nonatomic,strong) NSMutableArray <RegisteFlowBaseView *> * registeFlowViews;

@end

@implementation RegisteFlowViewController

- (void)regiestFlowView:(RegisteFlowBaseView *)flowView{
    [self.view addSubview:flowView];
    [flowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(80);
        make.left.offset(screenW);
        make.bottom.offset(0);
        make.width.mas_equalTo(screenW);
    }];
    [_registeFlowViews addObject:flowView];
}

- (void)startFlow{
    RegisteFlowBaseView *flowView = _registeFlowViews[0];
    flowView.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        flowView.alpha = 1;
        flowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
    } completion:^(BOOL finished) {
        
//        CGRect frame = flowView.frame;
//        frame.origin.x = 0;
//        flowView.frame = frame;
//        flowView.transform = CGAffineTransformIdentity;
        
    }];
    for (NSInteger step = 0; step < _registeFlowViews.count; step++) {
        RegisteFlowBaseView *flowView = _registeFlowViews[step];
        __weak typeof(self) weakSelf = self;
        [flowView setNextStepBlock:^{
            [weakSelf moveProgressLineWithStep:step+2];
            if (step == _registeFlowViews.count-1) {
                [weakSelf.navigationController dismissViewControllerAnimated:true completion:nil];
            } else {
                RegisteFlowBaseView *nextFlow = weakSelf.registeFlowViews[step+1];
                RegisteFlowBaseView *currentFlow = weakSelf.registeFlowViews[step];
                
                nextFlow.alpha = 0;
                [UIView animateWithDuration:0.4 animations:^{
                    currentFlow.alpha = 0;
                    nextFlow.alpha = 1;
                    currentFlow.transform = CGAffineTransformMakeTranslation(-screenW*2, 0);
                    nextFlow.transform =  CGAffineTransformMakeTranslation(-screenW, 0);
                } completion:^(BOOL finished) {
                    
//                    CGRect currentFlowFrame = currentFlow.frame;
//                    currentFlowFrame.origin.x = -screenW;
//                    currentFlow.frame = currentFlowFrame;
//                    currentFlow.transform = CGAffineTransformIdentity;
//
//
//                    CGRect nextFlowFrame = nextFlow.frame;
//                    nextFlowFrame.origin.x = -screenW;
//                    nextFlow.frame = nextFlowFrame;
//                    nextFlow.transform = CGAffineTransformIdentity;
                }];
            }
          
        }];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [self startFlow];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _registeFlowViews = [[NSMutableArray alloc] init];
    [self regiestFlowView:self.mobileFlowView];
    [self regiestFlowView:self.verifyCodeFlowView];
    [self regiestFlowView:self.setPasswordFlowView];
    [self regiestFlowView:self.personalInfoFlowView];
    [self regiestFlowView:self.authFlowView];
//    [self.view addSubview:self.mobileFlowView];
//    [_mobileFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(80, 0, 0, 0));
//    }];
//
//    [self.view addSubview:self.verifyCodeFlowView];
//    [_verifyCodeFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(80);
//        make.left.offset(screenW);
//        make.bottom.offset(0);
//        make.width.mas_equalTo(screenW);
//    }];
//
//    [self.view addSubview:self.setPasswordFlowView];
//    [_setPasswordFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(80);
//        make.left.offset(screenW);
//        make.bottom.offset(0);
//        make.width.mas_equalTo(screenW);
//    }];
//
//    [self.view addSubview:self.personalInfoFlowView];
//    [_personalInfoFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(80);
//        make.left.offset(screenW);
//        make.bottom.offset(0);
//        make.width.mas_equalTo(screenW);
//    }];
//
//    [self.view addSubview:self.authFlowView];
//    [_authFlowView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(80);
//        make.left.offset(screenW);
//        make.bottom.offset(0);
//        make.width.mas_equalTo(screenW);
//    }];

//    __weak typeof(self) weakSelf = self;
//    [_mobileFlowView setNextStepBlock:^{
//        weakSelf.verifyCodeFlowView.alpha = 0;
//        [weakSelf moveProgressLineWithStep:2];
//        [weakSelf.verifyCodeFlowView setTitle:@"2 / 5 输入验证码"];
//        weakSelf.verifyCodeFlowView.subTitle.text = @"短信验证码已经发送至+86*******6065";
//        [UIView animateWithDuration:0.4 animations:^{
//            weakSelf.mobileFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.mobileFlowView.alpha = 0;
//            weakSelf.verifyCodeFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.verifyCodeFlowView.alpha = 1;
//        }];
//    }];
//
//    [_verifyCodeFlowView setNextStepBlock:^{
//        weakSelf.setPasswordFlowView.alpha = 0;
//        [weakSelf moveProgressLineWithStep:3];
//        [UIView animateWithDuration:0.4 animations:^{
//            weakSelf.verifyCodeFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.verifyCodeFlowView.alpha = 0;
//            weakSelf.setPasswordFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.setPasswordFlowView.alpha = 1;
//        }];
//    }];
//
//    [_setPasswordFlowView setNextStepBlock:^{
//        weakSelf.personalInfoFlowView.alpha = 0;
//        [weakSelf moveProgressLineWithStep:4];
//        [UIView animateWithDuration:0.4 animations:^{
//            weakSelf.setPasswordFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.setPasswordFlowView.alpha = 0;
//            weakSelf.personalInfoFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.personalInfoFlowView.alpha = 1;
//        }];
//    }];
//
//    [_personalInfoFlowView setNextStepBlock:^{
//        weakSelf.personalInfoFlowView.alpha = 0;
//        [weakSelf moveProgressLineWithStep:5];
//        [UIView animateWithDuration:0.4 animations:^{
//            weakSelf.personalInfoFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.personalInfoFlowView.alpha = 0;
//            weakSelf.authFlowView.transform = CGAffineTransformMakeTranslation(-screenW, 0);
//            weakSelf.authFlowView.alpha = 1;
//        }];
//    }];
    
    
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

- (VerifyCodeFlowView *)verifyCodeFlowView{
    if (!_verifyCodeFlowView) {
        _verifyCodeFlowView = [[VerifyCodeFlowView alloc] initWithFrame:CGRectZero];
    }
    return _verifyCodeFlowView;
}

- (SetPasswordFlowView *)setPasswordFlowView{
    if (!_setPasswordFlowView) {
        _setPasswordFlowView = [[SetPasswordFlowView alloc] initWithFrame:CGRectZero];
    }
    return _setPasswordFlowView;
}

- (PersonalInfoFlowView *)personalInfoFlowView{
    if (!_personalInfoFlowView) {
        _personalInfoFlowView = [[PersonalInfoFlowView alloc] initWithFrame:CGRectZero];
    }
    return _personalInfoFlowView;
}

- (AuthFlowView *)authFlowView{
    if (!_authFlowView) {
        _authFlowView = [[AuthFlowView alloc] initWithFrame:CGRectZero];
    }
    return _authFlowView;
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
        self.progressLineView.transform = CGAffineTransformMakeTranslation(screenW/5.0*step, 0);
    } completion:^(BOOL finished) {
//        self.progressLineView.transform = CGAffineTransformIdentity;
//        CGRect frame = self.progressLineView.frame;
//        frame.origin.x = screenW/5.0*step-screenW;
//        self.progressLineView.frame = frame;
        
    }];
}


@end
