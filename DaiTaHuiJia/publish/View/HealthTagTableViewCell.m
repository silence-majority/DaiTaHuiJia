//
//  HealthTagTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "HealthTagTableViewCell.h"
#import "HealthTagCell.h"
#import <Masonry/Masonry.h>
#import "UITableViewCell+BottomLine.h"
#import "HealthTagModel.h"
@interface HealthTagTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) NSMutableArray <HealthTagModel *> *selectedTags;
@end

@implementation HealthTagTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        _selectedTags = @[].mutableCopy;
    }
    return self;
}

- (void)setTags:(NSArray<HealthTagModel *> *)tags{
    _tags = tags;
    [_selectedTags addObject:_tags.firstObject];
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 8;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 16, 10);
        CGFloat width = (screenW-layout.sectionInset.left-layout.sectionInset.right-layout.minimumInteritemSpacing*4)/4.0-1;
        layout.itemSize = CGSizeMake(width, 40);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[HealthTagCell class] forCellWithReuseIdentifier:@"HealthTagCellId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tags.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HealthTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HealthTagCellId" forIndexPath:indexPath];
    cell.titleLabel.text = _tags[indexPath.item].title;
    if ([_selectedTags containsObject:_tags[indexPath.item]]) {
        cell.isSelected = true;
    } else {
        cell.isSelected = false;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    HealthTagModel *selectedModel = _tags[indexPath.item];
    if ([_selectedTags containsObject:selectedModel]) {
        if (_selectedTags.count > 1) {
            [_selectedTags removeObject:selectedModel];
            [_collectionView reloadData];
            return;
        } else {
            return;
        }
    }
    
    if (selectedModel.isExclusive) {
        [_selectedTags removeAllObjects];
    }
    
    for (HealthTagModel *model in _selectedTags) {
        if (model.isExclusive) {
            [_selectedTags removeAllObjects];
            break;
        }
    }
    
    [_selectedTags addObject:selectedModel];
    [_collectionView reloadData];
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    if (_showBottomLine) {
//        [self drawBottomLineWithGap:0];
    }
}

@end
