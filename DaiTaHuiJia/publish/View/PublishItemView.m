//
//  PublishItemView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "PublishItemView.h"
#import <Masonry/Masonry.h>
@interface PublishItemView()
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *describeLabel;

@end
@implementation PublishItemView

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.top.offset(16);
            make.left.offset(16);
        }];
        
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_imageView.mas_centerY);
            make.left.mas_equalTo(_imageView.mas_right).offset(8);
        }];
        
        [self addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(8);
            make.right.offset(-8);
            make.top.mas_equalTo(_imageView.mas_bottom).offset(2);
            make.bottom.offset(-8);
        }];
    }
    return self;
}

- (void)configureWithImage:(NSString *)name
                     title:(NSString *)title
                  describe:(NSString *)text{
    _imageView.image = [UIImage imageNamed:name];
    _titleLabel.text = title;
    _describeLabel.text = text;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:17];
        label.textColor = COLOR_THEME;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        label.numberOfLines = 0;
        _describeLabel = label;
    }
    return _describeLabel;
}

- (void)layoutSubviews{
    self.layer.cornerRadius = 5;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 3;
    self.layer.shadowOpacity = 0.6;
}

@end
