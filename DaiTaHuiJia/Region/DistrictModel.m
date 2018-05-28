//
//  DistrictModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "DistrictModel.h"
#import "NSDictionary+ValueForKey.h"
@interface DistrictModel ()

@end

@implementation DistrictModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        _provinceId = [dic stringOrNilForKey:@"provinceId"];
        _cityId = [dic stringOrNilForKey:@"cityId"];
        _districtId = [dic stringOrNilForKey:@"countryId"];
        _level = [dic stringOrNilForKey:@"level"];
        _regionCode = [dic stringOrNilForKey:@"countryCode"];
        _districtName = [dic stringOrNilForKey:@"countryName"];
    }
    return self;
}

@end
