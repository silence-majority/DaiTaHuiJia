//
//  BYSearchSegmentNavgationBar.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/31.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYSegmentControl.h"
@interface BYSearchSegmentNavgationBar : UINavigationBar
@property (nonatomic,strong) UITextField *searchTextField;
@property (nonatomic,strong) BYSegmentControl *segmentControl;

@property (nonatomic,assign) CGFloat beginDragingOffsetY;
- (void)updateFrameWithOffset:(CGFloat)offset;
- (void)updateFrameWithVelocity:(CGPoint)velocity contentOffset:(CGPoint)contentOffset;
@end
