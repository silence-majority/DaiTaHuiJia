//
//  BYSegmentBadgeButton.h
//  BYSegmentController
//
//  Created by xy_yanfa_imac on 2017/12/27.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BYSegmentBadgeButtonStyle){
    BYSegmentBadgeButtonStyleNormal = 0,
    BYSegmentBadgeButtonStyleFocus
};

@interface BYSegmentBadgeButton : UIButton
@property (nonatomic,assign) NSInteger badgeNumber;
@property (nonatomic,assign) BYSegmentBadgeButtonStyle style;
@property (nonatomic,strong) UIColor *normalTitleColor;
@property (nonatomic,strong) UIColor *focusTitleColor;
@property (nonatomic,strong) UIFont *normalTitleFont;
@property (nonatomic,strong) UIFont *focusTitleFont;
@end
