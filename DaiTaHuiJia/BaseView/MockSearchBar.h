//
//  MockSearchBar.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MockSearchBar : UIView
@property (nonatomic,strong) UIImageView *scopeImageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,copy) void (^beTouchBlock)(void);
@end
