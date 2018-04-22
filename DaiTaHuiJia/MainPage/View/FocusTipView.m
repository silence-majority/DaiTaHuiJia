//
//  FocusTipView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/22.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "FocusTipView.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface FocusTipView ()

@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) CAShapeLayer *middleLineLayer;


@end

@implementation FocusTipView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(16, 0, 0, 0));
        }];
        
        [_contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(12);
            make.left.offset(12);
        }];
        
        [_contentView addSubview:self.subTitleLabel];
        [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLabel.mas_right).offset(12);
            make.centerY.mas_equalTo(_titleLabel);
        }];
        
        [_contentView addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(52);
            make.right.offset(-12);
        }];
        
        [_contentView.layer addSublayer:self.middleLineLayer];
        
        _titleLabel.text = @"我已关注";
        _subTitleLabel.text = @"这是我关注的第个5案例";
        _describeLabel.text = @"每一次关注、分享，都是一份希望！";
    }
    return self;
}

- (UIView *)contentView{
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.2];
        view.layer.cornerRadius = 4;
        view.layer.borderColor = [UIColor colorWithHexString:COLOR_THEME_STR].CGColor;
        view.layer.borderWidth = 0.6;
        _contentView = view;
    }
    return _contentView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor darkGrayColor];
        _subTitleLabel = label;
    }
    return _subTitleLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor darkGrayColor];
        _describeLabel = label;
    }
    return _describeLabel;
}

- (CAShapeLayer *)middleLineLayer{
    if (!_middleLineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(12, 40)];
        [path addLineToPoint:CGPointMake(screenW-12-40, 40)];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.lineWidth = 0.4;
        layer.strokeColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.8].CGColor;
        layer.path = path.CGPath;
        _middleLineLayer = layer;
    }
    return _middleLineLayer;
}

@end
