//
//  BYStarButton.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/29.
//

#import "BYStarButton.h"
@interface BYStarButton()
@property (nonatomic,strong) UIView *fillView;
@property (nonatomic,strong) CALayer *maskLayer;
@end

@implementation BYStarButton

- (instancetype)init{
    if (self = [super init]){
        [self addSubview:self.fillView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _fillView.frame = CGRectMake(0, 0, self.bounds.size.width*_score, self.bounds.size.height);
    self.backgroundColor = _normalColor;
    _fillView.backgroundColor = _focusColor;
    
    self.maskLayer.contents = (__bridge id)_maskImage.CGImage;
    _maskLayer.frame = self.bounds;
    self.layer.mask = _maskLayer;
}

- (void)setScore:(CGFloat)score{
    _score = score;
    _fillView.frame = CGRectMake(0, 0, self.bounds.size.width*_score, self.bounds.size.height);
}

- (UIView *)fillView{
    if (!_fillView) {
        _fillView = [[UIView alloc] init];
        _fillView.userInteractionEnabled = false;
    }
    return _fillView;
}

- (CALayer *)maskLayer{
    if (!_maskLayer) {
        _maskLayer = [CALayer layer];
    }
    return _maskLayer;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}


@end
