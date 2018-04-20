//
//  ReportPopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/20.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ReportPopView.h"
#import <Masonry/Masonry.h>
@interface ReportPopView ()
@property (nonatomic,strong) UIView *contentView;
@end

@implementation ReportPopView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.bottom.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(220);
        }];
        _contentView.transform = CGAffineTransformMakeTranslation(0, 220);
        
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
            } else {
                weakSelf.contentView.alpha = 0;
            }
        }];
    }
    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

@end
