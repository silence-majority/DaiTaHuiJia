//
//  UITableViewCell+BottomLine.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/7.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "UITableViewCell+BottomLine.h"

@implementation UITableViewCell (BottomLine)

- (void)drawBottomLineWithLineWidth:(CGFloat)lineWidth lineColor:(UIColor *)lineColor gap:(CGFloat)gap{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(gap, self.bounds.size.height-lineWidth)];
    [path addLineToPoint:CGPointMake(self.bounds.size.width-gap, self.bounds.size.height-lineWidth)];
    [path closePath];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.lineWidth = lineWidth;
    layer.strokeColor = lineColor.CGColor;
    [self.layer addSublayer:layer];
}

- (void)drawBottomLineWithGap:(CGFloat)gap{
    [self drawBottomLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:gap];
}

- (void)drawBottomLine{
    [self drawBottomLineWithLineWidth:0.6 lineColor:[UIColor colorWithHexString:@"0xC8C8C8"] gap:0];
}

@end
