//
//  ImageCollectionViewCell.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+UIColor_Hex.h"
@implementation ImageCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    _imageView.image = [UIImage imageNamed:@"sunyizhen"];
    return self;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        UIImageView *imageView =  [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = true;
        _imageView = imageView;
    }
    return _imageView;
}
@end
