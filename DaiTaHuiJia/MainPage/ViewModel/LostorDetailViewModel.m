//
//  LostorDetailViewModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/4/22.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorDetailViewModel.h"
#import "ClueModel.h"
#import "CommentModel.h"
@implementation LostorDetailViewModel
- (instancetype)init{
    if (self = [super init]) {
        _shareSubject = [RACSubject subject];
        [self makeClueTestData];
        [self makeCommentTestData];
    }
    return self;
}

- (void)makeClueTestData{
    ClueModel *model = [ClueModel new];
    model.gmtDate = @"1522009928";
    model.userName = @"摩托车手";
    model.describe = @"在长岛海边看到孩子和大叔在一起";
    model.clueType = ClueTypeNormal;
    
    ClueModel *modelA = [ClueModel new];
    modelA.gmtDate = @"1520009928";
    modelA.userName = @"高个先生";
    modelA.describe = @"在玉米地看到孩子和大叔在一起";
    modelA.clueType = ClueTypeNormal;
    
    ClueModel *modelB = [ClueModel new];
    modelB.gmtDate = @"1490009928";
    modelB.userName = @"酒店职员";
    modelB.describe = @"孩子和大叔一起来过本酒店";
    modelB.clueType = ClueTypeNormal;
    
    ClueModel *modelC = [ClueModel new];
    modelC.gmtDate = @"1460009928";
    modelC.userName = @"正男奶奶";
    modelC.describe = @"发布孩子走失";
    modelC.clueType = ClueTypePublish;
    
    ClueModel *modelD = [ClueModel new];
    modelD.gmtDate = @"1500009928";
    modelD.userName = @"嘻哈情侣";
    modelD.describe = @"我们把孩子和大叔带到公交站";
    modelD.clueType = ClueTypeNormal;
    
    _clueList = @[model,modelA,modelD,modelB,modelC];
}

- (void)makeCommentTestData{
    CommentModel *model = [CommentModel new];
    model.name = @"酒店职员";
    model.portrait = @"assitor";
    model.comment = @"孩子和大叔来到了本公司经营的酒店，孩子很好，大叔很诙谐，虽然有点痞痞的，但是看起来不像是会伤害孩子的坏人。";
    model.authScore = @90.0;
    model.priseCount = @58;
    model.isPrise = false;
    model.gmtDate = @"1490009928";
    
    CommentModel *modelB = [CommentModel new];
    modelB.name = @"嘻哈情侣";
    modelB.portrait = @"xiha";
    modelB.comment = @"我们在车站碰到了孩子和大叔，孩子让我们顺利捎带他和大叔。看起来孩子好像是自愿和大叔一起出来的，孩子好像很期待去某个地方。";
    modelB.authScore = @90.0;
    modelB.priseCount = @30;
    modelB.isPrise = false;
    modelB.gmtDate = @"1520009928";
    
    CommentModel *modelC = [CommentModel new];
    modelC.name = @"摩托车手";
    modelC.portrait = @"motor";
    modelC.comment = @"我们在海边碰到了孩子和大叔，大叔告诉了我们他来陪孩子寻找妈妈，但是孩子妈妈已经又了新家庭，为了让孩子开心一下，我们和大叔陪孩子玩了很久。";
    modelC.authScore = @100.0;
    modelC.priseCount = @18;
    modelC.isPrise = false;
    modelC.gmtDate = @"1522009928";
    
    _commentList = @[model,modelB,modelC];
}

@end
