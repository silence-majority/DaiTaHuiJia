//
//  MockSearchBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MockSearchBar.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@implementation MockSearchBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *getsture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(beTouchedAction)];
        [self addGestureRecognizer:getsture];
        self.backgroundColor = [UIColor colorWithHexString:@"0xEDEEEF"];
        self.layer.cornerRadius = 6;
        [self addSubview:self.scopeImageView];
        [_scopeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(8);
            make.centerY.offset(0);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.mas_equalTo(_scopeImageView.mas_right).offset(6);
        }];
        _scopeImageView.image = [UIImage imageNamed:@"搜索"];
        _titleLabel.text = @"搜索";
    }
    return self;
}

- (UIImageView *)scopeImageView{
    if (!_scopeImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _scopeImageView = imageView;
    }
    return _scopeImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor darkGrayColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (void)beTouchedAction{
    if (_beTouchBlock) {
        _beTouchBlock();
    }
}

@end
