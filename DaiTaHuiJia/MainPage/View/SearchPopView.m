//
//  SearchPopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/23.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "SearchPopView.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import "BYTagsView.h"
#import "SearchCollectionHeaderView.h"
#import "BYTagCollectionViewCell.h"
@interface SearchPopView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) BYTagsView *tagsView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSArray < NSArray <BYTag *> *> *tags;
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) UIButton *exitSearchButton;
@end


@implementation SearchPopView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeTag];
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(60, 0, 0, 0));
        }];
        
        _contentView.transform = CGAffineTransformMakeScale(0.8, 0.9);
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
                weakSelf.exitSearchButton.alpha = 1;
            } else {
                weakSelf.contentView.alpha = 0;
                weakSelf.exitSearchButton.alpha = 0;
            }
        }];
        
        [_contentView addSubview:self.collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_contentView);
        }];
        
        [self addSubview:self.searchTextField];
        self.searchTextField.text = @"搜索";
        self.searchTextField.frame = CGRectMake(10, 25, screenW - 60, 30);
        
        [self addSubview:self.exitSearchButton];
        _exitSearchButton.frame = CGRectMake(screenW - 40, 25, 30, 30);
    }
    return self;
}

- (UIView *)contentView{
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
//        view.layer.shadowColor = [UIColor darkGrayColor].CGColor;
//        view.layer.shadowOffset = CGSizeMake(0, 0);
//        view.layer.shadowRadius = 5;
//        view.layer.shadowOpacity = 0.5;
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

- (UITextField *)searchTextField{
    if (!_searchTextField) {
        _searchTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _searchTextField.textColor = [UIColor darkGrayColor];
        _searchTextField.font = [UIFont systemFontOfSize:13];
        _searchTextField.layer.cornerRadius = 6;
        _searchTextField.backgroundColor = [UIColor colorWithHexString:@"0xEDEEEF"];
        _searchTextField.leftViewMode = UITextFieldViewModeAlways;
//        _searchTextField.keyboardType = UIKeyboardTypeWebSearch;
//        _searchTextField.keyboardAppearance =
        _searchTextField.returnKeyType = UIReturnKeySearch;
        [_searchTextField becomeFirstResponder];
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        _searchTextField.leftView = leftView;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 7, 16, 16)];
        imageView.image = [UIImage imageNamed:@"搜索"];
        [_searchTextField addSubview:imageView];
    }
    return _searchTextField;
}

- (UIButton *)exitSearchButton{
    if (!_exitSearchButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"返回" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(exitSearchAction) forControlEvents:UIControlEventTouchUpInside];
        _exitSearchButton = button;
    }
    return _exitSearchButton;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        BYCollectionViewFlowLayout *layout = [[BYCollectionViewFlowLayout alloc] init];
        layout = [[BYCollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.minimumLineSpacing = 10.0f;
        layout.minimumInteritemSpacing = 10.0f;
        layout.sectionInset = UIEdgeInsetsMake(10.0f, 18.0f, 10.0f, 18.0f);
        layout.itemSize = CGSizeMake(100, 30);
        layout.tagFont = [UIFont systemFontOfSize:13];
        layout.verticalFreeSpecs = 40;
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
//        collectionView.contentSize = CGSizeMake(screenW, screenH*2);
        [collectionView registerClass:[BYTagCollectionViewCell class] forCellWithReuseIdentifier:@"BYTagCellId"];
        [collectionView registerClass:[SearchCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchCollectionHeaderViewId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (void)makeTag{
    BYTag *taga = [[BYTag alloc] init];
    taga.byTagId = @1;
    taga.byTagTitle = @"正男";
    taga.byTagisSeleted = false;
    
    BYTag *tagb = [[BYTag alloc] init];
    tagb.byTagId = @1;
    tagb.byTagTitle = @"宋珠喜";
    tagb.byTagisSeleted = false;
    
    BYTag *tagc = [[BYTag alloc] init];
    tagc.byTagId = @1;
    tagc.byTagTitle = @"腾讯会员";
    tagc.byTagisSeleted = false;
    
    BYTag *tagd = [[BYTag alloc] init];
    tagd.byTagId = @1;
    tagd.byTagTitle = @"百度网盘";
    tagd.byTagisSeleted = false;
    
    BYTag *tagd1 = [[BYTag alloc] init];
    tagd1.byTagId = @1;
    tagd1.byTagTitle = @"京东";
    tagd1.byTagisSeleted = false;
//    NSArray *hotTags = @[taga,tagb,tagc,tagd,tagd1];
    NSArray *hotTags = @[taga,tagb];
    
    BYTag *tage = [[BYTag alloc] init];
    tage.byTagId = @1;
    tage.byTagTitle = @"智力障碍";
    tage.byTagisSeleted = false;
    
    BYTag *tagf = [[BYTag alloc] init];
    tagf.byTagId = @1;
    tagf.byTagTitle = @"脸部胎记";
    tagf.byTagisSeleted = false;
    
    BYTag *tagg = [[BYTag alloc] init];
    tagg.byTagId = @1;
    tagg.byTagTitle = @"轻微身体残疾";
    tagg.byTagisSeleted = false;
    
    BYTag *tagh = [[BYTag alloc] init];
    tagh.byTagId = @1;
    tagh.byTagTitle = @"短头发";
    tagh.byTagisSeleted = false;
    
    BYTag *tagi = [[BYTag alloc] init];
    tagi.byTagId = @1;
    tagi.byTagTitle = @"失明";
    tagi.byTagisSeleted = false;
    
    BYTag *tagj = [[BYTag alloc] init];
    tagj.byTagId = @1;
    tagj.byTagTitle = @"智力正常";
    tagj.byTagisSeleted = false;
    NSArray *recentTags = @[tage,tagf,tagg,tagh,tagi,tagj];
    _tags = @[hotTags,recentTags];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tags[section].count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BYTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYTagCellId" forIndexPath:indexPath];
    cell.titleLabel.text = _tags[indexPath.section][indexPath.item].tagTitle;
    BYCollectionViewFlowLayout *layout = (BYCollectionViewFlowLayout *)(collectionView.collectionViewLayout);
    cell.titleLabel.font = layout.tagFont;
    [cell setBackColor:[UIColor colorWithHexString:@"0xEEEEEE"] forStyle:(BYTagStyleNormal)];
    [cell setBackColor:[UIColor colorWithHexString:COLOR_THEME_STR] forStyle:(BYTagStyleFocus)];
    [cell setTitleColor:[UIColor darkGrayColor] forStyle:BYTagStyleNormal];
    [cell setTitleColor:[UIColor whiteColor] forStyle:BYTagStyleFocus];
//    if ([_selectedTags containsObject:_tags[indexPath.item]]){
//        cell.tagStyle = BYTagStyleFocus;
//    }else{
        cell.tagStyle = BYTagStyleNormal;
//    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    BYCollectionViewFlowLayout *layout = (BYCollectionViewFlowLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    CGRect titleLabelFrame = [_tags[indexPath.section][indexPath.item].tagTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: layout.tagFont}  context:nil];
    return CGSizeMake(titleLabelFrame.size.width + 30, layout.itemSize.height);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake([UIApplication sharedApplication].keyWindow.bounds.size.width, 50);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    SearchCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchCollectionHeaderViewId" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        header.titleLabel.text = @"热门搜索";
    } else {
        header.titleLabel.text = @"历史搜索";
    }
    return header;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self endEditing:true];
}

- (void)exitSearchAction{
    [self dismissPopView];
}

@end
