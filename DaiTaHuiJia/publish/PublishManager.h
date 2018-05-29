//
//  PublishManager.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LostorBaseInfoViewModel.h"
@interface PublishManager : NSObject
+ (instancetype) sharedService;
- (void)cleanLostorModel;
@property (nonatomic,strong) LostorBaseInfoViewModel *lostorModel;
@end
