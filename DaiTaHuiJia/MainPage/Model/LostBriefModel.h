//
//  LostBriefModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LostBriefModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,assign) CGFloat lostTime;
@property (nonatomic,assign) CGFloat lostDistance;
@property (nonatomic,copy) NSString *imageName;
@end
