//
//  BYContentTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/21.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYContentTableViewCell.h"
#import <Masonry/Masonry.h>

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
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 16, 20));
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
    NSString *plainText = @"孩子当天下午在家门口玩耍，玩到傍晚还没回来，家里人就去找孩子，找到夜晚还没找到。据路人回忆说，一个中年陌生男人抱着一个小孩迅速钻进车里然后消失了，恳请知道线索的好心人告知我，感激不尽！";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _contentLabel.attributedText = attributeText;

}

@end
