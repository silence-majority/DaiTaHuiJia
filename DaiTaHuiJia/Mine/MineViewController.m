//
//  MineViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MineViewController.h"
#import "UserBriefTableViewCell.h"
#import <Masonry/Masonry.h>
#import "FunctionTableViewCell.h"
@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedRowHeight = 0;
        tableView.separatorInset = UIEdgeInsetsZero;
        [tableView registerClass:[UserBriefTableViewCell class] forCellReuseIdentifier:@"UserBriefTableViewCellId"];
        [tableView registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionTableViewCellId"];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if(section == 1) {
        return 3;
    }else if(section == 2){
        return 2;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        UserBriefTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserBriefTableViewCellId" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell cofigureWithImage:@"defaultPortrait" title:@"我要找到你" descirbe:@"点击查看个人主页"];
        return cell;
    }else if (indexPath.section == 1) {
        FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionTableViewCellId" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            [cell cofigureWithImage:@"发布" title:@"我发布的寻亲"];
        }else if (indexPath.row == 1) {
            [cell cofigureWithImage:@"发布2" title:@"我发布的寻家"];
        }else{
            [cell cofigureWithImage:@"编辑" title:@"我的登记"];
        }
        return cell;
    }else if (indexPath.section == 2) {
        FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionTableViewCellId" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0){
            [cell cofigureWithImage:@"收藏" title:@"我的关注"];
        }else{
            [cell cofigureWithImage:@"邮箱" title:@"消息通知"];
        }
        return cell;
    }else {
        FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionTableViewCellId" forIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell cofigureWithImage:@"图片列表" title:@"关于我们"];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

@end
