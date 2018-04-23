//
//  BYTagCollectionViewCell.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger ,BYTagStyle){
    BYTagStyleNormal = 0,
    BYTagStyleFocus
};

@interface BYTagCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,assign) BYTagStyle tagStyle;
- (void)setTitleColor:(UIColor *)color forStyle:(BYTagStyle)style;
- (void)setBackColor:(UIColor *)color forStyle:(BYTagStyle)style;

@end
