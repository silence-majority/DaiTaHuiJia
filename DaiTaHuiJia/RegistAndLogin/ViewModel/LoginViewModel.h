//
//  LoginViewModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/24.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject
@property (nonatomic,copy) NSString *account;
@property (nonatomic,copy) NSString *password;
@property (nonatomic,assign) BOOL loginAvailable;
@property (nonatomic,assign) BOOL accountAvailable;
@property (nonatomic,assign) BOOL passwordAvailable;

@end
