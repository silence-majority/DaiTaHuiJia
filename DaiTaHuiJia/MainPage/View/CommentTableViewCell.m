//
//  CommentTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/14.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "CommentTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import "UITableViewCell+BottomLine.h"
#import "BYEvaluateStar.h"
#import "BYDialogBox.h"
#import "PraiseButton.h"
#import "ReportPopView.h"
#import "CommentModel.h"
@interface CommentTableViewCell()
@property (nonatomic,strong) UIImageView *portraitImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *creditTitleLabel;
@property (nonatomic,strong) UILabel *creditScoreLabel;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) PraiseButton *appriseBtn;
@property (nonatomic,strong) UILabel *appriseCountLabel;
@property (nonatomic,strong) UIButton *moreOperateBtn;
@property (nonatomic,strong) BYEvaluateStar *evaluateStar;
@property (nonatomic,strong) BYDialogBox *dialogBox;
@property (nonatomic,strong) NSDateFormatter *formatter;
@end

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.portraitImageView];
        [_portraitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(12);
            make.left.offset(20);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        [self.contentView addSubview:self.nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_portraitImageView.mas_top).offset(10);
            make.left.mas_equalTo(_portraitImageView.mas_right).offset(20);
        }];
        
        [self.contentView addSubview:self.creditTitleLabel];
        [_creditTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_nameLabel);
            make.top.mas_equalTo(_nameLabel.mas_bottom).offset(4);
            make.size.mas_equalTo(CGSizeMake(32, 16));
        }];
        
        [self.contentView addSubview:self.creditScoreLabel];
        [_creditScoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_creditTitleLabel);
            make.left.mas_equalTo(_creditTitleLabel.mas_right).offset(6);
        }];
        
        [self.contentView addSubview:self.contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_portraitImageView.mas_bottom).offset(12);
            make.left.mas_equalTo(_portraitImageView.mas_left);
            make.centerX.offset(0);
        }];
        
        [self.contentView addSubview:self.dateLabel];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_contentLabel.mas_bottom).offset(12);
            make.left.mas_equalTo(_portraitImageView.mas_left);
            make.bottom.offset(-16);
        }];
        
        [self.contentView addSubview:self.moreOperateBtn];
        [_moreOperateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_nameLabel);
            make.right.offset(-20);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [self.contentView addSubview:self.appriseBtn];
        [_appriseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_dateLabel.mas_centerY).offset(-2);;
            make.right.offset(-40);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
        
        [self.contentView addSubview:self.appriseCountLabel];
        [_appriseCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_dateLabel);
            make.left.mas_equalTo(_appriseBtn.mas_right).offset(-2);
        }];
        
        [self.contentView addSubview:self.evaluateStar];
        [_evaluateStar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(_creditTitleLabel);
            make.left.mas_equalTo(_creditScoreLabel.mas_right).offset(6);
            make.size.mas_equalTo(CGSizeMake(64, 10));
        }];
        
        [self.contentView addSubview:self.dialogBox];
        
    }
    [self testData];
    return self;
}

- (void)configureWithModel:(CommentModel *)model{
    _portraitImageView.image = [UIImage imageNamed:model.portrait];
    _nameLabel.text = model.name;
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:model.comment];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, model.comment.length)];
    _contentLabel.attributedText = attributeText;
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc] init];
        _formatter.dateFormat = @"YYYY/MM/dd HH:MM";
    }
    NSString *dateStr = [_formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:model.gmtDate.integerValue]];
    _dateLabel.text = dateStr;
    
    _appriseCountLabel.text = model.priseCount.stringValue;
    _creditTitleLabel.text = @"信用分";
    _evaluateStar.score = model.authScore.floatValue/100.0 * 5;
    _creditScoreLabel.text = model.authScore.stringValue;
    __weak typeof(self) weakSelf = self;
    [_dialogBox setTouchBlock:^{
        [weakSelf moreOperateAction];
        ReportPopView *popView = [[ReportPopView alloc] init];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            
        }];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
    }];

}

- (void)testData{
    _portraitImageView.image = [UIImage imageNamed:@"defaultPortrait"];
    _nameLabel.text = @"找孩子的母亲";
    NSString *plainText = @"家长加油，孩子最终一定会找到的，我为你祈祷，为你留意，愿你们早日团圆。一定会的，不要放弃，希望就不会消失，我也在找孩子，共勉！";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 8;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _contentLabel.attributedText = attributeText;
    _dateLabel.text = @"2017年 04-19 09:20";
    _appriseCountLabel.text = @"101";
    _creditTitleLabel.text = @"信用分";
    _evaluateStar.score = 3.8;
    _creditScoreLabel.text = @"70.0";
    __weak typeof(self) weakSelf = self;
    [_dialogBox setTouchBlock:^{
        [weakSelf moreOperateAction];
        ReportPopView *popView = [[ReportPopView alloc] init];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            
        }];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
    }];
}

