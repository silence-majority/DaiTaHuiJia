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
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UITapGestureRecognizer *gesture;
@end

@implementation BaseInfoHeader

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
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
        
        _gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction)];
        [_imageView addGestureRecognizer:_gesture];
    }
    _imageView.image = [UIImage imageNamed:@"camera"];
    return self;
}

- (void)setTitle:(NSString *)title{
    NSString *plainText = title;
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 6;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _titleLabel.attributedText = attributeText;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.masksToBounds = true;
        imageView.layer.cornerRadius = 40;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.userInteractionEnabled = true;
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

- (void)showBottomLine{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.bounds.size.height-1)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height-1)];
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = 0.4;
    layer.strokeColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
    [self.layer addSublayer:layer];
}

- (void)touchAction{
    if (_imageBlock) {
        _imageBlock();
    }
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (_isShowBottomLine) {
        [self showBottomLine];
    }
}

@end
