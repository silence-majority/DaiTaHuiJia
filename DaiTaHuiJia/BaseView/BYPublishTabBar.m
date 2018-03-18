//
//  BYPublishTabBar.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/18.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "BYPublishTabBar.h"

@implementation BYPublishTabBar

- (instancetype) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.translucent = false;
        
        [self setPublishBar];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat barWidth = self.bounds.size.width/(self.commonBarCount+1);
    NSUInteger barIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]){
            if (barIndex == self.commonBarCount/2){
                barIndex++;
            }
            CGRect tempFrame = child.frame;
            tempFrame.size.width = barWidth;
            tempFrame.origin.x = barWidth*barIndex;
            child.frame = tempFrame;
            barIndex++;
        }
    }
}

- (void)setPublishBar{
    
}

@end
