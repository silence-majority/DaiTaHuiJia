//
//  MainCollectionViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "LostBriefModel.h"
@interface MainCollectionViewCell()

@property (nonatomic,strong) UIImageView *imageView;
//@property (nonatomic,strong) UIVisualEffectView *blurView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UIImageView *imageViewA;
@property (nonatomic,strong) UIImageView *imageViewB;
@property (nonatomic,strong) UIImageView *imageViewC;
@property (nonatomic,strong) CAShapeLayer *leftTagLayer;
@property (nonatomic,strong) CAShapeLayer *rightTagLayer;
@property (nonatomic,strong) UILabel *dateTagLabel;
@property (nonatomic,strong) UILabel *distanceTagLabel;

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
        
//        [self.contentView addSubview:self.blurView];
//        [_blurView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.offset(0);
//            make.left.offset(0);
//            make.right.offset(0);
//            make.height.mas_equalTo(44);
//        }];
        
//        [self.contentView addSubview:self.imageViewA];
//        [_imageViewA mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.offset(4);
//            make.left.offset(6);
//            make.size.mas_equalTo(CGSizeMake(15, 15));
//        }];
//
        [self.contentView addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
//            make.left.offset(12);
            make.top.mas_equalTo(_imageView.mas_bottom).offset(15);
        }];
        
        [self.contentView addSubview:self.dateTagLabel];
        [_dateTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_nameLabel);
            make.right.mas_equalTo(_nameLabel.mas_left).offset(-8);
            make.size.mas_equalTo(CGSizeMake(45, 18));
        }];
        
        [self.contentView addSubview:self.distanceTagLabel];
        [_distanceTagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_nameLabel);
            make.left.mas_equalTo(_nameLabel.mas_right).offset(8);
            make.size.mas_equalTo(CGSizeMake(45, 18));
        }];
        
        [self.contentView addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(_nameLabel);
            make.centerX.offset(0);
            make.bottom.offset(-12);
        }];
        
//        [_blurView.contentView addSubview:self.imageViewB];
//        [_imageViewB mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(_imageViewA);
//            make.left.mas_equalTo(_nameLabel.mas_right).offset(12);
//            make.size.mas_equalTo(CGSizeMake(12.5, 12.5));
//        }];
//
//        [self.contentView addSubview:self.dateLabel];
//        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.mas_equalTo(_nameLabel.mas_bottom).offset(6);
//            make.left.mas_equalTo(_nameLabel);
//        }];
//
//        [_blurView.contentView addSubview:self.imageViewC];
//        [_imageViewC mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.offset(-4);
//            make.left.offset(6);
//            make.size.mas_equalTo(CGSizeMake(15, 15));
//        }];
//
//        [_blurView.contentView addSubview:self.addressLabel];
//        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(_imageViewC);
//            make.left.mas_equalTo(_imageViewC.mas_right).offset(4);
//        }];
        
    }
    [self makeUI];
    return self;
}

- (void)makeUI{
    _imageView.image = [UIImage imageNamed:@"sunyizhen"];
    _nameLabel.text = @"林枚章";
    _describeLabel.text = @"于云南省淄川市临江县山口镇走失";
    _dateTagLabel.text = @"128天前";
    _distanceTagLabel.text = @"35公里";
    _dateLabel.text = @"2017年12月27日";
//    _addressLabel.text = @"云南省淄川市临江县山口镇";
}
- (void)configureWithModel:(LostBriefModel *)model{
    _imageView.image = [UIImage imageNamed:model.imageName];
    _nameLabel.text = model.name;
    _describeLabel.text = [NSString stringWithFormat:@"与%@走失",model.address];
    _dateTagLabel.text = [NSString stringWithFormat:@"%.0f天前",model.lostTime];
    _distanceTagLabel.text = [NSString stringWithFormat:@"%.0f公里",model.lostDistance];
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
//
//- (UIVisualEffectView *)blurView{
//    if (!_blurView) {
//        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
//        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//        _blurView = visualEffectView;
//    }
//    return _blurView;
//}

- (UILabel *)nameLabel { //1296db
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UILabel *)dateTagLabel{
    if (!_dateTagLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = COLOR_THEME;
        label.layer.cornerRadius = 2;
        label.layer.borderWidth = 0.6;
        label.layer.borderColor = [UIColor colorWithHexString:@"0xFF847B"].CGColor;
        label.textAlignment = NSTextAlignmentCenter;
        _dateTagLabel = label;
    }
    return _dateTagLabel;
}

- (UILabel *)distanceTagLabel{
    if (!_distanceTagLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = COLOR_THEME;
        label.layer.cornerRadius = 2;
        label.layer.borderWidth = 0.6;
        label.layer.borderColor = [UIColor colorWithHexString:@"0xFF847B"].CGColor;
        label.textAlignment = NSTextAlignmentCenter;
        _distanceTagLabel = label;
    }
    return _distanceTagLabel;
}

- (UILabel *)describeLabel {
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor darkGrayColor];
        _describeLabel = label;
    }
    return _describeLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor darkGrayColor];
        _dateLabel = label;
    }
    return _dateLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor darkGrayColor];
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

- (CAShapeLayer *)leftTagLayer{
    if (!_leftTagLayer) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, self.bounds.size.height/4.0*3+5, 60, 24) byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight) cornerRadii:CGSizeMake(12, 12)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor colorWithHexString:COLOR_THEME_STR].CGColor;
        layer.path = path.CGPath;
        _leftTagLayer = layer;
    }
    return _leftTagLayer;
}

- (CAShapeLayer *)rightTagLayer{
    if (!_rightTagLayer) {
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.bounds.size.width-60, self.bounds.size.height/4.0*3+5, 60, 24) byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft) cornerRadii:CGSizeMake(12, 12)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.fillColor = [UIColor colorWithHexString:COLOR_THEME_STR].CGColor;
        layer.path = path.CGPath;
        _rightTagLayer = layer;
    }
    return _rightTagLayer;
}


- (void)layoutSubviews{
    [super layoutSubviews];
//    [self.contentView.layer addSublayer:self.leftTagLayer];
//    [self.contentView.layer addSublayer:self.rightTagLayer];
}


@end
