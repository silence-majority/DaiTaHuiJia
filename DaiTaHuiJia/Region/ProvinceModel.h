//
//  ProvinceModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CityModel;
@interface ProvinceModel : NSObject
@property (nonatomic,strong) NSString *provinceId;
@property (nonatomic,strong) NSString *level;
@property (nonatomic,strong) NSString *regionCode;
@property (nonatomic,copy)   NSString *provinceName;
@property (nonatomic,strong) NSArray<CityModel *> *cityLists;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
