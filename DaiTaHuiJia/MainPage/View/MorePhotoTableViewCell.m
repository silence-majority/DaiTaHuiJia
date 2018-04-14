//
//  MorePhotoTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "MorePhotoTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
#import "UITableViewCell+BottomLine.h"
@interface ImageCollectionViewCell()

@end

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    _imageView.image = [UIImage imageNamed:@"aloneChild"];
    return self;
}


- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView =  [[UIImageView alloc] init];
        imageView.layer.cornerRadius = 4;
        imageView.clipsToBounds = true;
        _imageView = imageView;
    }
    return _imageView;
}

@end

@interface MorePhotoTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionView *collecitonView;
@end

@implementation MorePhotoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.top.offset(20);
        }];
        
        [self.contentView addSubview:self.collecitonView];
        [_collecitonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_titleLabel.mas_bottom).offset(12);
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(-16);
            make.height.mas_equalTo(120);
        }];
    }
    [self testData];
    return self;
}

- (void)testData{
    _titleLabel.text = @"更多照片";
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:18];
        label.textColor = [UIColor colorWithHexString:@"0x181818"];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UICollectionView *)collecitonView{
    if (!_collecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(90,120);
        layout.minimumLineSpacing = 6;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:@"ImageCollectionViewCellId"];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.showsHorizontalScrollIndicator = false;
        _collecitonView = collectionView;
    }
    return _collecitonView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCollectionViewCellId" forIndexPath:indexPath];
    return cell;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
//    [self drawBottomLineWithGap:20];
}

@end
