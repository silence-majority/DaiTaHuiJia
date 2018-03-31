//
//  BYSegmentBadgeButton.m
//  BYSegmentController
//
//  Created by xy_yanfa_imac on 2017/12/27.
//

#import "BYSegmentBadgeButton.h"

@interface BYSegmentBadgeButton()
@property (nonatomic,strong) UILabel *badgeLabel;
@end

@implementation BYSegmentBadgeButton
- (instancetype) init{
    if (self = [super init]){
        [self addSubview:self.badgeLabel];
    }
    return self;
}

- (UILabel *)badgeLabel{
    if(!_badgeLabel){
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 0, 18, 18);
        label.textAlignment = NSTextAlignmentCenter;
        label.clipsToBounds = true;
        label.layer.cornerRadius = 9;
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor redColor];
        label.hidden = true;
        _badgeLabel = label;
    }
    return _badgeLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _badgeLabel.center = CGPointMake(self.frame.size.width, 5);
    [self bringSubviewToFront:_badgeLabel];
}

- (void)setBadgeNumber:(NSInteger)badgeNumber{
    _badgeNumber = badgeNumber;
    if(_badgeNumber > 0){
        _badgeLabel.hidden = false;
        _badgeLabel.text = _badgeNumber > 99 ? @"99" : [NSString stringWithFormat:@"%ld",(long)_badgeNumber];
    }else{
        _badgeLabel.hidden = true;
    }
}

- (void)setStyle:(BYSegmentBadgeButtonStyle)style{
    _style = style;
    switch (_style) {
        case BYSegmentBadgeButtonStyleNormal:
            [self setTitleColor:_normalTitleColor forState:UIControlStateNormal];
            self.titleLabel.font = _normalTitleFont;
            break;
        case BYSegmentBadgeButtonStyleFocus:
            [self setTitleColor:_focusTitleColor forState:UIControlStateNormal];
            self.titleLabel.font = _focusTitleFont;
            break;
    }
}
@end
