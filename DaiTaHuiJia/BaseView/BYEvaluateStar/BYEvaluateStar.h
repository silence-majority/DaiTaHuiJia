//
//  BYEvaluateStar.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/12.
//

#import <UIKit/UIKit.h>
#import "BYStarButton.h"
typedef void (^BYEvaluateFinish)(NSInteger score);
@interface BYEvaluateStar : UIView

// 提供两种初始化方式
/**
 * 提供遮罩图片、正常状态下的颜色、选中的颜色、初始分数、星星数量；
 * 既可以用来评分，也可以用来展示小数的分数（需设置 enable = false）
 */
- (instancetype)initWithCountOfStar:(NSUInteger)count originScore:(CGFloat)originScore maskImage:(UIImage *)maskImage normalColor:(UIColor *)normalColor focusColor:(UIColor *)focusColor;

/**
 * 提供遮罩图片、正常状态图片、选中的图片、初始分数、星星数量；
 * 只可以用来评分
 */
-(instancetype)initWithCountOfStar:(NSUInteger)count originScore:(NSUInteger)originScore normalImage:(UIImage *)normalImage selectedImage:(UIImage *)seletedImage;

/** 评分回调 */
@property (nonatomic,copy)BYEvaluateFinish evaluateFinish;

/* 星星与星星之间的距离 **/
@property (nonatomic,assign) CGFloat interSpace;
/* 星星的尺寸 **/
@property (nonatomic,assign) CGSize starSize;

@property (nonatomic,assign) CGFloat score;

@end

