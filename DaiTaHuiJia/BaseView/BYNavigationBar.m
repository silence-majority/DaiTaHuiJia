//
//  BYNavigationBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYNavigationBar.h"

@interface BYNavigationBar()

@property (nonatomic,strong) UIButton *backButton;

@end

@implementation BYNavigationBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (UIButton *)UIButton{
    if (!_backButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"back_b"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _backButton = button;
    }
    return _backButton;
}

- (void)back{
    
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

@end
