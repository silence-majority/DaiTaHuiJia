//
//  CityModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DistrictModel;
@interface CityModel : NSObject
@property (nonatomic,strong) NSString *provinceId;
@property (nonatomic,strong) NSString *cityId;
@property (nonatomic,strong) NSString *level;
@property (nonatomic,strong) NSString *regionCode;
@property (nonatomic,copy)   NSString *cityName;
@property (nonatomic,strong) NSArray<DistrictModel *> *districtLists;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
