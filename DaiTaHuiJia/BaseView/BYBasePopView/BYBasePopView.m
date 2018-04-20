//
//  BYBasePopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/20.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYBasePopView.h"

@interface BYBasePopView ()

@property (nonatomic,strong) UIView *curtainView;
@property (nonatomic,strong) UITapGestureRecognizer *gesture;

@end

@implementation BYBasePopView

- (instancetype)init{
    if (self = [super initWithFrame:[UIApplication sharedApplication].keyWindow.frame]) {
        [self addSubview:self.curtainView];
        [self.curtainView addGestureRecognizer:self.gesture];
        self.curtainAlpha = 0.6;
        self.animationDuration = 0.3;
        self.hiddenByTouchCurtain = true;
    }
    return self;
}

- (void)layoutSubviews{
    [UIView animateWithDuration:_animationDuration delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _curtainView.alpha = _curtainAlpha;
        if (_animationBlock) {
            _animationBlock(0);
        }
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - getter
- (UIView *)curtainView{
    if (!_curtainView) {
        _curtainView = [[UIView alloc] initWithFrame:self.frame];
        _curtainView.backgroundColor = [UIColor blackColor];
        _curtainView.alpha = 0;
    }
    return _curtainView;
}

- (UITapGestureRecognizer *)gesture{
    if (!_gesture) {
        _gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideViewAction)];
    }
    return _gesture;
}

#pragma mark - action
- (void)hideViewAction{
    if (_hiddenByTouchCurtain) {
        [self dismissPopView];
    }
}

#pragma mark - pulbilc
- (void)dismissPopView{
    //动画
    [UIView animateWithDuration:_animationDuration delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _curtainView.alpha = 0;
        if (_animationBlock) {
            _animationBlock(1);
        }
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    //事件
    if(_eventBlock){
        _eventBlock(0,nil);
    }
}


@end
