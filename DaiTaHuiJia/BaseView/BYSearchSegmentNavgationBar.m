//
//  BYSearchSegmentNavgationBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/31.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYSearchSegmentNavgationBar.h"
#import "UIColor+UIColor_Hex.h"
@implementation BYSearchSegmentNavgationBar

- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        [self addSubview:self.searchTextField];
        self.searchTextField.text = @"  搜索";
        self.searchTextField.frame = CGRectMake(10, 25, 380, 30);
        self.segmentControl = [[BYSegmentControl alloc] initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, 40)segmentTitles:@[@"广场",@"寻人",@"寻家"]];
        self.segmentControl.horizontalMargin = 50;
        self.segmentControl.focusSegmentColor = COLOR_THEME;
        self.segmentControl.focusSegmentFont = [UIFont systemFontOfSize:14];
        self.segmentControl.normalSegmentFont = [UIFont systemFontOfSize:14];
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
    }
    return _searchTextField;
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
