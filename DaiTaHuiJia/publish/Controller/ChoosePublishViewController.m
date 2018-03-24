//
//  ChoosePublishViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ChoosePublishViewController.h"
#import "PublishItemView.h"
#import <Masonry/Masonry.h>

#define publishItemSize CGSizeMake(160, 100)
#define horizentalHalf 15
#define verticalHalf 75
@interface ChoosePublishViewController ()
@property (nonatomic,strong) PublishItemView *seekPeoplePublishView;
@property (nonatomic,strong) PublishItemView *seekHomePublishView;
@property (nonatomic,strong) PublishItemView *registPublishView;
@property (nonatomic,strong) PublishItemView *thankPublishView;
@property (nonatomic,strong) UIButton *exitBtn;
@end

@implementation ChoosePublishViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.seekPeoplePublishView];
    [_seekPeoplePublishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(publishItemSize);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-horizentalHalf);
        make.centerY.offset(-verticalHalf);
    }];
    
    [self.view addSubview:self.seekHomePublishView];
    [_seekHomePublishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(publishItemSize);
        make.left.mas_equalTo(self.view.mas_centerX).offset(horizentalHalf);
        make.centerY.offset(-verticalHalf);
    }];
    
    [self.view addSubview:self.registPublishView];
    [_registPublishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(publishItemSize);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-horizentalHalf);
        make.centerY.offset(verticalHalf);
    }];
    
    [self.view addSubview:self.thankPublishView];
    [_thankPublishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(publishItemSize);
        make.left.mas_equalTo(self.view.mas_centerX).offset(horizentalHalf);
        make.centerY.offset(verticalHalf);
    }];
    
    [self.view addSubview:self.exitBtn];
    [_exitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerX.offset(0);
        make.centerY.mas_equalTo(self.view.mas_bottom).offset(-41);
    }];
    [self prepareAnimation];
}

- (void)viewDidAppear:(BOOL)animated{
    [self appearAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (PublishItemView *)seekPeoplePublishView{
    if (!_seekPeoplePublishView) {
        PublishItemView *publishView = [[PublishItemView alloc] initWithFrame:CGRectZero];
        [publishView configureWithImage:@"wait"
                                  title:@"“待”他回家"
                               describe:@"亲人走失，发布亲人贴期待他的回家"];
        _seekPeoplePublishView = publishView;
    }
    return _seekPeoplePublishView;
}

- (PublishItemView *)seekHomePublishView{
    if (!_seekHomePublishView) {
        PublishItemView *publishView = [[PublishItemView alloc] initWithFrame:CGRectZero];
        [publishView configureWithImage:@"bringToHome"
                                  title:@"“带”他回家"
                               describe:@"走失的人正在您身旁为他发布寻亲贴带他回家"];
        _seekHomePublishView = publishView;
    }
    return _seekHomePublishView;
}

- (PublishItemView *)registPublishView{
    if (!_registPublishView) {
        PublishItemView *publishView = [[PublishItemView alloc] initWithFrame:CGRectZero];
        [publishView configureWithImage:@"registeEarly"
                                  title:@"提前登记"
                               describe:@"为身边走失的高危人群提前登记"];
        _registPublishView = publishView;
    }
    return _registPublishView;
}

- (PublishItemView *)thankPublishView{
    if (!_thankPublishView) {
        PublishItemView *publishView = [[PublishItemView alloc] initWithFrame:CGRectZero];
        [publishView configureWithImage:@"thank"
                                  title:@"团圆致谢"
                               describe:@"已与失散亲人团聚，向平台致谢，并鼓励其他人"];
        _thankPublishView = publishView;
    }
    return _thankPublishView;
}

- (UIButton *)exitBtn{
    if (!_exitBtn) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(exitBtnAction) forControlEvents:UIControlEventTouchUpInside];
        _exitBtn = button;
    }
    return _exitBtn;
}

- (void)exitBtnAction{
    [self disappearAnimation];
    dispatch_time_t timer = dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC);
    dispatch_after(timer, dispatch_get_main_queue(), ^{
        [self dismissViewControllerAnimated:false completion:nil];
    });
}

- (void)prepareAnimation{
    CGFloat height = screenH;
    height = height/2+150;
    self.seekPeoplePublishView.transform = CGAffineTransformMakeTranslation(0, height);
    self.seekHomePublishView.transform = CGAffineTransformMakeTranslation(0, height);
    self.registPublishView.transform = CGAffineTransformMakeTranslation(0, height);
    self.thankPublishView.transform = CGAffineTransformMakeTranslation(0, height);
}
- (void)appearAnimation{
    [UIView animateWithDuration:0.4 delay:0.2 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.exitBtn.transform = CGAffineTransformMakeRotation(-M_PI/4.0);
    } completion:^(BOOL finished) {
        
    }];
    
    [self appearAnimationWithObject:self.seekPeoplePublishView delay:0.2];
    [self appearAnimationWithObject:self.seekHomePublishView delay:0.3];
    [self appearAnimationWithObject:self.registPublishView delay:0.4];
    [self appearAnimationWithObject:self.thankPublishView delay:0.5];
}

- (void)appearAnimationWithObject:(PublishItemView *)publishItem delay:(CGFloat)delay{
    [UIView animateWithDuration:0.2 delay:delay usingSpringWithDamping:0.8 initialSpringVelocity:10 options:(UIViewAnimationOptionCurveLinear) animations:^{
        publishItem.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)disappearAnimation{
    [UIView animateWithDuration:0.4 delay:0.2 usingSpringWithDamping:0.3 initialSpringVelocity:10 options:(UIViewAnimationOptionCurveEaseInOut) animations:^{
        self.exitBtn.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
    [self disappearAnimationWithObject:self.seekPeoplePublishView delay:0.4];
    [self disappearAnimationWithObject:self.seekHomePublishView delay:0.3];
    [self disappearAnimationWithObject:self.registPublishView delay:0.2];
    [self disappearAnimationWithObject:self.thankPublishView delay:0.1];
}

- (void)disappearAnimationWithObject:(PublishItemView *)publishItem delay:(CGFloat)delay{
    [UIView animateWithDuration:0.2 delay:delay usingSpringWithDamping:0.8 initialSpringVelocity:10 options:(UIViewAnimationOptionCurveLinear) animations:^{
        CGFloat height = screenH;
        height = height/2+150;
        publishItem.transform = CGAffineTransformMakeTranslation(0, height);
    } completion:^(BOOL finished) {
        
    }];
}

@end
