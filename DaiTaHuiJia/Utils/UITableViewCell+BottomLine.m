//
//  UITableViewCell+BottomLine.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "UITableViewCell+BottomLine.h"

@implementation UITableViewCell (BottomLine)

- (void)drawLineWithStart:(CGPoint)startPoint end:(CGPoint)endPoint lineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];
    [path addLineToPoint:endPoint];
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = lineWidth;
    layer.strokeColor = lineColor.CGColor;
    [self.layer addSublayer:layer];
}

- (void)drawBottomLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap{
    [self drawLineWithStart:CGPointMake(gap, self.bounds.size.height-lineWidth) end:CGPointMake(self.bounds.size.width-gap, self.bounds.size.height-lineWidth) lineWidth:lineWidth lineColor:lineColor gap:gap];
}

- (void)drawBottomLineWithGap:(CGFloat)gap{
    [self drawBottomLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:gap];
}

- (void)drawBottomLine{
    [self drawBottomLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:0];
}


- (void)drawTopLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap{
    [self drawLineWithStart:CGPointMake(gap, 0) end:CGPointMake(self.bounds.size.width-gap, 0) lineWidth:lineWidth lineColor:lineColor gap:gap];
}

- (void)drawTopLineWithGap:(CGFloat)gap{
    [self drawTopLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:gap];
}

- (void)drawTopLine{
    [self drawTopLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:0];
}

@end
