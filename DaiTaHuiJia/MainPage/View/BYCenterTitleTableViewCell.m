//
//  BYCenterTitleTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/21.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYCenterTitleTableViewCell.h"
#import <Masonry/Masonry.h>
@implementation BYCenterTitleTableViewCell

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
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
