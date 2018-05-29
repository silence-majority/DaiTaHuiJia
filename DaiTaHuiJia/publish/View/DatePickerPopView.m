//
//  DatePickerPopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "DatePickerPopView.h"
#import <Masonry/Masonry.h>
@interface DatePickerPopView()
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *sureButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *operateView;
@property (nonatomic,strong) NSDateFormatter *formatter;
@end

@implementation DatePickerPopView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(0);
            make.height.mas_equalTo(260);
        }];
        
        [_contentView addSubview:self.datePicker];
        [_datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.offset(60);
            make.bottom.offset(-20);
        }];
        
        [_contentView addSubview:self.operateView];
        [_operateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.offset(40);
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
    }
    _titleLabel.text = @"请选择日期";
    [_cancelButton addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];
    [_sureButton addTarget:self action:@selector(sureButtonAction) forControlEvents:UIControlEventTouchUpInside];
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

- (UIDatePicker *)datePicker{
    if (!_datePicker) {
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.maximumDate = [NSDate date];
        _datePicker = datePicker;
    }
    return _datePicker;
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

- (void)sureButtonAction{
    if(!_formatter){
        _formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"YYYY-MM-dd";
    }
    NSString *dateText = [_formatter stringFromDate:_datePicker.date];
    if (self.eventBlock) {
        self.eventBlock(1, @{@"date"    :_datePicker.date,
                             @"dateText":dateText
                             });
    }
    [self dismissPopView];
}



@end
