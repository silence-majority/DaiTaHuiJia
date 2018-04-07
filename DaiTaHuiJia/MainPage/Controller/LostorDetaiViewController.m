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
#import "LostorFocusInfoTableViewCell.h"
#import "MorePhotoTableViewCell.h"
#import "TitleTableViewCell.h"
#import "ClueChainTableViewCell.h"
#import "BottomOperateTableViewCell.h"
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
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableViewAutomaticDimension;
        [tableView registerClass:[LostorFocusInfoTableViewCell class] forCellReuseIdentifier:@"LostorFocusInfoTableViewCellId"];
        [tableView registerClass:[MorePhotoTableViewCell class] forCellReuseIdentifier:@"MorePhotoTableViewCellId"];
        [tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"TitleTableViewCellId"];
        [tableView registerClass:[ClueChainTableViewCell class] forCellReuseIdentifier:@"ClueChainTableViewCellId"];
         [tableView registerClass:[BottomOperateTableViewCell class] forCellReuseIdentifier:@"BottomOperateTableViewCellId"];
        _lostorBriefView = [[LostorBirefView alloc] initWithFrame:CGRectMake(0, 0, screenW, 180)];
        tableView.tableHeaderView = _lostorBriefView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3+5+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        LostorFocusInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LostorFocusInfoTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 1){
        MorePhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MorePhotoTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row == 2) {
        TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else if (indexPath.row < 8){
        ClueChainTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"ClueChainTableViewCellId" forIndexPath:indexPath];
        return cell;
    }else{
        BottomOperateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomOperateTableViewCellId" forIndexPath:indexPath];
        cell.titleLabel.text = @"为他提供线索";
        return cell;
    }
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
