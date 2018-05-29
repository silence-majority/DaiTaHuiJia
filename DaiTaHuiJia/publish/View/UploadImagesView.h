//
//  UploadImagesView.h
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/29.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,UploadImagesViewStyle){
    UploadImagesViewStyleNormal = 0,
    UploadImagesViewStyleWithDescribe
};

@interface UploadImagesView : UIView
@property (nonatomic,assign) UploadImagesViewStyle style;
@property (nonatomic,strong) NSMutableArray <UIImage *> *imagesList;
@property (nonatomic,copy) void (^addImageBlock)(NSUInteger maxCount);
- (instancetype)initWithFrame:(CGRect)frame style:(UploadImagesViewStyle)style;
@end
