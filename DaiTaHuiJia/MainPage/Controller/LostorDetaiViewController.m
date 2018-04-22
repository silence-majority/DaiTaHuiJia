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
#import "CommentTableViewCell.h"
#import "ReportPopView.h"
#import "BYContentTableViewCell.h"

#import "LostorDetailViewModel.h"

extern CGFloat NavBarHeight;
@interface LostorDetaiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)LostorBirefView *lostorBriefView;
@property (nonatomic,strong)LostorDetailViewModel *viewModel;
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
    [self bindViewModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

- (void)bindViewModel{
    _viewModel = [[LostorDetailViewModel alloc] init];
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:false scrollPosition:(UITableViewScrollPositionNone)];
    [RACObserve(self.viewModel, isFocusTipSpread) subscribeNext:^(id x) {
        if (@available(iOS 11.0, *)) {
            [self.tableView performBatchUpdates:^{
                LostorFocusInfoTableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
                cell.isSperad = [x boolValue];
            } completion:^(BOOL finished) {
                [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:false scrollPosition:(UITableViewScrollPositionNone)];
            }];
        } else {
        }
    }];
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
        [tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"CommentTableViewCellId"];
        [tableView registerClass:[BYContentTableViewCell class] forCellReuseIdentifier:@"BYContentTableViewCellId"];
        _lostorBriefView = [[LostorBirefView alloc] initWithFrame:CGRectMake(0, 0, screenW, 180)];
        tableView.tableHeaderView = _lostorBriefView;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 5+1;
    } else {
        return 3+1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            LostorFocusInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LostorFocusInfoTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.viewModel = self.viewModel;
            return cell;
        } else {
            BYContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BYContentTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
            return cell;
        }
        
    } else if (indexPath.section == 1){
        MorePhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MorePhotoTableViewCellId" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleLabel.text = @"线索链";
            return cell;
        } else if (indexPath.row <= 5){
            ClueChainTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"ClueChainTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        } else {
            BottomOperateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BottomOperateTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleLabel.text = @"为他提供线索";
            return cell;
        }
    } else {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.titleLabel.text = @"留言板";
            return cell;
        } else {
            CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCellId" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:false scrollPosition:(UITableViewScrollPositionNone)];
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
