//
//  RegisteViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegisteViewController.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import "RegisteFlowViewController.h"
@interface RegisteViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UIButton *aggreeButton;
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation RegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:true];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:true];
    [self makeUI];
    [_timer fire];
}

- (void)viewDidDisappear:(BOOL)animated{
    [_timer invalidate];
    _timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)makeUI{
    [self.view addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    [_scrollView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(20);
    }];
    
    [_scrollView addSubview:self.subTitleLabel];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(10);
        make.left.offset(20);
    }];
    
    [_scrollView addSubview:self.describeLabel];
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.centerX.offset(0);
        make.top.mas_equalTo(_subTitleLabel.mas_bottom).offset(12);
        
    }];
    
    [_scrollView addSubview:self.aggreeButton];
    [_aggreeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.centerX.offset(0);
        make.top.mas_equalTo(_describeLabel.mas_bottom).offset(50);
        make.height.mas_equalTo(45);
    }];
    
    _titleLabel.text = @"注册";
    _subTitleLabel.text = @"注册前请耐心阅读";
     NSString *plainText = @"如果你是因为亲友走失来到本平台，本平台对你的不幸深表同情，希望本平台会对你有所帮助。也恳请你在平台上保持警惕，不要因为寻亲心切而上当受骗。\n如果你是为了帮助走失人口找到家的好心人，本平台真诚的感谢你，你的好心一定会有好报！\n请不要在平台上发布一些虚假信息，本平台采用信用积分系统，失信者账号将会被平台停用，且保留相关证据必要时提供给公安机关！";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 5;
    paraStyle.paragraphSpacing = 8;
    paraStyle.firstLineHeadIndent = 0;
    [attributeText addAttribute:NSParagraphStyleAttributeName value:paraStyle range:NSMakeRange(0, plainText.length)];
    _describeLabel.attributedText = attributeText;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        scrollView.contentSize = CGSizeMake(screenW, screenH-64+1);
        scrollView.delegate = self;
        _scrollView = scrollView;
    }
    return _scrollView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:32];
        label.textColor = [UIColor blackColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor colorWithHexString:COLOR_THEME_STR];
        _subTitleLabel = label;
    }
    return _subTitleLabel;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor darkGrayColor];
        label.numberOfLines = 0;
        _describeLabel = label;
    }
    return _describeLabel;
}

- (UIButton *)aggreeButton{
    if (!_aggreeButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.7];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"同意并注册" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(registeAction) forControlEvents:UIControlEventTouchUpInside];
        _aggreeButton = button;
    }
    return _aggreeButton;
}

- (void)updateTime{
    static NSInteger second = 0;
    if (second <= 5) {
        NSString *title = [NSString stringWithFormat:@"同意并注册%lds",(5-second)];
        [self.aggreeButton setTitle:title forState:UIControlStateNormal];
        second++;
    } else {
        [_timer invalidate];
        _timer = nil;
        second = 0;
        [self.aggreeButton setTitle:@"同意并注册" forState:UIControlStateNormal];
        self.aggreeButton.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:1];
    }
}

- (void)registeAction{
    RegisteFlowViewController *target = [[RegisteFlowViewController alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:true];
}

@end
