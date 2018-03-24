//
//  MainTabBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MainTabBar.h"
#import <Masonry/Masonry.h>
static const CGFloat pulishViewWidth = 40;
static const CGFloat contentViewWidth = 50;

@interface MainTabBar()
@property (nonatomic,strong) UIView *tabBarShadowLayerView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIView *publishView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *publishBtn;
@end

@implementation MainTabBar

- (void)setPublishBar{
    NSLog(@"子类被调用了");
    [self addSubview:self.tabBarShadowLayerView];
    [_tabBarShadowLayerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    
    [self addSubview:self.contentView];
    [self addSubview:self.titleLabel];
}

- (UIView *)tabBarShadowLayerView{
    if (!_tabBarShadowLayerView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _tabBarShadowLayerView = view;
    }
    return _tabBarShadowLayerView;
}


- (UIView *)contentView{
    if (!_contentView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentViewWidth, contentViewWidth)];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.cornerRadius = contentViewWidth/2;
        _contentView = view;
    }
    return _contentView;
}

- (UIView *)publishView{
    if (!_publishView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, pulishViewWidth, pulishViewWidth)];
        view.backgroundColor = COLOR_THEME;
        view.layer.cornerRadius = pulishViewWidth/2;
        _publishView = view;
    }
    return _publishView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
        label.text = @"发布";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin = CGPointMake(self.center.x-20, 32);
    self.titleLabel.frame = titleFrame;
    
    CGRect contentFrame = self.contentView.frame;
    contentFrame.origin = CGPointMake(self.center.x-contentViewWidth/2, -18);
    self.contentView.frame = contentFrame;
    
    [self addSubview:self.publishView];
    self.publishView.center = self.contentView.center;
    
    [self.publishView addSubview:self.publishBtn];
    [_publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.center.offset(0);
    }];

    self.contentView.layer.shadowPath = [self publishViewShadowPathWithShadowRadiu:25].CGPath;
    self.contentView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.contentView.layer.shadowOpacity = 0.4;
    self.contentView.layer.shadowOffset = CGSizeMake(0, -1);
    self.contentView.layer.shadowRadius = 1;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
        self.subviews[0].subviews[0].hidden = YES;
    }
    self.tabBarShadowLayerView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBarShadowLayerView.layer.shadowOffset = CGSizeMake(0, -1);
    self.tabBarShadowLayerView.layer.shadowRadius = 1;
    self.tabBarShadowLayerView.layer.shadowOpacity = 0.4;
}

- (UIBezierPath *)publishViewShadowPathWithShadowRadiu:(CGFloat)shadowRadiu{
    UIBezierPath *shadowPath = [UIBezierPath bezierPath];
    [shadowPath moveToPoint:CGPointMake(1, shadowRadiu-7)];
    [shadowPath addArcWithCenter:CGPointMake(shadowRadiu, shadowRadiu) radius:shadowRadiu startAngle:(1+0.083)*M_PI endAngle:(2-0.083)*M_PI clockwise:true];
    
    return shadowPath;
}

- (UIButton *)publishBtn{
    if (!_publishBtn) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
        _publishBtn = button;
    }
    return _publishBtn;
}

- (void)publishAction{
    if (self.publishDelegate && [self.publishDelegate respondsToSelector:@selector(didTouchPublishView)]) {
        [self.publishDelegate didTouchPublishView];
    }
}

@end
