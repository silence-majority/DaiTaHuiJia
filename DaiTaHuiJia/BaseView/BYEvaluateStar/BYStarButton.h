//
//  BYStarButton.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/29.
//

#import <UIKit/UIKit.h>
//typedef NS_ENUM(NSUInteger,BYStarButtonStatus){
//    BYStarButtonStatusNormal = 0,
//    BYStarButtonStatusFocus
//};

@interface BYStarButton : UIButton
@property (nonatomic,strong) UIColor *normalColor;
@property (nonatomic,strong) UIColor *focusColor;
@property (nonatomic,strong) UIImage *maskImage;
@property (nonatomic,assign) CGFloat score;
@end
