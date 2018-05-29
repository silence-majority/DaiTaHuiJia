//
//  LostDetailModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LostDetailModel : NSObject
@property (nonatomic,strong) UIImage *portrait;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *gender;
@property (nonatomic,copy) NSString *birthDay;
@property (nonatomic,copy) NSString *IDNumber;
@property (nonatomic,copy) NSString *district;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,strong)  NSArray <UIImage *> *photos;
@end
