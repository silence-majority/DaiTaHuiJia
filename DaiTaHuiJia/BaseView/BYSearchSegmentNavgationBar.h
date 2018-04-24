//
//  BYSearchSegmentNavgationBar.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/31.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BYSegmentControl.h"
//@protocol BYSearchSegmentNavgationBarDelegate<NSObject>
//
//@end

typedef NS_ENUM(NSUInteger,BYSearchSegmentNavgationBarStyle){
    BYSearchSegmentNavgationBarStyleNormal = 0,
    BYSearchSegmentNavgationBarStyleSearching
};

typedef NS_ENUM(NSUInteger,BYSearchSegmentNavgationBarEvent){
    BYSearchSegmentNavgationBarEventSort = 0,
    BYSearchSegmentNavgationBarEventSearch
};

@interface BYSearchSegmentNavgationBar : UINavigationBar
@property (nonatomic,strong) BYSegmentControl *segmentControl;
@property (nonatomic,strong) UIButton *sortButton;
@property (nonatomic,assign) CGFloat beginDragingOffsetY;
@property (nonatomic,assign) BYSearchSegmentNavgationBarStyle by_searchSegmentBarStyle;
@property (nonatomic,copy) void (^eventBlock) (BYSearchSegmentNavgationBarEvent event);
- (void)updateFrameWithOffset:(CGFloat)offset;
- (void)updateFrameWithVelocity:(CGPoint)velocity contentOffset:(CGPoint)contentOffset;
@end
