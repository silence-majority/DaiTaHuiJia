//
//  ClueModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,ClueType){
    ClueTypePublish = 0,
    ClueTypeNormal = 1,
    ClueTypeEnd
};

@interface ClueModel : NSObject
@property (nonatomic,copy) NSString *gmtDate;
@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,assign) ClueType clueType;
@end
