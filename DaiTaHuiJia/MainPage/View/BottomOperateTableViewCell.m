//
//  BottomOperateTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BottomOperateTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface BottomOperateTableViewCell()

@end

@implementation BottomOperateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(12);
            make.bottom.offset(-16);
            make.centerX.offset(0);
        }];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor colorWithHexString:@"0x008CF2"];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
