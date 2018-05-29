//
//  UploadImagesView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "UploadImagesView.h"
#import <Masonry/Masonry.h>
#import "BYLimitTextView.h"
#import "UIColor+UIColor_Hex.h"
#import "ImageCollectionViewCell.h"
@interface UploadImagesView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) BYLimitTextView *textView;
@property (nonatomic,strong) UICollectionView *collectionView;

@end

@implementation UploadImagesView

- (instancetype)initWithFrame:(CGRect)frame style:(UploadImagesViewStyle)style{
    if (self = [super initWithFrame:frame]) {
        _style = style;
        self.imagesList = @[].mutableCopy;
        
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(16);
            make.top.offset(20);
        }];
        
        [self addSubview:self.collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.top.offset(48);
            make.bottom.offset(0);
        }];
    }
    _titleLabel.text = @"生活照片";
    return self;
}

-(void)setImagesList:(NSArray<UIImage *> *)imagesList{
    _imagesList = [imagesList mutableCopy];
    if (_imagesList.count == 0) {
        [_imagesList addObject:[UIImage imageNamed:@"addImage"]];
    }
    [self.collectionView reloadData];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x101110"];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (BYLimitTextView *)textView{
    if (!_textView) {
        BYLimitTextView *textView = [[BYLimitTextView alloc] init];
        textView.maxCount = 0;
        textView.backgroundColor = [UIColor colorWithHexString:@"0xF5F8F9"];
        textView.placeHolderLabel.text = @"生活照片";
        _textView = textView;
    }
    return _textView;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 40, 10, 40);
        CGFloat width = (screenW-80-10)/3.0f-1;
        layout.itemSize = CGSizeMake(width, width);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor whiteColor];
        [collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCellId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imagesList.count > 9 ? 9 : _imagesList.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCellId" forIndexPath:indexPath];
    cell.imageView.image = _imagesList[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_imagesList.count == 1 && indexPath.row == 0) {
        if (self.addImageBlock) {
            self.addImageBlock(9);
        }
    }
}

@end
