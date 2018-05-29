//
//  LostorBaseInfoViewModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LostDetailModel.h"
#import "LostInfoModel.h"
@interface LostorBaseInfoViewModel : NSObject
@property (nonatomic,strong) LostDetailModel *lostDetailModel;
@property (nonatomic,strong) LostInfoModel *lostInfoModel;
@end
