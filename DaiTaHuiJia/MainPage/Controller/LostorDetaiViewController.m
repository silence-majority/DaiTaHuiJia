//
//  LostorDetaiViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorDetaiViewController.h"
#import "LostorBirefView.h"
#import <Masonry/Masonry.h>
extern CGFloat NavBarHeight;
@interface LostorDetaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)LostorBirefView *lostorBriefView;
@end

@implementation LostorDetaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
     [self.view bringSubviewToFront:self.by_navigationBar];
    self.by_navigationBar.backgroundColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:0];
    _tableView.backgroundColor = [UIColor colorWithHexString:@"0xFF7A95"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.contentInset = UIEdgeInsetsMake(64-20, 0, 40, 0);
        [tableView setContentOffset:CGPointMake(0, -(64-20))];
        if (@available(iOS 11.0, *)) {
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        
        _lostorBriefView = [[LostorBirefView alloc] initWithFrame:CGRectMake(0, 0, screenW, 180)];
        tableView.tableHeaderView = _lostorBriefView;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个cell",(long)indexPath.row];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y < -64) {
         self.by_navigationBar.backgroundColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:0];
    } else if (scrollView.contentOffset.y >= -64 && scrollView.contentOffset.y <= 0) {
        self.by_navigationBar.backgroundColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:1 - (-scrollView.contentOffset.y)/64.0];
    } else {
         self.by_navigationBar.backgroundColor = [UIColor colorWithHexString:@"0xFFFFFF" alpha:1];
    }
}


@end
