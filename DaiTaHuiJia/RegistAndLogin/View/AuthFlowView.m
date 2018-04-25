//
//  AuthFlowView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "AuthFlowView.h"
#import <Masonry/Masonry.h>
#import "UploadImageView.h"

@interface AuthFlowView ()
@property (nonatomic,strong) UploadImageView *frontImageView;
@property (nonatomic,strong) UploadImageView *backImageView;
@property (nonatomic,strong) UploadImageView *faceWithIdCardImageView;
@property (nonatomic,strong) UIButton *finishButton;
@property (nonatomic,strong) UIButton *skipButton;
@end

@implementation AuthFlowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat imageWidth = (screenW-120)/5.0*3;
        CGFloat imageHeight = imageWidth*0.65;
        
        [self addSubview:self.frontImageView];
        [_frontImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.mas_equalTo(self.subTitle.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(imageWidth, imageHeight));
        }];
        
        [self addSubview:self.backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.mas_equalTo(_frontImageView.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(imageWidth, imageHeight));
        }];
        
        [self addSubview:self.faceWithIdCardImageView];
        [_faceWithIdCardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_frontImageView.mas_right).offset(20);
            make.top.mas_equalTo(_frontImageView);
            make.bottom.mas_equalTo(_backImageView);
            make.right.offset(-20);
        }];
        
        [self addSubview:self.finishButton];
        [_finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerX.offset(0);
            make.top.mas_equalTo(_backImageView.mas_bottom).offset(25);
            make.height.mas_equalTo(45);
        }];
        
        [self addSubview:self.skipButton];
        [_skipButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerX.offset(0);
            make.top.mas_equalTo(_finishButton.mas_bottom).offset(25);
            make.height.mas_equalTo(45);
        }];
    }
    [self setTitle:@"5 / 5 身份认证"];
    self.subTitle.text = @"部分功能需要身份认证才能使用";
    return self;
}

- (UploadImageView *)frontImageView{
    if (!_frontImageView) {
        UploadImageView *view = [[UploadImageView alloc] initWithFrame:CGRectZero];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        view.titleLabel.text = @"身份证正面图";
        _frontImageView = view;
    }
    return _frontImageView;
}

- (UploadImageView *)backImageView{
    if (!_backImageView) {
        UploadImageView *view = [[UploadImageView alloc] initWithFrame:CGRectZero];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        view.titleLabel.text = @"身份证背面图";
        _backImageView = view;
    }
    return _backImageView;
}

- (UploadImageView *)faceWithIdCardImageView{
    if (!_faceWithIdCardImageView) {
        UploadImageView *view = [[UploadImageView alloc] initWithFrame:CGRectZero];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        view.titleLabel.text = @"手持身份证图";
        _faceWithIdCardImageView = view;
    }
    return _faceWithIdCardImageView;
}

- (UIButton *)finishButton{
    if (!_finishButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.7];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"完成注册" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
        _finishButton = button;
    }
    return _finishButton;
}

- (UIButton *)skipButton{
    if (!_skipButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"暂不认证" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
        _skipButton = button;
    }
    return _skipButton;
}

@end
