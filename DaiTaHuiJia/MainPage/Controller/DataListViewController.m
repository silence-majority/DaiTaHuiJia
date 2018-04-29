//
//  DataListViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/1.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "DataListViewController.h"
#import <Masonry/Masonry.h>
#import "MainCollectionViewCell.h"
#import "LostorDetaiViewController.h"
#import "LostBriefModel.h"
extern CGFloat NavBarHeight;
@interface DataListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collecitonView;
@property (nonatomic,strong) NSArray <LostBriefModel *> *lists;
@end

@implementation DataListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testData];
    [self.view addSubview:self.collecitonView];
    [_collecitonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)testData{
    LostBriefModel *model = [LostBriefModel new];
    model.name = @"正男";
    model.address = @"云南省淄川市江口县临川镇";
    model.lostTime = 2;
    model.lostDistance = 135;
    model.imageName = @"ju-main";
    
    LostBriefModel *modelB = [LostBriefModel new];
    modelB.name = @"宋珠喜";
    modelB.address = @"吉林省延边市府山镇韩村";
    modelB.lostTime = 1;
    modelB.lostDistance = 200;
    modelB.imageName = @"sun-main";
    _lists = @[model,modelB];
//    LostBriefModel *modelC = [LostBriefModel new];
//    modelC.name = @"";
//    modelC.address = @"";
//    modelC.lostTime = 1;
//    modelC.lostDistance = 100;
//    modelC.imageName = @"";
//
//    LostBriefModel *modelD = [LostBriefModel new];
//    modelD.name = @"";
//    modelD.address = @"";
//    modelD.lostTime = 1;
//    modelD.lostDistance = 100;
//    modelD.imageName = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UICollectionView *)collecitonView{
    if (!_collecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((screenW-15)/2.0, (screenW-15)/2.0/3.0*4); //宽高比 3:4
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 4.9f;
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [collectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainCollectionViewCellId"];
        [collectionView setContentInset:UIEdgeInsetsMake(NavBarHeight-64, 0, 49, 0)];
        [collectionView setContentOffset:CGPointMake(0, -(NavBarHeight-64))];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _collecitonView = collectionView;
    }
    return _collecitonView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _lists.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCellId" forIndexPath:indexPath];
    [cell configureWithModel:_lists[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    LostorDetaiViewController *target = [[LostorDetaiViewController alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_navBar updateFrameWithOffset:-(NavBarHeight-64)-scrollView.contentOffset.y];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSLog(@"%@",NSStringFromCGPoint(velocity));
    NSLog(@"%@",NSStringFromCGPoint(*targetContentOffset));
    [_navBar updateFrameWithVelocity:velocity contentOffset:*targetContentOffset];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_navBar setBeginDragingOffsetY:(-(NavBarHeight-64)-scrollView.contentOffset.y)];
}


@end
