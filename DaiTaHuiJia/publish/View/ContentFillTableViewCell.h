//
//  ContentFillTableViewCell.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,ContentFillTableViewCellStyle){
    ContentFillTableViewCellStyleInput = 0,
    ContentFillTableViewCellStylePick
};

@interface ContentFillTableViewCell : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *indicateLabel;
@property (nonatomic,strong) UITextField *textField;
@property (nonatomic,assign) ContentFillTableViewCellStyle fillStyle;
@property (nonatomic,copy) NSString *describeText;
@end
