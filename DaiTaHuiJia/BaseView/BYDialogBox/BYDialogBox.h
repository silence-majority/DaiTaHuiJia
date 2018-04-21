//
//  BYDialogBox.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/11.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,BYDialogBoxOrientation){
    BYDialogBoxOrientationUP = 0,
    BYDialogBoxOrientationDown,
    BYDialogBoxOrientationLeft,
    BYDialogBoxOrientationRight
};

@interface BYDialogBox : UIView
@property (nonatomic,assign) BYDialogBoxOrientation orientation;
//以箭头的顶点为分界线，把对话框分成前后两部分，ratio为前部分width/后部分的width
@property (nonatomic,assign) CGFloat ratio;

//BYDialogBox的顶点相对于父view的坐标
@property (nonatomic,assign) CGPoint jointPoint;

@property (nonatomic,strong) UIColor *themeColor;
@property (nonatomic,assign) CGFloat themeAlpha;
//@property (nonatomic,strong) UILabel *dialogLabel;

@property (nonatomic,assign) CGFloat arrowMarkHeight;

@property (nonatomic,strong) UIView *contentView;

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,copy) void (^touchBlock)(void);

@end
