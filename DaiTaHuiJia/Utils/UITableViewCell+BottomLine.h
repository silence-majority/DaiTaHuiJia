    //
//  UITableViewCell+BottomLine.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (BottomLine)
- (void)drawLineWithStart:(CGPoint)startPoint end:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap;
- (void)drawBottomLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap;
- (void)drawBottomLineWithGap:(CGFloat)gap;
- (void)drawBottomLine;

- (void)drawTopLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap;
- (void)drawTopLineWithGap:(CGFloat)gap;
- (void)drawTopLine;
@end
