//
//  LoginViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LoginViewController.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "LoginViewModel.h"
#import "RegisteViewController.h"
@interface LoginViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) LoginViewModel *viewModel;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *describeLabel;
@property (nonatomic,strong) UIView *accoutContainer;
@property (nonatomic,strong) UIView *passwordContainer;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *forgetPasswordButton;
@property (nonatomic,strong) UIButton *registeButton;
@property (nonatomic,strong) UILabel *areaCodeLabel;
@property (nonatomic,strong) CAShapeLayer *accoutLineLayer;
@property (nonatomic,strong) UITextField *accountTextfield;
@property (nonatomic,strong) UITextField *passwordTextfield;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeUI];
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)bindViewModel{
    _viewModel = [[LoginViewModel alloc] init];
    [RACObserve(_viewModel, loginAvailable) subscribeNext:^(id x) {
        if ([x boolValue]) {
            _loginButton.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:1];
            _loginButton.enabled = true;
        } else {
            _loginButton.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.7];
            _loginButton.enabled = false;
        }
    }];
    
    RAC(_viewModel,loginAvailable) = [RACSignal combineLatest:@[RACObserve(_viewModel, accountAvailable),RACObserve(_viewModel, passwordAvailable)] reduce:^id(NSNumber *account, NSNumber *password){
        return @([account boolValue] && [password boolValue]);
    }];
    
    [_accountTextfield.rac_textSignal subscribeNext:^(NSString *text) {
        if (text.length >= 11) {
            
            self.viewModel.accountAvailable = true;
            self.accountTextfield.text = [text substringToIndex:11];
            self.viewModel.account = [text substringToIndex:11];
        } else {
            NSLog(@"%@", text);
            self.viewModel.accountAvailable = false;
        }
    }];
    
    [_passwordTextfield.rac_textSignal subscribeNext:^(NSString *text) {
        if (text.length >= 1) {
            self.viewModel.passwordAvailable = true;
            self.viewModel.password = text;
        } else {
            NSLog(@"%@", text);
            self.viewModel.passwordAvailable = false;
        }
    }];
    
    [[_registeButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        RegisteViewController *target = [[RegisteViewController alloc] init];
        [self.navigationController pushViewController:target animated:true];
    }];
}

- (void)makeUI{
    self.backType = BackTypeDismiss;
    [self.view addSubview:self.scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    [_scrollView addSubview:self.titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(10);
        make.left.offset(20);
    }];
    
    [_scrollView addSubview:self.describeLabel];
    [_describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_titleLabel);
        make.centerX.offset(0);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(12);
        
    }];
    
    [_scrollView addSubview:self.accoutContainer];
    [_accoutContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerX.offset(0);
        make.top.mas_equalTo(_describeLabel.mas_bottom).offset(26);
        make.height.mas_equalTo(45);
    }];
    
    [_accoutContainer addSubview:self.areaCodeLabel];
    [_areaCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.left.offset(0);
        make.top.offset(0);
        make.width.mas_equalTo(60);
    }];
    
    [_accoutContainer.layer addSublayer:self.accoutLineLayer];
    
    [_accoutContainer addSubview:self.accountTextfield];
    [_accountTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_areaCodeLabel.mas_right).offset(12);
        make.top.offset(0);
        make.bottom.offset(0);
        make.right.offset(0);
    }];
    
    [_scrollView addSubview:self.passwordContainer];
    [_passwordContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_accoutContainer.mas_left);
        make.centerX.offset(0);
        make.top.mas_equalTo(_accoutContainer.mas_bottom).offset(16);
        make.height.mas_equalTo(45);
    }];
    
    [_passwordContainer addSubview:self.passwordTextfield];
    [_passwordTextfield mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 15, 0, 0));
    }];
    
    [_scrollView addSubview:self.loginButton];
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_accoutContainer.mas_left);
        make.centerX.offset(0);
        make.top.mas_equalTo(_passwordContainer.mas_bottom).offset(24);
        make.height.mas_equalTo(45);
    }];
    
    [_scrollView addSubview:self.registeButton];
    [_registeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_accoutContainer.mas_left).offset(0);
        make.right.mas_equalTo(_scrollView.mas_centerX).offset(-8);
        make.top.mas_equalTo(_loginButton.mas_bottom).offset(40);
        make.height.mas_equalTo(45);
    }];
    
    [_scrollView addSubview:self.forgetPasswordButton];
    [_forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_scrollView.mas_centerX).offset(8);
        make.right.mas_equalTo(_describeLabel);
        make.top.mas_equalTo(_loginButton.mas_bottom).offset(40);
        make.height.mas_equalTo(45);
    }];
    _titleLabel.text = @"登录";
    _areaCodeLabel.text = @"+86";
    _accountTextfield.placeholder = @"请输入手机号";
    _passwordTextfield.placeholder = @"请输入密码";
    
      NSString *plainText = @"为了保证你和平台上的其他用户的信息及财产安全，部分功能需要登录之后才能使用。";
    NSMutableAttributedString *attributeText = [[NSMutableAttributedString alloc] initWithString:plainText];
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineSpacing = 5;
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

- (UIView *)accoutContainer{
    if (!_accoutContainer) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        _accoutContainer = view;
    }
    return _accoutContainer;
}

- (UILabel *)areaCodeLabel{
    if (!_areaCodeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithHexString:COLOR_THEME_STR];
        _areaCodeLabel = label;
    }
    return _areaCodeLabel;
}

- (UITextField *)accountTextfield{
    if (!_accountTextfield) {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.font = [UIFont systemFontOfSize:15];
        textfield.textColor = [UIColor blackColor];
        textfield.keyboardType = UIKeyboardTypeNumberPad;
        _accountTextfield = textfield;
    }
    return _accountTextfield;
}

- (UITextField *)passwordTextfield{
    if (!_passwordTextfield) {
        UITextField *textfield = [[UITextField alloc] init];
        textfield.font = [UIFont systemFontOfSize:15];
        textfield.textColor = [UIColor blackColor];
        textfield.keyboardType = UIKeyboardTypeDefault;
        textfield.secureTextEntry = true;
        _passwordTextfield = textfield;
    }
    return _passwordTextfield;
}

- (CAShapeLayer *)accoutLineLayer{
    if (!_accoutLineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(60, 8)];
        [path addLineToPoint:CGPointMake(60, 37)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        layer.lineWidth = 0.5;
        layer.strokeColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        _accoutLineLayer = layer;
    }
    return _accoutLineLayer;
}


- (UIView *)passwordContainer{
    if (!_passwordContainer) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        view.layer.cornerRadius = 8;
        view.layer.borderColor = [UIColor colorWithHexString:@"0xC8C8C8"].CGColor;
        view.layer.borderWidth = 0.6f;
        _passwordContainer = view;
    }
    return _passwordContainer;
}

- (UIButton *)loginButton{
    if (!_loginButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:0.7];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"登 录" forState:UIControlStateNormal];
        _loginButton = button;
    }
    return _loginButton;
}

- (UIButton *)registeButton{
    if (!_registeButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:1];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:@"没有账号？" forState:UIControlStateNormal];
        _registeButton = button;
    }
    return _registeButton;
}

- (UIButton *)forgetPasswordButton{
    if (!_forgetPasswordButton) {
        UIButton *button = [[UIButton alloc] init];
        button.layer.cornerRadius = 8;
        button.backgroundColor = [UIColor colorWithHexString:COLOR_THEME_STR alpha:1];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitle:@"忘记密码？" forState:UIControlStateNormal];
        _forgetPasswordButton = button;
    }
    return _forgetPasswordButton;
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:true];
}

@end
