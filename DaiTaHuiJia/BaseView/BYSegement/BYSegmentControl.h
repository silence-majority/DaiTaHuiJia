//
//  BYSegmentControl.h
//  BYSegmentController
//
//  Created by xy_yanfa_imac on 2017/12/18.
//

#import <UIKit/UIKit.h>
@protocol BYSegmentControlDelegate
- (void)didSelecteSegmentIndex:(NSInteger)index;
@end

typedef NS_ENUM(NSInteger,BYSegmentControlSliderStyle){
    BYSegmentControlSliderStyleConstant = 0,
    BYSegmentControlSliderStyleFitTitle
};

@interface BYSegmentControl : UIView
@property (nonatomic,copy) NSArray<NSString *> *segmentTitles;
@property (nonatomic,assign) CGFloat horizontalMargin;
@property (nonatomic,strong) UIColor *normalSegmentColor;
@property (nonatomic,strong) UIColor *focusSegmentColor;
@property (nonatomic,strong) UIFont *normalSegmentFont;
@property (nonatomic,strong) UIFont *focusSegmentFont;
@property (nonatomic,assign) BYSegmentControlSliderStyle sliderStyle;
@property (nonatomic,assign) CGSize sliderSize;

@property (nonatomic,weak) id<BYSegmentControlDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame segmentTitles:(NSArray<NSString *> *)titles;
- (void)updateSegmentWithRatio:(CGFloat)ratio;
- (void)updateBadge:(NSInteger)badgeNumber forSegmentIndex:(NSInteger)index;
@end
