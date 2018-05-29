//
//  LostorDetailViewModel.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/22.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@class ClueModel;
@class CommentModel;
@interface LostorDetailViewModel : NSObject
// 关注框是否展开
@property (nonatomic,assign) BOOL isFocusTipSpread;
@property (nonatomic,strong) RACSubject *shareSubject;
@property (nonatomic,strong) NSArray <ClueModel *> *clueList;
@property (nonatomic,strong) NSArray <CommentModel *> *commentList;
@end
