//
//  BYSearchSegmentNavgationBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/31.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYSearchSegmentNavgationBar.h"
#import "UIColor+UIColor_Hex.h"
extern CGFloat const NavBarHeight;

@interface BYSearchSegmentNavgationBar()

@property (nonatomic,assign) BOOL animationExecuting;
@property (nonatomic,assign) BOOL isDownDrag;

@end

@implementation BYSearchSegmentNavgationBar

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        [self addSubview:self.searchTextField];
        self.searchTextField.text = @"搜索";
        self.searchTextField.frame = CGRectMake(10, 25, screenW - 60, 30);
        
        [self addSubview:self.sortButton];
        _sortButton.frame = CGRectMake(screenW - 40, 25, 30, 30);
        [_sortButton addTarget:self action:@selector(sortAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:self.exitSearchButton];
        _exitSearchButton.frame = CGRectMake(screenW - 40, 25, 30, 30);
        _exitSearchButton.hidden = true;
        [_exitSearchButton addTarget:self action:@selector(exitSearchAction) forControlEvents:UIControlEventTouchUpInside];
        self.segmentControl = [[BYSegmentControl alloc] initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 40)segmentTitles:@[@"广场",@"寻人",@"寻家"]];
        self.segmentControl.horizontalMargin = 50;
        self.segmentControl.focusSegmentColor = COLOR_THEME;
        self.segmentControl.focusSegmentFont = [UIFont boldSystemFontOfSize:14];
        self.segmentControl.normalSegmentFont = [UIFont boldSystemFontOfSize:14];
        self.segmentControl.sliderSize = CGSizeMake(30, 2);
        [self addSubview:self.segmentControl];
        
    }
    return self;
}

- (UITextField *)searchTextField{
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _searchTextField.textColor = [UIColor darkGrayColor];
        _searchTextField.font = [UIFont systemFontOfSize:13];
        _searchTextField.layer.cornerRadius = 6;
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"0xEDEEEF"];
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _searchTextField.leftView = leftView;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 7, 16, 16)];
        imageView.image = [UIImage imageNamed:@"搜索"];
        [_searchTextField addSubview:imageView];
    }
    return _searchTextField;
}

- (UIButton *)sortButton{
    if (!_sortButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"筛选"] forState:UIControlStateNormal];
        _sortButton = button;
    }
    return _sortButton;
}

- (UIButton *)exitSearchButton{
    if (!_exitSearchButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _exitSearchButton = button;
    }
    return _exitSearchButton;
}

- (void)updateFrameWithOffset:(CGFloat)offset{
    static CGFloat previousOffset = 0;
    if (_animationExecuting) {
        previousOffset = offset;
        return;
    }
    //往上移动
    if (offset < previousOffset) {
        self.isDownDrag = false;
        if(self.frame.origin.y == -(NavBarHeight-64)){
            previousOffset = offset;
            return;
        }else{
            CGFloat topOffset = _beginDragingOffsetY;
            CGFloat bottomOffset = _beginDragingOffsetY-(NavBarHeight-64);
            if (offset <= topOffset && offset > bottomOffset) {
                CGRect frame = self.frame;
                frame.origin.y = offset-_beginDragingOffsetY;
                self.frame = frame;
                self.searchTextField.alpha = 1 - -(offset-_beginDragingOffsetY)/(NavBarHeight-64);
                self.sortButton.alpha = 1 - -(offset-_beginDragingOffsetY)/(NavBarHeight-64);
                return;
            }
        }
    }else{
        self.isDownDrag = true;
        if(self.frame.origin.y == 0){
            previousOffset = offset;
            return;
        }
    }
    if (offset >= -(NavBarHeight-64) && offset <= 0) {
        CGRect frame = self.frame;
        frame.origin.y = offset;
        self.frame = frame;
        self.searchTextField.alpha = 1 - (-offset)/(NavBarHeight-64);
        self.sortButton.alpha = 1 - (-offset)/(NavBarHeight-64);
    }
    previousOffset = offset;
}

