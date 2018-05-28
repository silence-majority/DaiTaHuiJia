//
//  CityModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "CityModel.h"
#import "DistrictModel.h"
#import "NSDictionary+ValueForKey.h"
@interface CityModel()

@end

@implementation CityModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        _provinceId = [dic stringOrNilForKey:@"provinceId"];
        _cityId = [dic stringOrNilForKey:@"cityId"];
        _level = [dic stringOrNilForKey:@"level"];
        _regionCode = [dic stringOrNilForKey:@"cityCode"];
        _cityName = [dic stringOrNilForKey:@"cityName"];
        
        NSArray *districtDicArray = dic[@"countries"];
        NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:districtDicArray.count];
        for (NSDictionary *dic in districtDicArray) {
            DistrictModel *model = [[DistrictModel alloc] initWithDic:dic];
            [temp addObject:model];
        }
        _districtLists = [temp copy];
    }
    return self;
}
@end
