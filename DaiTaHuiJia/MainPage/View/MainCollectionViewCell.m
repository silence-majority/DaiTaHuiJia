//
//  MainCollectionViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import <Masonry/Masonry.h>
@interface MainCollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIVisualEffectView *blurView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UIImageView *imageViewA;
@property (nonatomic,strong) UIImageView *imageViewB;
@property (nonatomic,strong) UIImageView *imageViewC;
@end

@implementation MainCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(_imageView.mas_width);
        }];
        
        [self.contentView addSubview:self.blurView];
        [_blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(44);
        }];
        
        [_blurView.contentView addSubview:self.imageViewA];
        [_imageViewA mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(4);
            make.left.offset(6);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        [_blurView.contentView addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_imageViewA);
            make.left.mas_equalTo(_imageViewA.mas_right).offset(4);
        }];
        
        [_blurView.contentView addSubview:self.imageViewB];
        [_imageViewB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_imageViewA);
            make.left.mas_equalTo(_nameLabel.mas_right).offset(12);
            make.size.mas_equalTo(CGSizeMake(12.5, 12.5));
        }];
        
        [_blurView.contentView addSubview:self.dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_imageViewA);
            make.left.mas_equalTo(_imageViewB.mas_right).offset(4);
        }];
        
        [_blurView.contentView addSubview:self.imageViewC];
        [_imageViewC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-4);
            make.left.offset(6);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        [_blurView.contentView addSubview:self.addressLabel];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_imageViewC);
            make.left.mas_equalTo(_imageViewC.mas_right).offset(4);
        }];
        
    }
    [self makeUI];
    return self;
}

- (void)makeUI{
    _imageView.image = [UIImage imageNamed:@"aloneChild"];
    _nameLabel.text = @"林  **";
    _dateLabel.text = @"2017年12月27日";
    _addressLabel.text = @"云南省淄川市临江县山口镇";
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = true;
        _imageView = imageView;
    }
    return _imageView;
}

- (UIVisualEffectView *)blurView{
    if (!_blurView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurView = visualEffectView;
    }
    return _blurView;
}

- (UILabel *)nameLabel { //1296db
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        _dateLabel = label;
    }
    return _dateLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor blackColor];
        _addressLabel = label;
    }
    return _addressLabel;
}

- (UIImageView *)imageViewA{
    if (!_imageViewA) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"人"];
        _imageViewA = imageView;
    }
    return _imageViewA;
}

- (UIImageView *)imageViewB{
if (!_imageViewB) {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"日期"];
    _imageViewB = imageView;
}
return _imageViewB;
}

- (UIImageView *)imageViewC{
if (!_imageViewC) {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"地址"];
    _imageViewC = imageView;
}
return _imageViewC;
}


@end
