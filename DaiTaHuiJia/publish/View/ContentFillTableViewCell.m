//
//  ContentFillTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ContentFillTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import "UITableViewCell+BottomLine.h"
@interface ContentFillTableViewCell()<UITextFieldDelegate>

@end
@implementation ContentFillTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.centerY.offset(0);
        }];
        
        [self.contentView addSubview:self.indicateLabel];
        [_indicateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-16);
            make.centerY.offset(0);
        }];
        
        [self.contentView addSubview:self.textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-14);
            make.top.offset(0);
            make.bottom.offset(0);
            make.width.offset(200);
        }];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    switch (_fillStyle) {
        case ContentFillTableViewCellStyleInput:
            self.textField.hidden = false;
            break;
    
        case ContentFillTableViewCellStylePick:
            self.textField.hidden = true;
            break;
    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x101110"];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)indicateLabel{
    if (!_indicateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor lightGrayColor];
        _indicateLabel = label;
    }
    return _indicateLabel;
}

- (UITextField *)textField{
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.backgroundColor = [UIColor clearColor];
        [textField addTarget:self action:@selector(textFieldDidChanged) forControlEvents:UIControlEventEditingChanged];
        textField.textAlignment = NSTextAlignmentRight;
        textField.textColor = [UIColor colorWithHexString:@"0x373937"];
        textField.font = [UIFont systemFontOfSize:14];
        textField.delegate = self;
        _textField = textField;
    }
    return _textField;
}

- (void)textFieldDidChanged{
    NSLog(@"%@",_textField.text);
    if ([_textField.text isEqualToString:@""]) {
        if (_indicateLabel.hidden) {
            _indicateLabel.hidden = false;
        }
    } else {
        if (!_indicateLabel.hidden) {
            _indicateLabel.hidden = true;
        }
    }
}

- (void)setDescribeText:(NSString *)describeText{
    if ([describeText isEqualToString:@""]) {
        _indicateLabel.textColor =  [UIColor colorWithHexString:@"0x373937"];
        _indicateLabel.text = @"请选择";
    } else {
        _indicateLabel.textColor = [UIColor colorWithHexString:@"0x101110"];
        _indicateLabel.text = describeText;
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (_inputFinshed) {
        _inputFinshed(textField.text);
    }
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self drawBottomLineWithGap:12];
}

@end
