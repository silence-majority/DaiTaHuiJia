//
//  PublishManager.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "PublishManager.h"
#import "LostorBaseInfoViewModel.h"
@interface PublishManager()

@end
static PublishManager *manager;
@implementation PublishManager

+ (instancetype) sharedService {
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[PublishManager alloc] init];
    });
    return manager;
}

- (instancetype)init{
    if (self = [super init]) {
        _lostorModel = [[LostorBaseInfoViewModel alloc] init];
    }
    return self;
}

- (void)cleanLostorModel{
    _lostorModel = [[LostorBaseInfoViewModel alloc] init];
}

@end
