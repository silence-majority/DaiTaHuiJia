//
//  LostorBaseInfoViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorBaseInfoViewController.h"
#import "BaseInfoHeader.h"
#import <Masonry/Masonry.h>
#import "ContentFillTableViewCell.h"
#import "BaseInfoFooter.h"
#import "LostorHealthInfoViewController.h"
@interface LostorBaseInfoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BaseInfoHeader *tableHeader;
@property (nonatomic,strong) BaseInfoFooter *tableFooter;
@end

@implementation LostorBaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"完善信息（1/3）";
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [self.view bringSubviewToFront:self.by_navigationBar];
    [self.rigthButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.rigthButton setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
    self.rigthButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rigthButton addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextStepAction{
    LostorHealthInfoViewController *target = [[LostorHealthInfoViewController alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
        tableView.tableHeaderView = _tableHeader;
       
        
        _tableFooter = [[BaseInfoFooter alloc] initWithFrame:CGRectMake(0, 0, screenW, 120)];
        tableView.tableFooterView = _tableFooter;
        _tableView = tableView;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentFillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentFillTableViewCellId" forIndexPath:indexPath];
    if (indexPath.row == 0){
        cell.titleLabel.text = @"姓名";
        cell.indicateLabel.text = @"请填写";
    } else if (indexPath.row == 1){
        cell.titleLabel.text = @"性别";
        cell.indicateLabel.text = @"请选择";
    } else if (indexPath.row == 2){
        cell.titleLabel.text = @"出生日期";
        cell.indicateLabel.text = @"请选择";
    } else if (indexPath.row == 3){
        cell.titleLabel.text = @"身份证号";
        cell.indicateLabel.text = @"请填写";
    } else if (indexPath.row == 4){
        cell.titleLabel.text = @"区县";
        cell.indicateLabel.text = @"请选择";
    } else {
        cell.titleLabel.text = @"详细地址";
        cell.indicateLabel.text = @"请填写";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentFillTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell.textField becomeFirstResponder];
}


@end
