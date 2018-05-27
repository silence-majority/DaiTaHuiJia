//
//  BaseInfoHeader.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseInfoHeader : UIView
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,assign) BOOL isShowBottomLine;
- (void)setTitle:(NSString *)title;
@property (nonatomic,copy) void (^imageBlock)(void);
@end
