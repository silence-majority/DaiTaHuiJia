//
//  SearchCollectionHeaderView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/23.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "SearchCollectionHeaderView.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface SearchCollectionHeaderView()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation SearchCollectionHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(12);
        }];
    }
    _titleLabel.text = @"历史搜索";
    return self;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x222222"];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
