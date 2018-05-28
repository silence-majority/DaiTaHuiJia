//
//  GenderPickerPopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "GenderPickerPopView.h"
#import <Masonry/Masonry.h>
@interface GenderPickerPopView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *sureButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *operateView;
@property (nonatomic,assign) UserGender gender;
@end

@implementation GenderPickerPopView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(0);
            make.height.mas_equalTo(260);
        }];
        
        [_contentView addSubview:self.pickerView];
        [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.centerX.offset(0);
            make.top.offset(70);
            make.bottom.offset(-20);
        }];
        
        [_contentView addSubview:self.operateView];
        [_operateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.offset(50);
        }];
        
        [_operateView addSubview:self.cancelButton];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(12);
            make.centerY.offset(0);
        }];
        
        [_operateView addSubview:self.sureButton];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-12);
            make.centerY.offset(0);
        }];
        
        [_operateView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
        }];
        _contentView.transform = CGAffineTransformMakeTranslation(0, 260);
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
            } else {
                weakSelf.contentView.transform = CGAffineTransformMakeTranslation(0, 260);
                
            }
        }];
        
        [_cancelButton addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];
        [_sureButton addTarget:self action:@selector(sureButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    _titleLabel.text = @"请选择性别";
    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

- (UIPickerView *)pickerView{
    if (!_pickerView) {
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        _pickerView = pickerView;
    }
    return _pickerView;
}

- (UIView *)operateView {
    if (!_operateView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@"0xEEEEEE"];
        _operateView = view;
    }
    return _operateView;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancelButton = button;
    }
    return _cancelButton;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        _sureButton = button;
    }
    return _sureButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (row == 0) {
        return @"男";
    } else {
        return @"女";
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    _gender = row;
}

- (void)sureButtonAction{
    if (self.eventBlock) {
        self.eventBlock(1, @{@"gender":@(_gender)});
    }
    [self dismissPopView];
}

@end
