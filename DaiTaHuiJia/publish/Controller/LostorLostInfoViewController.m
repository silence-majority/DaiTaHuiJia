//
//  LostorLostInfoViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorLostInfoViewController.h"
#import "BaseInfoHeader.h"
#import <Masonry/Masonry.h>
#import "ContentFillTableViewCell.h"
#import "BaseInfoFooter.h"
#import "DatePickerPopView.h"
#import "GenderPickerPopView.h"
#import "NSDictionary+ValueForKey.h"
#import "RegionPickerView.h"
#import "PublishManager.h"
@interface LostorLostInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BaseInfoHeader *tableHeader;
@property (nonatomic,strong) BaseInfoFooter *tableFooter;
@property (nonatomic,strong) LostInfoModel *lostInfo;
@end

@implementation LostorLostInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _lostInfo = [PublishManager sharedService].lostorModel.lostInfoModel;
    self.navTitle = @"完善信息（3/3）";
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [self.view bringSubviewToFront:self.by_navigationBar];
    [self.rigthButton setTitle:@"发布" forState:UIControlStateNormal];
    [self.rigthButton setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
    self.rigthButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rigthButton addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextStepAction{

}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor colorWithHexString:@"0xFEFFFE"];
        tableView.delegate = self;
        tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableViewAutomaticDimension;
        [tableView registerClass:[ContentFillTableViewCell class] forCellReuseIdentifier:@"ContentFillTableViewCellId"];
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableHeader = [[BaseInfoHeader alloc] initWithFrame:CGRectMake(0, 0, screenW, 120)];
        [_tableHeader setTitle:@"关于他，\n走失时的一些信息"];
        _tableHeader.imageView.hidden = true;
        tableView.tableHeaderView = _tableHeader;
        
        _tableFooter = [[BaseInfoFooter alloc] initWithFrame:CGRectMake(0, 0, screenW, 200)];
        [_tableFooter setTitle:@"其他描述" placeHolder:@"请输入有关他走失的额外信息，请不要在这里透漏个人信息，以免被不法分子利用"];
        __weak typeof(self) weakSelf = self;
        [_tableFooter setInputFinished:^(NSString *text) {
            weakSelf.lostInfo.describe = text;
        }];
        tableView.tableFooterView = _tableFooter;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentFillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentFillTableViewCellId" forIndexPath:indexPath];
    if (indexPath.row == 0){
        cell.titleLabel.text = @"走失日期";
        cell.fillStyle = ContentFillTableViewCellStylePick;
        if (self.lostInfo.lostDate) {
            cell.describeText = self.lostInfo.lostDate;
        } else {
            cell.indicateLabel.text = @"请选择";
        }
    } else if (indexPath.row == 1){
        cell.titleLabel.text = @"走失区县";
        cell.fillStyle = ContentFillTableViewCellStylePick;
        if (self.lostInfo.district) {
            cell.describeText = self.lostInfo.district;
        } else {
            cell.indicateLabel.text = @"请选择";
        }
    } else {
        cell.titleLabel.text = @"走失详细地址";
        cell.fillStyle = ContentFillTableViewCellStyleInput;
        if (self.lostInfo.address) {
            cell.describeText = self.lostInfo.address;
        } else {
            cell.indicateLabel.text = @"请输入";
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self) weakSelf = self;
    ContentFillTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.fillStyle == ContentFillTableViewCellStyleInput) {
        [cell.textField becomeFirstResponder];
    } else {
        [self.view endEditing:true];
    }
    
    if (indexPath.row == 0) {
        DatePickerPopView *popView = [[DatePickerPopView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            if (eventId == 1) {
                cell.describeText = [eventParamDic stringOrNilForKey:@"dateText"];
                weakSelf.lostInfo.lostDate = [eventParamDic stringOrNilForKey:@"dateText"];
            }
        }];
    }
    if (indexPath.row == 1) {
        RegionPickerView *popView = [[RegionPickerView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            if (eventId == 1) {
                cell.describeText = [eventParamDic stringOrNilForKey:@"regionName"];
                weakSelf.lostInfo.district = [eventParamDic stringOrNilForKey:@"regionName"];
            }
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