- (UIImageView *)portraitImageView{
    if (!_portraitImageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.layer.cornerRadius = 4;
        imageView.layer.masksToBounds = true;
        _portraitImageView = imageView;
    }
    return _portraitImageView;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UILabel *)creditTitleLabel{
    if (!_creditTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = COLOR_THEME;
        label.layer.cornerRadius = 2;
        label.layer.borderWidth = 0.6;
        label.layer.borderColor = [UIColor colorWithHexString:@"0xFF847B"].CGColor;
        label.textAlignment = NSTextAlignmentCenter;
        _creditTitleLabel = label;
    }
    return _creditTitleLabel;
}

- (UILabel *)creditScoreLabel{
    if (!_creditScoreLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        _creditScoreLabel = label;
    }
    return _creditScoreLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x464646"];
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    return _contentLabel;
}

- (UILabel *)dateLabel{
    if (!_dateLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        _dateLabel = label;
    }
    return _dateLabel;
}

- (UIButton *)moreOperateBtn{
    if (!_moreOperateBtn) {
        UIButton *button = [[UIButton alloc] init];
        [button setImage:[UIImage imageNamed:@"省略号"] forState:UIControlStateNormal];
        [button setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        [button addTarget:self action:@selector(moreOperateAction) forControlEvents:UIControlEventTouchUpInside];
        _moreOperateBtn = button;
    }
    return _moreOperateBtn;
}

- (PraiseButton *)appriseBtn{
    if (!_appriseBtn) {
        PraiseButton *button = [[PraiseButton alloc] initWithFrame:CGRectZero];
        button.particleImage = [UIImage imageNamed:@"finish_Theme"];
        button.particleScale = 0.05f;
        button.particleScaleRange = 0.02f;
        [button setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"点赞-2"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setImageEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        _appriseBtn = button;
    }
    return _appriseBtn;
}

- (UILabel *)appriseCountLabel{
    if (!_appriseCountLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor lightGrayColor];
        _appriseCountLabel = label;
    }
    return _appriseCountLabel;
}

- (BYEvaluateStar *)evaluateStar{
    if (!_evaluateStar) {
        _evaluateStar = [[BYEvaluateStar alloc] initWithCountOfStar:5 originScore:5 maskImage:[UIImage imageNamed:@"star_dark"] normalColor:[UIColor colorWithHexString:@"0xCCCCCC"] focusColor:[UIColor colorWithHexString:COLOR_THEME_STR]];
        _evaluateStar.interSpace = 4;
        _evaluateStar.starSize = CGSizeMake(10, 10);
    }
    return _evaluateStar;
}

- (BYDialogBox *)dialogBox{
    if (!_dialogBox) {
        _dialogBox = [[BYDialogBox alloc] initWithFrame:CGRectMake(0, 0, 65, 45)];
        _dialogBox.ratio = 1;
        _dialogBox.themeAlpha = 0.8;
        _dialogBox.themeColor = [UIColor blackColor];
        _dialogBox.arrowMarkHeight = 5;
        _dialogBox.orientation = BYDialogBoxOrientationRight;
        _dialogBox.titleLabel.hidden = false;
        _dialogBox.titleLabel.text = @"举报";
        _dialogBox.hidden = true;
    }
    return _dialogBox;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    _dialogBox.jointPoint = CGPointMake(_moreOperateBtn.frame.origin.x+4, _moreOperateBtn.center.y);
}

- (void)moreOperateAction{
    if (_dialogBox.hidden) {
        _dialogBox.hidden = false;
        _dialogBox.alpha = 0;
        [UIView animateWithDuration:0.4 animations:^{
             _dialogBox.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            _dialogBox.alpha = 0;
        } completion:^(BOOL finished) {
            _dialogBox.hidden = !_dialogBox.hidden;
        }];
    }
}

- (void)praiseAction:(PraiseButton *)button {
    if (button.selected) {
        [button popInsideWithDuration:0.4f];
    }
    else {
        [button popOutsideWithDuration:0.5f];
        [button animate];
    }
    button.selected = !button.selected;
}

@end
