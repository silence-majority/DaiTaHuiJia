//
//  BYTagCollectionViewCell.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import "BYTagCollectionViewCell.h"

@interface BYTagCollectionViewCell()
@property (nonatomic,strong) UIColor *normalBackColor;
@property (nonatomic,strong) UIColor *focusBackColor;
@property (nonatomic,strong) UIColor *normalTitleColor;
@property (nonatomic,strong) UIColor *focusTitleColor;
@end

@implementation BYTagCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (UILabel *)titleLabel{
    if (!_titleLabel){
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (void)setTagStyle:(BYTagStyle)tagStyle{
    _tagStyle = tagStyle;
    switch (_tagStyle) {
        case BYTagStyleNormal:
            self.backgroundColor = _normalBackColor;
            self.titleLabel.textColor = _normalTitleColor;
            break;
        case BYTagStyleFocus:
            self.backgroundColor = _focusBackColor;
            self.titleLabel.textColor = _focusTitleColor;
            break;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = self.bounds;
    self.clipsToBounds = true;
    self.layer.cornerRadius = self.bounds.size.height/2;
}

- (void)setTitleColor:(UIColor *)color forStyle:(BYTagStyle)style{
    switch (style) {
        case BYTagStyleNormal:
            _normalTitleColor = color;
            break;
        case BYTagStyleFocus:
            _focusTitleColor = color;
            break;
    }
}

- (void)setBackColor:(UIColor *)color forStyle:(BYTagStyle)style{
    switch (style) {
        case BYTagStyleNormal:
            _normalBackColor = color;
            break;
        case BYTagStyleFocus:
            _focusBackColor = color;
            break;
    }
}

@end
