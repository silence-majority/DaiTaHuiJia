//
//  HealthInfoHeader.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "HealthInfoHeader.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface HealthInfoHeader()

@end

@implementation HealthInfoHeader

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(16);
        }];
        
        [self addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16);
            make.centerY.offset(0);
        }];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.textColor = [UIColor colorWithHexString:@"0x101110"];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x3B383C"];
        label.numberOfLines = 0;
        _describeLabel = label;
    }
    return _describeLabel;
}


@end
