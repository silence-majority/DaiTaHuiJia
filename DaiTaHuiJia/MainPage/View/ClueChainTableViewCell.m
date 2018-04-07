//
//  ClueChainTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ClueChainTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"

@interface ClueChainTableViewCell()
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *providerLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UIImageView *chainImageView;
@property (nonatomic,strong) CAShapeLayer *topLineLayer;
@property (nonatomic,strong) CAShapeLayer *bottomLineLayer;
@end

@implementation ClueChainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(12);
            make.left.offset(20);
        }];
        
        [self.contentView addSubview:self.timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_dateLabel.mas_bottom).offset(2);
            make.right.mas_equalTo(_dateLabel.mas_right);
        }];
        
        [self.contentView addSubview:self.providerLabel];
        [_providerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_dateLabel);
            make.left.offset(120);
        }];
        
        [self.contentView addSubview:self.describeLabel];
        [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_providerLabel.mas_left);
            make.top.mas_equalTo(_providerLabel.mas_bottom).offset(8);
            make.bottom.offset(-12);
        }];
        
        [self.contentView addSubview:self.chainImageView];
        [_chainImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_dateLabel);
            make.left.mas_equalTo(_dateLabel.mas_right).offset(12);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
    }
    [self testData];
    return self;
}

- (void)testData{
    _dateLabel.text = @"2017/09/19";
    _timeLabel.text = @"19:28";
    _providerLabel.text = @"爱心志愿者";
    _describeLabel.text = @"在云南省紫阳市长安区留下镇发现孩子";
    _chainImageView.image = [UIImage imageNamed:@"up_dark"];
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHexString:@"0x787878"];
        _dateLabel = label;
    }
    return _dateLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor colorWithHexString:@"0x787878"];
        _timeLabel = label;
    }
    return _timeLabel;
}

- (UILabel *)providerLabel{
    if (!_providerLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithHexString:@"0x008CF2"];
        _providerLabel = label;
    }
    return _providerLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor colorWithHexString:@"0x787878"];
        _describeLabel = label;
    }
    return _describeLabel;
}

- (UIImageView *)chainImageView{
    if (!_chainImageView) {
        UIImageView *imageView =  [[UIImageView alloc] init];
        _chainImageView = imageView;
    }
    return _chainImageView;
}

- (CAShapeLayer *)topLineLayer{
    if (!_topLineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.chainImageView.frame.origin.x+6, 0)];
        [path addLineToPoint:CGPointMake(self.chainImageView.frame.origin.x+6, self.chainImageView.frame.origin.y)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.lineWidth = 0.5;
        layer.strokeColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        _topLineLayer = layer;
    }
    return _topLineLayer;
}

- (CAShapeLayer *)bottomLineLayer{
    if (!_bottomLineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(self.chainImageView.frame.origin.x+6, self.chainImageView.frame.origin.y + self.chainImageView.bounds.size.height)];
        [path addLineToPoint:CGPointMake(self.chainImageView.frame.origin.x+6, self.contentView.bounds.size.height)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.lineWidth = 0.5;
        layer.strokeColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        _bottomLineLayer = layer;
    }
    return _bottomLineLayer;
}

- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (![self.contentView.layer.sublayers containsObject:self.topLineLayer]) {
        [self.contentView.layer addSublayer:self.topLineLayer];
        [self.contentView.layer addSublayer:self.bottomLineLayer];
    }
}

@end
