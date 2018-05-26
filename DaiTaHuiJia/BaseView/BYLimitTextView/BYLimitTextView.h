//
//  BYLimitTextView.h
//  jyxb_app
//
//  Created by xy_yanfa_imac on 2018/1/9.
//  Copyright © 2018年 xiaoyuxiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BYLimitTextViewDelegate
- (void)limitTextViewDidBeginEdit;
- (void)limitTextViewDidEndEdit;
@end
typedef void (^LimitTextViewChanged)(NSString *text);
@interface BYLimitTextView : UIView
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeHolderLabel;
@property (nonatomic,strong) UILabel *countLabel;
/** maxCount = 0时无限制 */
@property (nonatomic,assign) NSInteger maxCount;
@property (nonatomic,weak) id<BYLimitTextViewDelegate> delegate;
@property (nonatomic,copy) LimitTextViewChanged textChanged;
@end
