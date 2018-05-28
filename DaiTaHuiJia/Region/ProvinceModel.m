//
//  ProvinceModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ProvinceModel.h"
#import "NSDictionary+ValueForKey.h"
#import "CityModel.h"
@interface ProvinceModel()

@end

@implementation ProvinceModel
- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        _provinceId = [dic stringOrNilForKey:@"provinceId"];
        _level = [dic stringOrNilForKey:@"level"];
        _regionCode = [dic stringOrNilForKey:@"cityCode"];
        _provinceName = [dic stringOrNilForKey:@"provinceName"];
        
        NSArray *districtDicArray = dic[@"cities"];
        NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:districtDicArray.count];
        for (NSDictionary *dic in districtDicArray) {
            CityModel *model = [[CityModel alloc] initWithDic:dic];
            [temp addObject:model];
        }
        _cityLists = [temp copy];
    }
    return self;
}
@end
