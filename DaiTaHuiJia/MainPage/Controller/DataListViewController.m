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
extern CGFloat NavBarHeight;
@interface DataListViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collecitonView;
@end

@implementation DataListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collecitonView];
    [_collecitonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UICollectionView *)collecitonView{
    if (!_collecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((screenW-30)/2.0, (screenW-30)/2.0/3.0*4); //宽高比 3:4
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 9.9f;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
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
    return 15;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCellId" forIndexPath:indexPath];
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
