//
//  LostorHealthInfoViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorHealthInfoViewController.h"
#import "BaseInfoHeader.h"
#import <Masonry/Masonry.h>
#import "HealthInfoHeader.h"
#import "HealthTagTableViewCell.h"
#import "HealthTagViewModel.h"
#import "LostorLostInfoViewController.h"
@interface LostorHealthInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BaseInfoHeader *tableHeader;
@property (nonatomic,strong) HealthTagViewModel *viewModel;
@end

@implementation LostorHealthInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [HealthTagViewModel new];
    self.navTitle = @"完善信息（2/3）";
    [self.view bringSubviewToFront:self.by_navigationBar];
    [self.rigthButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.rigthButton setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
    self.rigthButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rigthButton addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [self.view bringSubviewToFront:self.by_navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor colorWithHexString:@"0xFEFFFE"];
        tableView.delegate = self;
        tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        [tableView registerClass:[HealthTagTableViewCell class] forCellReuseIdentifier:@"HealthTagTableViewCellId"];
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableHeader = [[BaseInfoHeader alloc] initWithFrame:CGRectMake(0, 0, screenW, 120)];
        [_tableHeader setTitle:@"关于他，\n智力身体心理的状态"];
        _tableHeader.imageView.hidden = true;
        _tableHeader.isShowBottomLine = true;
        tableView.tableHeaderView = _tableHeader;
        
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _viewModel.healthCategoryList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger itemRowCount = (_viewModel.healthCategoryList[indexPath.section].count + 3)/4;
    return (16 + 8*(itemRowCount-1) + 40*itemRowCount);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   HealthTagTableViewCell *cell = [[HealthTagTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"HealthTagTableViewCellId"];
    cell.tags = _viewModel.healthCategoryList[indexPath.section];
    if (indexPath.section == 2) {
        cell.showBottomLine = false;
    } else {
        cell.showBottomLine = true;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HealthInfoHeader *header = [[HealthInfoHeader alloc] initWithFrame:CGRectZero];
    if (section == 0) {
        header.titleLabel.text = @"智力状态";
        
    } else if (section == 1){
        header.titleLabel.text = @"身体状态";
        
    } else {
        header.titleLabel.text = @"心理状态";
        
    }
   
    return header;
}

- (void)nextStepAction{
    LostorLostInfoViewController *target = [[LostorLostInfoViewController alloc] init];
    [self.navigationController pushViewController:target animated:true];
}


@end