- (void)updateFrameWithVelocity:(CGPoint)velocity contentOffset:(CGPoint)contentOffset{
    if (velocity.y < 0) {
        [UIView animateWithDuration:(0.1) animations:^{
            self.animationExecuting = true;
            CGRect frame = self.frame;
            frame.origin.y = 0;
            self.frame = frame;
            self.searchTextField.alpha = 1;
            self.sortButton.alpha = 1;
        } completion:^(BOOL finished) {
            self.animationExecuting = false;
        }];
    }
    if (velocity.y > 0){
        [UIView animateWithDuration:0.1 animations:^{
            self.animationExecuting = true;
            CGRect frame = self.frame;
            frame.origin.y = -(NavBarHeight-64);
            self.frame = frame;
            self.searchTextField.alpha = 0;
            self.sortButton.alpha = 0;
        } completion:^(BOOL finished) {
            self.animationExecuting = false;
        }];
    }
    if (velocity.y == 0) {
        if (_isDownDrag) {
            if (self.frame.origin.y != 0 && contentOffset.y <= 0) {
                [UIView animateWithDuration:(0.1) animations:^{
                    self.animationExecuting = true;
                    CGRect frame = self.frame;
                    frame.origin.y = 0;
                    self.frame = frame;
                    self.searchTextField.alpha = 1;
                    self.sortButton.alpha = 1;
                } completion:^(BOOL finished) {
                    self.animationExecuting = false;
                }];
            }
        }else{
            if (self.frame.origin.y != -(NavBarHeight-64)){
                [UIView animateWithDuration:0.1 animations:^{
                    self.animationExecuting = true;
                    CGRect frame = self.frame;
                    frame.origin.y = -(NavBarHeight-64);
                    self.frame = frame;
                    self.searchTextField.alpha = 0;
                    self.sortButton.alpha = 1;
                } completion:^(BOOL finished) {
                    self.animationExecuting = false;
                }];
            }
        }
    }
}

- (void)setBy_searchSegmentBarStyle:(BYSearchSegmentNavgationBarStyle)by_searchSegmentBarStyle{
    if (_by_searchSegmentBarStyle != by_searchSegmentBarStyle) {
        switch (by_searchSegmentBarStyle) {
            case BYSearchSegmentNavgationBarStyleNormal:{
                _exitSearchButton.hidden = true;
                _sortButton.hidden = false;
                [UIView animateWithDuration:0.4 animations:^{
                    _sortButton.alpha = 1;
                } completion:^(BOOL finished) {
                    _exitSearchButton.alpha = 0;
                }];
            }
                break;
            case BYSearchSegmentNavgationBarStyleSearching:{
                _exitSearchButton.hidden = false;
                _sortButton.hidden = true;
                [UIView animateWithDuration:0.4 animations:^{
                    _exitSearchButton.alpha = 1;
                } completion:^(BOOL finished) {
                    _sortButton.alpha = 0;
                }];
            }
                break;
        }
    }
    _by_searchSegmentBarStyle = by_searchSegmentBarStyle;
}

- (void)sortAction{
    if (_eventBlock) {
        _eventBlock(BYSearchSegmentNavgationBarEventSort);
    }
}

- (void)exitSearchAction{
    [_searchTextField resignFirstResponder];
    if (_eventBlock) {
        _eventBlock(BYSearchSegmentNavgationBarEventExitSearch);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 这里为了适配iOS11，需要遍历所有的子控件，并向下移动状态栏的高度
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;

    if (systemVersion >= 11.0) {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                CGRect frame = obj.frame;
                frame.size.height = self.frame.size.height;
                obj.frame = frame;
            }else {
//                CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
//                CGRect frame   = obj.frame;
//                frame.origin.y += statusBarFrame.size.height;
//                obj.frame      = frame;
            }
        }];
    }

    // 重新设置透明度，解决iOS11的bug
//    self.gk_navBarBackgroundAlpha = self.gk_navBarBackgroundAlpha;
}
/*
 - (void)setGk_navBarBackgroundAlpha:(CGFloat)gk_navBarBackgroundAlpha {
 _gk_navBarBackgroundAlpha = gk_navBarBackgroundAlpha;
 
 [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
 dispatch_async(dispatch_get_main_queue(), ^{
 obj.alpha = gk_navBarBackgroundAlpha;
 });
 }
 }];
 
 self.clipsToBounds = gk_navBarBackgroundAlpha == 0.0;
 }
 */

@end
