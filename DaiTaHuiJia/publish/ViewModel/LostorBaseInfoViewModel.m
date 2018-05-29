//
//  LostorBaseInfoViewModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorBaseInfoViewModel.h"

@implementation LostorBaseInfoViewModel
- (instancetype)init{
    if (self = [super init]) {
        _lostDetailModel = [[LostDetailModel alloc] init];
    }
    return self;
}
@end
