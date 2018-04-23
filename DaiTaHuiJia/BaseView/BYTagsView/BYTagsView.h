//
//  BYTagsView.h
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import <UIKit/UIKit.h>
#import "BYCollectionViewFlowLayout.h"


@protocol BYTagModelDelegate <NSObject>

@property (nonatomic,strong,readonly) NSNumber *tagId;
@property (nonatomic,copy,readonly) NSString *tagTitle;
@property (nonatomic,assign,readonly) BOOL isSeleted;

@end

@interface BYTag : NSObject<BYTagModelDelegate>
@property (nonatomic,strong) NSNumber *byTagId;
@property (nonatomic,copy) NSString *byTagTitle;
@property (nonatomic,assign) BOOL byTagisSeleted;
- (instancetype)initWithTagId:(NSNumber *)tagId tagTitle:(NSString *)title isSeleted:(BOOL)isSeleted;

@end

typedef void (^SelectTagFinished)(NSArray *selectedTagsArray);

@interface BYTagsView : UIView

/** 所有的tag数组 */
@property (nonatomic,copy) NSArray<id<BYTagModelDelegate>> *tags;
/** 选中的tag数组 */
@property (nonatomic,strong) NSMutableArray<id<BYTagModelDelegate>> *selectedTags;
/** 是否支持多选 */
@property (nonatomic,assign) BOOL isMultiSelectEnable;

@property (nonatomic,copy) SelectTagFinished selectFinished;

@property (nonatomic,strong) BYCollectionViewFlowLayout *layout;

- (instancetype)initWithFrame:(CGRect)frame layout:(BYCollectionViewFlowLayout *)layout;

+ (CGFloat)getHeightWithTags:(NSArray<id<BYTagModelDelegate>> *)tags layout:(BYCollectionViewFlowLayout *)layout width:(CGFloat)width;

- (void)reload;

@end
