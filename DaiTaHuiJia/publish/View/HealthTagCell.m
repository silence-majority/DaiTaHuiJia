//
//  HealthTagCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "HealthTagCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface HealthTagCell()
@property (nonatomic,strong) CAShapeLayer *triangleLayer;
@end

@implementation HealthTagCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
        self.backgroundColor = [UIColor colorWithHexString:@"0xF4F4F3"];
        self.layer.cornerRadius = 2;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
        }];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithHexString:@"0x3B383C"];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (void)setIsSelected:(BOOL)isSelected{
    if (isSelected) {
        self.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.15];
        _titleLabel.textColor = [UIColor colorWithHexString:COLOR_THEME_STR];
    } else {
        self.backgroundColor = [UIColor colorWithHexString:@"0xF4F4F3"];
        _titleLabel.textColor = [UIColor colorWithHexString:@"0x3B383C"];
    }
}

@end
