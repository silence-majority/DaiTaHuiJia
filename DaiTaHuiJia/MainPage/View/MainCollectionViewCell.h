//
//  MainCollectionViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/6.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LostBriefModel;
@interface MainCollectionViewCell : UICollectionViewCell
- (void)configureWithModel:(LostBriefModel *)model;
@end
