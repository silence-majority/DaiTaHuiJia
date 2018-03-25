//
//  TableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "UserBriefTableViewCell.h"
#import <Masonry/Masonry.h>
@interface UserBriefTableViewCell()

@property (nonatomic,strong) UIImageView *portraitImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *describeLabel;

@end

@implementation UserBriefTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.portraitImageView];
        [_portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.offset(16);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_portraitImageView.mas_right).offset(16);
            make.bottom.mas_equalTo(_portraitImageView.mas_centerY).offset(-3);
        }];
        [self.contentView addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_titleLabel.mas_left);
            make.top.mas_equalTo(_portraitImageView.mas_centerY).offset(3);
        }];
    }
    return self;
}

- (UIImageView *)portraitImageView{
    if (!_portraitImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _portraitImageView = imageView;
    }
    return _portraitImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:18];
        label.textColor = [UIColor colorWithHexString:@"0x181818"];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithHexString:@"0x707070"];
        _describeLabel = label;
    }
    return _describeLabel;
}

- (void)cofigureWithImage:(NSString *)name title:(NSString *)title descirbe:(NSString *)describe{
        _portraitImageView.image = [UIImage imageNamed: name];
        _titleLabel.text = title;
        _describeLabel.text = describe;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _portraitImageView.layer.cornerRadius = _portraitImageView.bounds.size.width/2;
}

@end
