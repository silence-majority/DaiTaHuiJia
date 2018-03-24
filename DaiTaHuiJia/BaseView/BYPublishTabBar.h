//
//  BYPublishTabBar.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYPublishTabBarDelegate<NSObject>
- (void)didTouchPublishView;
@end

@interface BYPublishTabBar : UITabBar

/*
 * 常规Bar的数量
 */
@property (nonatomic,assign) NSUInteger commonBarCount;

/*
 * 设置自定义的bar
 */
- (void)setPublishBar;

@property (nonatomic,weak) id<BYPublishTabBarDelegate> publishDelegate;

@end
