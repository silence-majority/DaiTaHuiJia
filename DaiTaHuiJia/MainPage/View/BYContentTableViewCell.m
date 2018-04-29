//
//  BYContentTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/21.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYContentTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UITableViewCell+BottomLine.h"
@implementation BYContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(16, 20, 16, 20));
        }];
        [self setContent:@""];
    }
    return self;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x464646"];
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    return _contentLabel;
}

- (void)setContent:(NSString *)content{
    NSString *plainText = @"我是正男的奶奶，孩子学校刚刚放暑假，我要上班没有时间照顾他，正男就一个人学校踢足球，在回家的路上被一个叫菊次郎的怪大叔骗去找妈妈，希望好心人看到他们两请告诉我，感激不尽！";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _contentLabel.attributedText = attributeText;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self drawBottomLineWithGap:20];
}

@end
