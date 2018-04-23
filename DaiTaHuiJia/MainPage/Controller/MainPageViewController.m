//
//  MainPageViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/25.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MainPageViewController.h"
#import "BYSearchSegmentNavgationBar.h"
#import "DataListViewController.h"
#import "SearchPopView.h"
#import <Masonry/Masonry.h>
CGFloat const NavBarHeight = 106;

@interface MainPageViewController ()<BYSegmentControlDelegate,UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic,strong) BYSearchSegmentNavgationBar *navigationBar;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) SearchPopView *popView;
@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NavBarHeight);
    _navigationBar.translucent = false;
    _navigationBar.segmentControl.delegate = self;
    _navigationBar.searchTextField.delegate = self;
    __weak typeof(self) weakSelf = self;
    [_navigationBar setEventBlock:^(BYSearchSegmentNavgationBarEvent event) {
        switch (event) {
            case BYSearchSegmentNavgationBarEventSort:
                
                break;
            case BYSearchSegmentNavgationBarEventExitSearch:
                weakSelf.navigationBar.by_searchSegmentBarStyle = BYSearchSegmentNavgationBarStyleNormal;
                [weakSelf.popView removeFromSuperview];
                break;
        }
    }];
    [self.view addSubview:_navigationBar];
    
    [self.view addSubview:self.scrollView];
    _scrollView.frame =  CGRectMake(0, 64, screenW, screenH-64);
    
    DataListViewController *a = [[DataListViewController alloc] init];
    [self addChildViewController:a];
    a.view.frame = CGRectMake(0, 0, screenW, _scrollView.frame.size.height);
    [self.scrollView addSubview:a.view];
    a.navBar = self.navigationBar;
    
    DataListViewController *b = [[DataListViewController alloc] init];
    [self addChildViewController:b];
    b.view.frame = CGRectMake(screenW, 0, screenW, _scrollView.frame.size.height);
    [self.scrollView addSubview:b.view];
    
    DataListViewController *c = [[DataListViewController alloc] init];
    [self addChildViewController:c];
    c.view.frame = CGRectMake(screenW*2, 0, screenW, _scrollView.frame.size.height);
    [self.scrollView addSubview:c.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:true];
    if (self.navigationBar && !self.navigationBar.hidden) {
        [self.view bringSubviewToFront:self.navigationBar];
    }
}

- (BYSearchSegmentNavgationBar *)navigationBar{
    if (!_navigationBar) {
        _navigationBar = [[BYSearchSegmentNavgationBar alloc] initWithFrame:CGRectZero];
    }
    return _navigationBar;
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.contentSize = CGSizeMake(screenW*3,screenH-64);
        scrollView.pagingEnabled = true;
        scrollView.delegate = self;
        scrollView.backgroundColor = [UIColor clearColor];
        _scrollView = scrollView;
        
    }
    return _scrollView;
}

#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_navigationBar.segmentControl updateSegmentWithRatio:(scrollView.contentOffset.x/screenW)];
}

#pragma BYSegmentControlDelegate
- (void)didSelecteSegmentIndex:(NSInteger)index{
    [_scrollView setContentOffset:CGPointMake(screenW*index, _scrollView.contentOffset.y) animated:true];
}

#pragma UITextViewDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    _navigationBar.by_searchSegmentBarStyle = BYSearchSegmentNavgationBarStyleSearching;
    _popView = nil;
    if (!_popView) {
         _popView = [[SearchPopView alloc] initWithFrame:CGRectMake(0,0, screenW, screenH)];
        _popView.curtainView.backgroundColor = [UIColor whiteColor];
        _popView.curtainView.alpha = 1;
    }
    [[UIApplication sharedApplication].keyWindow addSubview:_popView];
}

@end
