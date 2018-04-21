//
//  ReportPopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/20.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ReportPopView.h"
#import <Masonry/Masonry.h>
#import "BYCenterTitleTableViewCell.h"
@interface ReportPopView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *reasonList;
@end

@implementation ReportPopView

- (instancetype)init{
    if (self = [super init]) {
        _reasonList = @[@"涉嫌诈骗",@"人身攻击、恶意言论",@"违反法律法规",@"色情、淫秽或低俗内容"];
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.bottom.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(310);
        }];
        _contentView.transform = CGAffineTransformMakeTranslation(0, 310);
        
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
            } else {
                weakSelf.contentView.transform = CGAffineTransformMakeTranslation(0, 310);
            }
        }];
        
        [_contentView addSubview:self.tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.scrollEnabled = false;
        tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 15);
        if (@available(iOS 11.0, *)) {
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedRowHeight = 0;
        }
        [tableView registerClass:[BYCenterTitleTableViewCell class] forCellReuseIdentifier:@"cellId"];
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 1 ? _reasonList.count : 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return section == 1 ? 10 : 0.01f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BYCenterTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        cell.titleLabel.text = @"选择举报原因";
        cell.titleLabel.textColor = [UIColor darkGrayColor];
        cell.titleLabel.font = [UIFont systemFontOfSize:13];
    } else if (indexPath.section == 1) {
        cell.titleLabel.text = _reasonList[indexPath.row];
        cell.titleLabel.textColor = [UIColor blackColor];
    } else {
        cell.titleLabel.text = @"取消";
        cell.titleLabel.textColor = [UIColor redColor];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if (self.eventBlock) {
        self.eventBlock(10, nil);
    }
    [self dismissPopView];
}

@end
