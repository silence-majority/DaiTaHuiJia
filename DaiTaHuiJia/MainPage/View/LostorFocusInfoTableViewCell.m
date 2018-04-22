//
//  LostorFocusInfoTableViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorFocusInfoTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UITableViewCell+BottomLine.h"
#import "FocusTipView.h"
@interface LostorFocusInfoCollectionViewCell()

@end

@implementation LostorFocusInfoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.amountLabel];
        [_amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.mas_equalTo(self.contentView.mas_centerX).offset(3);
        }];
        
        [self.contentView addSubview:self.degreeLabel];
        [_degreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(2);
            make.left.mas_equalTo(self.contentView.mas_centerX).offset(5);
        }];
        [self testData];
    }
    return self;
}

- (UILabel *)amountLabel{
    if (!_amountLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.textColor = [UIColor blackColor];
        _amountLabel = label;
    }
    return _amountLabel;
}

- (UILabel *)degreeLabel{
    if (!_degreeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor darkGrayColor];
        _degreeLabel = label;
    }
    return _degreeLabel;
}

- (void)testData{
    _amountLabel.text = @"9579";
    _degreeLabel.text = @"次浏览";
}

@end

// ************************************************ //
// ************************************************ //
// ************************************************ //

@interface OperateLostorDetailCollectionViewCell()

@end

@implementation OperateLostorDetailCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"0xF4F5F6"];
        self.contentView.layer.cornerRadius = 4;
        [self.contentView addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.mas_equalTo(self.contentView.mas_centerX).offset(-6);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        [self.contentView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.mas_equalTo(self.contentView.mas_centerX).offset(0);
        }];
    }
    [self testData];
    return self;
}

- (void)testData{
    _titleLabel.text = @"关注";
    _imageView.image = [UIImage imageNamed:@"hart_dark"];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x828282"];
        _titleLabel = label;
    }
    return _titleLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] init];
        _imageView = imageView;
    }
    return _imageView;
}

@end

// ************************************************ //
// ************************************************ //
// ************************************************ //

@interface LostorFocusInfoTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collecitonView;
@property (nonatomic,strong) UICollectionView *operateCollecitonView;
@property (nonatomic,strong) FocusTipView *focusTipView;
@property (nonatomic,strong) UILabel *describeLabel;
@end

@implementation LostorFocusInfoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.collecitonView];
        [_collecitonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(70);
        }];
        
        [self.contentView addSubview:self.operateCollecitonView];
        [_operateCollecitonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_collecitonView.mas_bottom);
            make.left.offset(0);
            make.right.offset(0);
            make.height.mas_equalTo(44);
        }];
        
        [self.contentView addSubview:self.focusTipView];
        [_focusTipView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(20);
            make.centerX.offset(0);
            make.top.mas_equalTo(_operateCollecitonView.mas_bottom).offset(16);
            make.height.mas_equalTo(60);
            make.bottom.offset(0);
        }];
    }
    [self testData];
    return self;
}

- (void)testData{
    CGFloat height = 0;
    if (!_isSperad) {
        height = 0;
    } else {
        height = 70+16;
    }
    
    [_focusTipView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.centerX.offset(0);
        make.top.offset(70+44);
        make.height.mas_equalTo(height);
        make.bottom.offset(0);
    }];
}

- (void)setIsSperad:(BOOL)isSperad{
    _isSperad = isSperad;
    [self testData];
}

- (UICollectionView *)collecitonView{
    if (!_collecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(screenW/3.0f-0.1f,70);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [collectionView registerClass:[LostorFocusInfoCollectionViewCell class] forCellWithReuseIdentifier:@"LostorFocusInfoCollectionViewCellId"];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _collecitonView = collectionView;
    }
    return _collecitonView;
}

- (UICollectionView *)operateCollecitonView{
    if (!_operateCollecitonView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((screenW-60)/2.0f-0.1f,44);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 20;
        layout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [collectionView registerClass:[OperateLostorDetailCollectionViewCell class] forCellWithReuseIdentifier:@"OperateLostorDetailCollectionViewCellId"];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        _operateCollecitonView = collectionView;
    }
    return _operateCollecitonView;
}

- (FocusTipView *)focusTipView{
    if (!_focusTipView) {
        _focusTipView = [[FocusTipView alloc] init];
    }
    return _focusTipView;
}

- (UILabel *)describeLabel{
    if (!_describeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor colorWithHexString:@"0x464646"];
        label.numberOfLines = 0;
        _describeLabel = label;
    }
    return _describeLabel;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return collectionView == _collecitonView ? 3 : 2;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _collecitonView) {
        LostorFocusInfoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LostorFocusInfoCollectionViewCellId" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.amountLabel.text = @"9579";
            cell.degreeLabel.text = @"次浏览";
        }else if (indexPath.row == 1) {
            cell.amountLabel.text = @"2796";
            cell.degreeLabel.text = @"次分享";
        }else {
            cell.amountLabel.text = @"298";
            cell.degreeLabel.text = @"人关注";
        }
        return cell;
    }else{
        OperateLostorDetailCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OperateLostorDetailCollectionViewCellId" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"star_dark"];
            cell.titleLabel.text = @"分享";
        }else {
            cell.imageView.image = [UIImage imageNamed:@"hart_dark"];
            cell.titleLabel.text = @"关注";
        }
        return cell;
    }
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
//    [self drawBottomLineWithGap:20];
}

@end
