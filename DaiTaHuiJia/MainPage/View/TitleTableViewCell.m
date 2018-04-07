//
//  TitleTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "TitleTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"

@implementation TitleTableViewCell

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
            make.left.offset(20);
            make.top.offset(20);
            make.bottom.offset(-12);
        }];
    }
    [self testData];
    return self;
}

- (void)testData{
    _titleLabel.text = @"线索链";
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:18];
        label.textColor = [UIColor colorWithHexString:@"0x181818"];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
