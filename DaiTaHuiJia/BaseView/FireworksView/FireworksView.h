//
//  FireworksView.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/20.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FireworksView : UIView
@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;

@end
