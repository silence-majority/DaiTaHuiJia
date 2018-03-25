//
//  FunctionTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "FunctionTableViewCell.h"
#import <Masonry/Masonry.h>
@interface FunctionTableViewCell()

@property (nonatomic,strong) UIImageView *symbolImageView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation FunctionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.symbolImageView];
        [_symbolImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(16);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_symbolImageView.mas_right).offset(16);
            make.centerY.offset(0);
        }];
    }
    return self;
}

- (void)cofigureWithImage:(NSString *)name title:(NSString *)title{
    _symbolImageView.image = [UIImage imageNamed:name];
    _titleLabel.text = title;
}

- (UIImageView *)symbolImageView{
    if (!_symbolImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _symbolImageView = imageView;
    }
    return _symbolImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x181818"];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
