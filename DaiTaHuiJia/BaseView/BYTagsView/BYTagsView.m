//
//  BYTagsView.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/9.
//

#import "BYTagsView.h"
#import "BYTagCollectionViewCell.h"
#import "UIColor+UIColor_Hex.h"
#import "SearchCollectionHeaderView.h"
@implementation BYTag

- (instancetype)initWithTagId:(NSNumber *)tagId tagTitle:(NSString *)title isSeleted:(BOOL)isSeleted{
    if (self = [super init]) {
        self.byTagId = tagId;
        self.byTagTitle = title;
        self.byTagisSeleted = isSeleted;
    }
    return self;
}

- (NSNumber *)tagId{
    return self.byTagId;
}

- (NSString *)tagTitle{
    return self.byTagTitle;
}

- (BOOL)isSeleted{
    return self.byTagisSeleted;
}

@end

@interface BYTagsView()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation BYTagsView

- (instancetype)initWithFrame:(CGRect)frame layout:(BYCollectionViewFlowLayout *)layout{
    if (self = [super initWithFrame:frame]) {
        if (!layout) {
            _layout = [[BYCollectionViewFlowLayout alloc] init];
            _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _layout.minimumLineSpacing = 10.0f;
            _layout.minimumInteritemSpacing = 10.0f;
            _layout.sectionInset = UIEdgeInsetsMake(20.0f, 18.0f, 20.0f, 18.0f);
            _layout.itemSize = CGSizeMake(100, 30);
            _layout.tagFont = [UIFont systemFontOfSize:14];
            _layout.verticalFreeSpecs = 40;
        }else{
            _layout = layout;
        }
        _selectedTags = [[NSMutableArray alloc] init];
        [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        _layout = [[BYCollectionViewFlowLayout alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _layout.minimumLineSpacing = 10.0f;
        _layout.minimumInteritemSpacing = 10.0f;
        _layout.sectionInset = UIEdgeInsetsMake(20.0f, 18.0f, 20.0f, 18.0f);
        _layout.itemSize = CGSizeMake(100, 30);
        _layout.tagFont = [UIFont systemFontOfSize:14];
        _layout.verticalFreeSpecs = 40;
        _selectedTags = [[NSMutableArray alloc] init];
        
        [self addSubview:self.collectionView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews{
    _collectionView.frame = self.bounds;
    [_collectionView reloadData];
}

- (UICollectionView *)collectionView{
    if (!_collectionView){
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
//        collectionView.scrollEnabled = false;
        collectionView.backgroundColor = [UIColor cyanColor];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [collectionView registerClass:[BYTagCollectionViewCell class] forCellWithReuseIdentifier:@"BYTagCellId"];
         [collectionView registerClass:[SearchCollectionHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchCollectionHeaderViewId"];
        _collectionView = collectionView;
    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _tags.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    BYTagCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BYTagCellId" forIndexPath:indexPath];
    cell.titleLabel.text = _tags[indexPath.row].tagTitle;
    cell.titleLabel.font = _layout.tagFont;
    [cell setBackColor:[UIColor colorWithHexString:@"0xF7F7F7"] forStyle:(BYTagStyleNormal)];
    [cell setBackColor:[UIColor colorWithHexString:COLOR_THEME_STR] forStyle:(BYTagStyleFocus)];
    [cell setTitleColor:[UIColor colorWithHexString:@"0x666666"] forStyle:BYTagStyleNormal];
    [cell setTitleColor:[UIColor whiteColor] forStyle:BYTagStyleFocus];
    if ([_selectedTags containsObject:_tags[indexPath.item]]){
        cell.tagStyle = BYTagStyleFocus;
    }else{
        cell.tagStyle = BYTagStyleNormal;
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_isMultiSelectEnable){
        if ([_selectedTags containsObject:_tags[indexPath.item]]){
            [_selectedTags removeObject:_tags[indexPath.item]];
        }else{
             [_selectedTags addObject:_tags[indexPath.row]];
        }
    }else{
        [_selectedTags removeAllObjects];
        [_selectedTags addObject:_tags[indexPath.row]];
    }
    [_collectionView reloadData];
    if (_selectFinished) {
        _selectFinished(_selectedTags);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    BYCollectionViewFlowLayout *layout = (BYCollectionViewFlowLayout *)collectionView.collectionViewLayout;
    CGSize maxSize = CGSizeMake(collectionView.frame.size.width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
    CGRect titleLabelFrame = [_tags[indexPath.item].tagTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: layout.tagFont}  context:nil];
//    return CGSizeMake(titleLabelFrame.size.width + 40, titleLabelFrame.size.height + 12);
     return CGSizeMake(titleLabelFrame.size.width + layout.verticalFreeSpecs, layout.itemSize.height);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake([UIApplication sharedApplication].keyWindow.bounds.size.width, 40);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    SearchCollectionHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SearchCollectionHeaderViewId" forIndexPath:indexPath];
    return header;
}

- (void)reload{
    [_collectionView reloadData];
}

+ (CGFloat)getHeightWithTags:(NSArray<id<BYTagModelDelegate>> *)tags layout:(BYCollectionViewFlowLayout *)layout width:(CGFloat)width{
    CGFloat contentViewHeight = 0;
    if (!layout) {
        layout = [[BYCollectionViewFlowLayout alloc] init];
    }
    //cell的高度 = 顶部 + 高度
    contentViewHeight = layout.sectionInset.top + layout.itemSize.height;
    CGFloat originX = layout.sectionInset.left;
    CGFloat originY = layout.sectionInset.top;
    NSInteger itemCount = tags.count;
    
    for (NSInteger i = 0; i < itemCount; i++) {
        CGSize maxSize = CGSizeMake(width - layout.sectionInset.left - layout.sectionInset.right, layout.itemSize.height);
        CGRect frame = [tags[i].tagTitle boundingRectWithSize:maxSize options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: layout.tagFont} context:nil];
        CGSize itemSize = CGSizeMake(frame.size.width + layout.verticalFreeSpecs,layout.itemSize.height);
        if (layout.scrollDirection == UICollectionViewScrollDirectionVertical) {
            //垂直滚动
            if ((originX + itemSize.width + layout.sectionInset.right) > width) {
                originX = layout.sectionInset.left;
                originY += layout.itemSize.height + layout.minimumLineSpacing;
                contentViewHeight += layout.itemSize.height + layout.minimumLineSpacing;
            }
        }
        originX += itemSize.width + layout.minimumInteritemSpacing;
    }
    contentViewHeight += layout.sectionInset.bottom;
    return contentViewHeight;
}

@end
