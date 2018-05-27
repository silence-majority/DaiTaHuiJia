//
//  HealthTagTableViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HealthTagModel;
@interface HealthTagTableViewCell : UITableViewCell
@property (nonatomic,assign) BOOL showBottomLine;
@property (nonatomic,strong) NSArray <HealthTagModel *> *tags;
@end
