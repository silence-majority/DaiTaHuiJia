//
//  ClueChainTableViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ClueModel;
@interface ClueChainTableViewCell : UITableViewCell
- (void)configureWithModel:(ClueModel *)model;
@end
