//
//  HealthTagModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthTagModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) BOOL isExclusive;
@property (nonatomic,strong) NSNumber *categoryId;
@property (nonatomic,strong) NSNumber *tagId;
@end
