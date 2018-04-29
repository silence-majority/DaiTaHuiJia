//
//  CommentModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *portrait;
@property (nonatomic,assign) NSNumber *authScore;
@property (nonatomic,copy) NSString *comment;
@property (nonatomic,copy) NSString *gmtDate;
@property (nonatomic,strong) NSNumber *priseCount;
@property (nonatomic,assign) BOOL isPrise;
@end
