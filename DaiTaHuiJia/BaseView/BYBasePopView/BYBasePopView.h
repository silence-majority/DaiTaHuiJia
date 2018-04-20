//
//  BYBasePopView.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/20.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * animationId
 * 0:子类控件pop出动画；
 * 1:子类控件消失动画。
 *
 */
typedef void (^BYPopViewAnimationBlock)(NSInteger animationId);

/**
 * eventId
 *  0:点击黑色半透明背景
 *  1:子类可以自己定义除0以外的eventId对应的事件。eventParamDic传递参数。
 */
typedef void (^BYPopViewEventBlock)(NSInteger eventId,NSDictionary *eventParamDic);

@interface BYBasePopView : UIView

@property (nonatomic,assign) CGFloat curtainAlpha;
@property (nonatomic,assign) NSTimeInterval animationDuration;
@property (nonatomic,assign) BOOL hiddenByTouchCurtain;
@property (nonatomic,copy) BYPopViewAnimationBlock animationBlock;
@property (nonatomic,copy) BYPopViewEventBlock eventBlock;

@end
