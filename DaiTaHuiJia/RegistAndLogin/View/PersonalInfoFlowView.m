//
//  PersonalInfoFlowView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "PersonalInfoFlowView.h"
#import <Masonry/Masonry.h>
#import "UploadImageView.h"
@interface PersonalInfoFlowView()
@property (nonatomic,strong) UIImageView *nickImageView;
@property (nonatomic,strong) UIImageView *wechatImageView;
@property (nonatomic,strong) UITextField *nickTextfield;
@property (nonatomic,strong) UITextField *wechatTextfield;
@property (nonatomic,strong) UILabel *nickTipLabel;
@property (nonatomic,strong) UILabel *wechatTipLabel;
@property (nonatomic,strong) UIImageView *portraitImageView;
@property (nonatomic,strong) UIButton *nextStepButton;
@property (nonatomic,strong) UploadImageView *uploadImageView;
@end

@implementation PersonalInfoFlowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.nickImageView];
        [_nickImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.mas_equalTo(self.subTitle).offset(40);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self addSubview:self.nickTipLabel];
        [_nickTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nickImageView.mas_right).offset(6);
            make.centerY.mas_equalTo(_nickImageView);
        }];
        
        [self addSubview:self.nickTextfield];
        [_nickTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.mas_equalTo(_nickImageView.mas_bottom).offset(6);
            make.right.offset(-160);
            make.height.mas_equalTo(40);
        }];
        
        [self addSubview:self.wechatImageView];
        [_wechatImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nickImageView);
            make.top.mas_equalTo(_nickTextfield.mas_bottom).offset(16);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self addSubview:self.wechatTipLabel];
        [_wechatTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_wechatImageView.mas_right).offset(6);
            make.centerY.mas_equalTo(_wechatImageView);
        }];
        
        [self addSubview:self.wechatTextfield];
        [_wechatTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nickTextfield);
            make.top.mas_equalTo(_wechatImageView.mas_bottom).offset(6);
            make.right.offset(-160);
            make.height.mas_equalTo(40);
        }];
        
        [self addSubview:self.uploadImageView];
        [_uploadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nickTextfield.mas_right).offset(20);
            make.right.offset(-20);
            make.top.mas_equalTo(_nickTextfield);
            make.bottom.mas_equalTo(_wechatTextfield);
        }];
        
        [self addSubview:self.nextStepButton];
        [_nextStepButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_wechatTextfield);
            make.centerX.offset(0);
            make.top.mas_equalTo(_wechatTextfield.mas_bottom).offset(25);
            make.height.mas_equalTo(45);
        }];
    }
    
    _wechatImageView.image = [UIImage imageNamed:@"微信"];
    _nickImageView.image = [UIImage imageNamed:@"用户"];
    _wechatTextfield.placeholder = @"请输入微信号";
    _nickTextfield.placeholder = @"请输入昵称";
    _nickTipLabel.text = @"昵称设定后不能再修改";
    _wechatTipLabel.text = @"添加微信方便联系";
    [self setTitle:@"4 / 5 完善个人信息"];
    self.subTitle.text = @"完善个人信息方便他人联系你";
    return self;
}

- (UIImageView *)nickImageView{
    if (!_nickImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _nickImageView = imageView;
    }
    return _nickImageView;
}

- (UIImageView *)wechatImageView{
    if (!_wechatImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _wechatImageView = imageView;
    }
    return _wechatImageView;
}

- (UITextField *)nickTextfield{
    if (!_nickTextfield) {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.font = [UIFont systemFontOfSize:15];
        textfield.textColor = [UIColor blackColor];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 45)];
        textfield.leftViewMode = UITextFieldViewModeAlways;
        textfield.layer.cornerRadius = 8;
        textfield.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        textfield.layer.borderWidth = 0.6f;
        _nickTextfield = textfield;
    }
    return _nickTextfield;
}

- (UITextField *)wechatTextfield{
    if (!_wechatTextfield) {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.font = [UIFont systemFontOfSize:15];
        textfield.textColor = [UIColor blackColor];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 45)];
        textfield.leftViewMode = UITextFieldViewModeAlways;
        textfield.layer.cornerRadius = 8;
        textfield.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        textfield.layer.borderWidth = 0.6f;
        _wechatTextfield = textfield;
    }
    return _wechatTextfield;
}

- (UILabel *)nickTipLabel{
    if (!_nickTipLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        _nickTipLabel = label;
    }
    return _nickTipLabel;
}

- (UILabel *)wechatTipLabel{
    if (!_wechatTipLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        _wechatTipLabel = label;
    }
    return _wechatTipLabel;
}

- (UploadImageView *)uploadImageView{
    if (!_uploadImageView) {
        UploadImageView *view = [[UploadImageView alloc] initWithFrame:CGRectZero];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        _uploadImageView = view;
    }
    return _uploadImageView;
}

- (UIButton *)nextStepButton{
    if (!_nextStepButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.7];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"下一步" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
        _nextStepButton = button;
    }
    return _nextStepButton;
}

@end
