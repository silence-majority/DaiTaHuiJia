//
//  CommentTableViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/14.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentModel;
@interface CommentTableViewCell : UITableViewCell
- (void)configureWithModel:(CommentModel *)model;
@end
