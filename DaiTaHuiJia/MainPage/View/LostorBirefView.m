//
//  LostorBirefView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorBirefView.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@interface LostorBirefView()

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *firstLineLabel;
@property (nonatomic,strong) UILabel *secondLineLabel;
@property (nonatomic,strong) UILabel *thirdLineLabel;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIView *shadowLayerView;

@end

@implementation LostorBirefView

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithHexString:@"0xFF7A95"];
        [self addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.bottom.offset(-120);
        }];
        
        [self addSubview:self.firstLineLabel];
        [_firstLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_nameLabel.mas_bottom).offset(16);
            make.left.mas_equalTo(_nameLabel.mas_left);
        }];
        
        [self addSubview:self.secondLineLabel];
        [_secondLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_firstLineLabel.mas_bottom).offset(8);
            make.left.mas_equalTo(_nameLabel.mas_left);
        }];
        
        [self addSubview:self.thirdLineLabel];
        [_thirdLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_secondLineLabel.mas_bottom).offset(8);
            make.left.mas_equalTo(_nameLabel.mas_left);
        }];
        
        [self addSubview:self.shadowLayerView];
        [_shadowLayerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.right.offset(-16);
            make.size.mas_equalTo(CGSizeMake(120, 160));
        }];
        
        [_shadowLayerView addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
            make.size.mas_equalTo(CGSizeMake(120, 160));
        }];
        
    }
    [self testData];
    return self;
}

- (void)testData{
    _nameLabel.text = @"林枚章";
    _imageView.image = [UIImage imageNamed:@"sunyizhen"];
    _firstLineLabel.text = @"男 / 13岁";
    _secondLineLabel.text = @"智力正常 / 无残疾";
    
    NSString *plainText = @"2017年12月27日在\n云南省淄川市南通县山口镇走失";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _thirdLineLabel.attributedText = attributeText;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:18];
        label.textColor = [UIColor whiteColor];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UILabel *)firstLineLabel {
    if (!_firstLineLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:0.7];
        _firstLineLabel = label;
    }
    return _firstLineLabel;
}

- (UILabel *)secondLineLabel {
    if (!_secondLineLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:0.7];
        _secondLineLabel = label;
    }
    return _secondLineLabel;
}

- (UILabel *)thirdLineLabel {
    if (!_thirdLineLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:0.7];
        label.numberOfLines = 0;
        _thirdLineLabel = label;
    }
    return _thirdLineLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView =  [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 5;
        imageView.clipsToBounds = true;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = true;
        _imageView = imageView;
    }
    return _imageView;
}

- (UIView *)shadowLayerView{
    if (!_shadowLayerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 120, 160) cornerRadius:5];
        CAShapeLayer *shadowLayer = [CAShapeLayer layer];
        shadowLayer.shadowPath = path.CGPath;
        shadowLayer.shadowColor = [UIColor darkGrayColor].CGColor;
        shadowLayer.shadowOffset = CGSizeMake(0, 0);
        shadowLayer.shadowRadius = 4;
        shadowLayer.shadowOpacity = 0.6;
        [view.layer addSublayer:shadowLayer];
        _shadowLayerView = view;
    }
    return _shadowLayerView;
}


@end
