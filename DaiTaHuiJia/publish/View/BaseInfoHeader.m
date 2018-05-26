//
//  BaseInfoHeader.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BaseInfoHeader.h"
#import <Masonry/Masonry.h>

@interface BaseInfoHeader()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation BaseInfoHeader

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.centerY.offset(0);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
        
        [self addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16);
            make.centerY.offset(0);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
    }
    NSString *plainText = @"关于他，\n我们需要多些了解";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 6;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _titleLabel.attributedText = attributeText;
    _imageView.image = [UIImage imageNamed:@"ju-main"];
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.masksToBounds = true;
        imageView.layer.cornerRadius = 40;
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.textColor = [UIColor colorWithHexString:@"0x3B383C"];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}


@end
