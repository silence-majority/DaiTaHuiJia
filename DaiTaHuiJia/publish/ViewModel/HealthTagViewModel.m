//
//  HealthTagViewModel.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/27.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "HealthTagViewModel.h"
#import "HealthTagModel.h"
@implementation HealthTagViewModel
- (instancetype)init{
    if (self = [super init]) {
        [self testData];
    }
    return self;
}
- (void)testData{
    HealthTagModel *intellA = [HealthTagModel new];
    intellA.title = @"智力正常";
    intellA.isExclusive = true;
    
    HealthTagModel *intellB = [HealthTagModel new];
    intellB.title = @"健忘症";
    intellB.isExclusive = false;
    
    HealthTagModel *intellC = [HealthTagModel new];
    intellC.title = @"轻度智力障碍";
    intellC.isExclusive = false;
    
    HealthTagModel *intellD = [HealthTagModel new];
    intellD.title = @"智力障碍";
    intellD.isExclusive = false;
    NSArray *intellTags = @[intellA,intellB,intellC,intellD];
    
   
    
    HealthTagModel *bodyA = [HealthTagModel new];
    bodyA.title = @"无残疾";
    bodyA.isExclusive = true;
    
    HealthTagModel *bodyB = [HealthTagModel new];
    bodyB.title = @"鼻部残疾";
    bodyB.isExclusive = false;
    
    HealthTagModel *bodyC = [HealthTagModel new];
    bodyC.title = @"嘴部残疾";
    bodyC.isExclusive = false;
    
    HealthTagModel *bodyD = [HealthTagModel new];
    bodyD.title = @"耳部残疾";
    bodyD.isExclusive = false;
    
    HealthTagModel *bodyE = [HealthTagModel new];
    bodyE.title = @"眼部残疾";
    bodyE.isExclusive = false;
    
    HealthTagModel *bodyF = [HealthTagModel new];
    bodyF.title = @"手部残疾";
    bodyF.isExclusive = false;
    
    HealthTagModel *bodyG = [HealthTagModel new];
    bodyG.title = @"脚部残疾";
    bodyG.isExclusive = false;
    
    HealthTagModel *bodyH = [HealthTagModel new];
    bodyH.title = @"躯干残疾";
    bodyH.isExclusive = false;
    NSArray *bodyTags = @[bodyA,bodyB,bodyC,bodyD,bodyE,bodyF,bodyG,bodyH];
    
    
    HealthTagModel *psyA = [HealthTagModel new];
    psyA.title = @"心理正常";
    psyA.isExclusive = true;
    
    HealthTagModel *psyB = [HealthTagModel new];
    psyB.title = @"抑郁症";
    psyB.isExclusive = false;
    
    HealthTagModel *psyC = [HealthTagModel new];
    psyC.title = @"暴力倾向";
    psyC.isExclusive = false;
    
    HealthTagModel *psyD = [HealthTagModel new];
    psyD.title = @"精神分裂";
    psyD.isExclusive = false;
    NSArray *psyTags = @[psyA,psyB,psyC,psyD];
    
    _healthCategoryList = @[intellTags,bodyTags,psyTags];
}
@end
