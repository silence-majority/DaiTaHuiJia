//
//  RegisteMobileFlowView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegisteMobileFlowView.h"
#import <Masonry/Masonry.h>
@interface RegisteMobileFlowView()
@property (nonatomic,strong) UITextField *textfield;
@property (nonatomic,strong) UIButton *nextStepButton;
@end
@implementation RegisteMobileFlowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.textfield];
        [_textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.centerX.offset(0);
            make.top.mas_equalTo(self.subTitle.mas_bottom).offset(20);
            make.height.mas_equalTo(45);
        }];
        
        [self addSubview:self.nextStepButton];
        [_nextStepButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_textfield);
            make.centerX.offset(0);
            make.top.mas_equalTo(_textfield.mas_bottom).offset(25);
            make.height.mas_equalTo(45);
        }];
    }
    _textfield.placeholder = @"请输入手机号";
    return self;
}

- (UITextField *)textfield{
    if (!_textfield) {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.font = [UIFont systemFontOfSize:15];
        textfield.textColor = [UIColor blackColor];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        textfield.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 45)];
        textfield.leftViewMode = UITextFieldViewModeAlways;
        textfield.layer.cornerRadius = 8;
        textfield.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        textfield.layer.borderWidth = 0.6f;
        _textfield = textfield;
    }
    return _textfield;
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
