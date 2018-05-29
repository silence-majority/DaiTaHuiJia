//
//  BYLimitTextView.m
//  jyxb_app
//
//  Created by xy_yanfa_imac on 2018/1/9.
//  Copyright © 2018年 xiaoyuxiaoyu. All rights reserved.
//

#import "BYLimitTextView.h"
#import <Masonry/Masonry.h>

@interface BYLimitTextView()<UITextViewDelegate>

@end

@implementation BYLimitTextView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self addSubview:self.textView];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 20, 0));
        }];
        
        [_textView addSubview:self.placeHolderLabel];
        [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(8);
            make.left.mas_equalTo(self.mas_left).offset(5);
            make.right.mas_equalTo(self.mas_right).offset(-5);
        }];
    }
    return self;
}

- (UITextView *)textView{
    if (!_textView){
        UITextView *textView = [[UITextView alloc] init];
        textView.font = [UIFont systemFontOfSize:14];
        textView.textColor = [UIColor darkGrayColor];
        textView.backgroundColor = [UIColor clearColor];
        textView.delegate = self;
        _textView = textView;
    }
    return _textView;
}

- (UILabel *)placeHolderLabel{
    if (!_placeHolderLabel){
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        _placeHolderLabel = label;
    }
    return _placeHolderLabel;
}

- (UILabel *)countLabel{
    if (!_countLabel){
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:10];
        label.textColor = [UIColor lightGrayColor];
        label.text = @"0/100";
        _countLabel = label;
    }
    return _countLabel;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if(_maxCount == 0){
        [_textView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }else{
        [self addSubview:self.countLabel];
        _countLabel.text = [NSString stringWithFormat:@"%ld/%ld",_textView.text.length,(long)_maxCount];
        [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-5);
            make.right.offset(-5);
        }];
    }
}

//- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
//    NSString *newText = [textView.text stringByReplacingCharactersInRange:range withString:text];
//    if ([newText stringContainsEmoji]) {
//        return NO;
//    }
//    return YES;
//}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self remvePlaceHolder];
    if (_delegate && [_delegate respondsToSelector:@selector(limitTextViewDidBeginEdit)]){
        [_delegate limitTextViewDidBeginEdit];
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    if (_maxCount == 0){
        if (_textChanged){
            _textChanged(_textView.text);
        }
        return;
    }
    NSString *language = textView.textInputMode.primaryLanguage;
    static NSInteger length = 0;
    if ([language isEqualToString:@"zh-Hans"]){
        UITextRange *markTextRange = textView.markedTextRange;
        if (!markTextRange){
            length = textView.text.length;
            if (length > _maxCount){
                textView.text = [textView.text substringToIndex:_maxCount];
            }
            _countLabel.text = [NSString stringWithFormat:@"%lu/%lu",(unsigned long)_textView.text.length,(unsigned long)_maxCount];
        }
    }else{
        length = textView.text.length;
        if (length > _maxCount){
            textView.text = [textView.text substringToIndex:_maxCount];
        }
        _countLabel.text = [NSString stringWithFormat:@"%lu/%lu",(unsigned long)_textView.text.length,(unsigned long)_maxCount];
    }
    if (_textChanged){
        _textChanged(_textView.text);
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (_delegate && [_delegate respondsToSelector:@selector(limitTextViewDidEndEdit)]){
        [_delegate limitTextViewDidEndEdit];
    }
}

- (void)remvePlaceHolder{
    if([_textView.subviews containsObject:_placeHolderLabel]){
        [_placeHolderLabel removeFromSuperview];
    }
}

- (void)addPlaceHoder{
    if(![_textView.subviews containsObject:_placeHolderLabel]){
        [_textView addSubview:self.placeHolderLabel];
        [_placeHolderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(8);
            make.left.mas_equalTo(self.mas_left).offset(5);
            make.right.mas_equalTo(self.mas_right).offset(-5);
        }];
    }
}

@end
