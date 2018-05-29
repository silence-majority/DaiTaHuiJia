//
//  SharePopView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "SharePopView.h"
#import <Masonry/Masonry.h>
@implementation SharePlatCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(4);
            make.right.offset(-4);
            make.top.offset(0);
            make.height.mas_equalTo(_imageView.mas_width);
        }];
        
        [self addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(0);
            make.centerX.offset(0);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor darkGrayColor];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView =  [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.clipsToBounds = true;
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.layer.cornerRadius = 28;
        imageView.layer.masksToBounds = true;
        _imageView = imageView;
    }
    return _imageView;
}

@end

@interface SharePopView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIVisualEffectView *blurView;
@property (nonatomic,strong) UIView *line;

@end

@implementation SharePopView

- (instancetype)init{
    if (self = [super init]) {
        self.curtainAlpha = 0.4;
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.bottom.offset(16);
            make.right.offset(0);
            make.height.mas_equalTo(240);
        }];
        _contentView.transform = CGAffineTransformMakeTranslation(0, 240);
        
        [_contentView addSubview:self.blurView];
        [_blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        [_contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(20);
            make.centerX.offset(0);
        }];
        
        [_contentView addSubview:self.collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(50);
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(-70);
        }];
        
        [_contentView addSubview:self.line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(-70);
            make.height.mas_equalTo(0.8);
        }];
        
        [_contentView addSubview:self.cancelButton];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-16);
            make.height.mas_equalTo(55);
            make.left.offset(0);
            make.right.offset(0);
        }];
        
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
            } else {
                weakSelf.contentView.transform = CGAffineTransformMakeTranslation(0, 240);
            }
        }];
    }
    _titleLabel.text = @"分享到：";
    [_cancelButton addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor clearColor];
        view.clipsToBounds = true;
        view.layer.cornerRadius = 16;
        _contentView = view;
    }
    return _contentView;
}

- (UIVisualEffectView *)blurView{
    if (!_blurView) {
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        _blurView = visualEffectView;
    }
    return _blurView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor colorWithHexString:@"0x222222"];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        layout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
//        CGFloat width = (screenW-50-40)/5.0f-1;
        CGFloat width = 64;
        layout.itemSize = CGSizeMake(width, width+20);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.backgroundColor = [UIColor clearColor];
        [collectionView registerClass:[SharePlatCell class] forCellWithReuseIdentifier:@"SharePlatCellId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (UIView *)line{
    if (!_line) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@"0xC8C8C8"];
        _line = view;
    }
    return _line;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancelButton = button;
    }
    return _cancelButton;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SharePlatCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SharePlatCellId" forIndexPath:indexPath];
    switch (indexPath.item) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"share_circle"];
            cell.titleLabel.text = @"微信朋友圈";
            break;
            
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"share_wechat"];
            cell.titleLabel.text = @"微信好友";
            break;
            
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"share_zoom"];
            cell.titleLabel.text = @"QQ空间";
            break;
            
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"share_qq"];
            cell.titleLabel.text = @"QQ好友";
            break;
            
        case 4:
            cell.imageView.image = [UIImage imageNamed:@"share_wobo"];
            cell.titleLabel.text = @"新浪微博";
            break;
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self dismissPopView];
}


@end
