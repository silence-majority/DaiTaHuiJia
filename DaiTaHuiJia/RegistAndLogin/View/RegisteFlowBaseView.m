//
//  RegisteFlowBaseView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegisteFlowBaseView.h"
#import <Masonry/Masonry.h>
@interface RegisteFlowBaseView()

@end

@implementation RegisteFlowBaseView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.centerX.offset(-8);
        }];
        
        [self addSubview:self.subTitle];
        [_subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).offset(12);
            make.centerX.offset(0);
        }];
    }
    [self setTitle:@"1 / 5  输入手机号"];
    _subTitle.text = @"手机号将是给你提供信息的重要途径";
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:20];
        label.textColor = [UIColor blackColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)subTitle{
    if (!_subTitle) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        _subTitle = label;
    }
    return _subTitle;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:title];
    [attributeText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:32] range:NSMakeRange(0, 3)];
    [attributeText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:COLOR_THEME_STR] range:NSMakeRange(0, 5)];
    _titleLabel.attributedText = attributeText;
}

- (void)nextStepAction{
    if (_nextStepBlock) {
        _nextStepBlock();
    }
}

@end
