//
//  UploadImageView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "UploadImageView.h"
#import <Masonry/Masonry.h>
@interface UploadImageView()
@property (nonatomic,strong) UIImageView *addImageView;

@end

@implementation UploadImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.addImageView];
        [_addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.bottom.mas_equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.top.mas_equalTo(_addImageView.mas_bottom).offset(6);
        }];
    }
    _addImageView.image = [UIImage imageNamed:@"add"];
    _titleLabel.text = @"点击上传头像";
    return self;
}

- (UIImageView *)addImageView{
    if (!_addImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _addImageView = imageView;
    }
    return _addImageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
