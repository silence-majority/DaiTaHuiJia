//
//  BYEvaluateStar.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/12.
//

#import "BYEvaluateStar.h"

@interface BYEvaluateStar()
@property (nonatomic,strong) UIImage* normalImage;
@property (nonatomic,strong) UIImage* selectedImage;
@property (nonatomic,assign) NSUInteger baseTag;
@property (nonatomic,assign) NSUInteger count;
@end

@implementation BYEvaluateStar

- (instancetype)initWithCountOfStar:(NSUInteger)count originScore:(NSUInteger)originScore normalImage:(UIImage *)normalImage selectedImage:(UIImage *)seletedImage{
    if (self = [super init]){
        _count = count;
        _score = originScore;
        if (_score > _count){
            _score = 0;
        }
        _normalImage = normalImage;
        _selectedImage = seletedImage;
        _starSize = CGSizeMake(30, 30);
        _baseTag = 200;
        for (NSUInteger i = 1; i <= _count; i++){
            UIButton *button = [[UIButton alloc] init];
            button.tag = _baseTag+i;
            [button setImage:_normalImage forState:UIControlStateNormal];
            [button setImage:_selectedImage forState:UIControlStateSelected];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            if (i <= _score){
                [button setSelected:true];
            }else{
                [button setSelected:false];
            }
        }
    }
    return self;
}

- (instancetype)initWithCountOfStar:(NSUInteger)count originScore:(CGFloat)originScore maskImage:(UIImage *)maskImage normalColor:(UIColor *)normalColor focusColor:(UIColor *)focusColor{
    if (self = [super init]){
        _count = count;
        _score = originScore;
        if (_score > _count){
            _score = 0;
        }
        _starSize = CGSizeMake(30, 30);
        _baseTag = 200;
        for (NSUInteger i = 1; i <= _count; i++){
            BYStarButton *button = [[BYStarButton alloc] init];
            button.tag = _baseTag+i;
            button.normalColor = normalColor;
            button.focusColor = focusColor;
            button.maskImage = maskImage;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            if (i <= _score){
                button.score = 1;
            }else{
                if (i < _score+1){
                    button.score = _score+1 - i;
                }
            }
        }
    }
    return self;
}

- (void)setScore:(CGFloat)score{
    _score = score;
    for (NSUInteger i = 1; i <= _count; i++){
        BYStarButton *button = [self viewWithTag:_baseTag+i];
        if (i <= _score){
            button.score = 1;
        }else{
            if (i < _score+1){
                button.score = _score+1 - i;
            }else{
                button.score = 0;
            }
        }
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat centerY = self.bounds.size.height/2;
    for (NSUInteger i = 1; i <= _count; i++){
        UIButton *button = [self viewWithTag:(_baseTag+i)];
        button.frame = CGRectMake(0, 0, _starSize.width, _starSize.height);
        button.center = CGPointMake((_starSize.width/2)+(_starSize.width+_interSpace)*(i-1), centerY);
    }
}

- (void)buttonAction:(UIButton *)sender{
    if ([sender isKindOfClass:[BYStarButton class]]){
        if (sender.tag > _score+_baseTag) {
            if (_score == 0){
                _score = 1;
            }
            for (NSUInteger index = _score+_baseTag; index <= sender.tag; index++){
                BYStarButton *button = [self viewWithTag:index];
                button.score = 1;
            }
        }else if(sender.tag < _score+_baseTag){
            for (NSUInteger index = sender.tag+1; index <= _baseTag+_score; index++){
                BYStarButton *button = [self viewWithTag:index];
                button.score = 0;
            }
        }
    }else{
        if (sender.tag > _score+_baseTag) {
            if (_score == 0){
                _score = 1;
            }
            for (NSUInteger index = _score+_baseTag; index <= sender.tag; index++){
                UIButton *button = [self viewWithTag:index];
                [button setSelected:true];
            }
        }else if(sender.tag < _score+_baseTag){
            for (NSUInteger index = sender.tag+1; index <= _baseTag+_score; index++){
                UIButton *button = [self viewWithTag:index];
                [button setSelected:false];
            }
        }
    }
    
    _score = sender.tag - _baseTag;
    if(_evaluateFinish){
        _evaluateFinish(_score);
    }
}

@end

