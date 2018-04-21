//
//  LostorFocusInfoTableViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LostorFocusInfoCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *amountLabel;
@property (nonatomic,strong) UILabel *degreeLabel;

@end

@interface OperateLostorDetailCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@interface LostorFocusInfoTableViewCell : UITableViewCell

@property (nonatomic,assign) BOOL isSperad;

@end
