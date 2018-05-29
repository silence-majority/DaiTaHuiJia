//
//  BaseInfoFooter.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BaseInfoFooter.h"
#import "BYLimitTextView.h"
#import <Masonry/Masonry.h>

@interface BaseInfoFooter()<BYLimitTextViewDelegate>
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)BYLimitTextView *textView;
@end

@implementation BaseInfoFooter

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.top.offset(20);
        }];
        
        [self addSubview:self.textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.centerX.offset(0);
            make.top.mas_equalTo(_titleLabel.mas_bottom).offset(20);
            make.bottom.offset(0);
        }];
    }
    _titleLabel.text = @"详细地址";
    _textView.placeHolderLabel.text = @"请输入详细地址";
    return self;
}

- (void)setTitle:(NSString *)title placeHolder:(NSString *)holder{
    _titleLabel.text = title;
    _textView.placeHolderLabel.text = holder;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x3B383C"];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (BYLimitTextView *)textView{
    if (!_textView) {
        BYLimitTextView *textView = [[BYLimitTextView alloc] init];
        textView.maxCount = 0;
        textView.delegate = self;
        textView.backgroundColor = [UIColor colorWithHexString:@"0xF5F8F9"];
        _textView = textView;
    }
    return _textView;
}

- (void)limitTextViewDidEndEdit{
    if (_inputFinished) {
        _inputFinished(_textView.textView.text);
    }
}

@end
