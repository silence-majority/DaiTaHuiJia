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
@property (nonatomic,strong) UILabel *addLabel;
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
        view.backgroundColor = [UIColor colorWithRed:255/255.0 green:84/255.0 blue:114/255.0 alpha:1];
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
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor darkGrayColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)addLabel{
    if (!_addLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"+";
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:30];
        label.textColor = [UIColor whiteColor];
        _addLabel = label;
    }
    return _addLabel;
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
    
    [self.publishView addSubview:self.addLabel];
    [_addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_publishView.mas_centerX);
        make.centerY.equalTo(_publishView.mas_centerY).offset(-2);
    }];
//    self.addLabel.center = self.contentView.center;

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


@end
