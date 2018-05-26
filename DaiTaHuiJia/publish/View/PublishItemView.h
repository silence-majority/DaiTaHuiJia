//
//  PublishItemView.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/3/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PublishItemView : UIView
- (void)configureWithImage:(NSString *)name
                     title:(NSString *)title
                  describe:(NSString *)text;
@property (nonatomic,copy) void (^selected)(void);
@end
