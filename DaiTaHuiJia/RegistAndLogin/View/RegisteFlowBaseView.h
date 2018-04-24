//
//  RegisteFlowBaseView.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisteFlowBaseView : UIView
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitle;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) UIColor *themeColor;
@property (nonatomic,copy) void (^nextStepBlock)(void);
@end
