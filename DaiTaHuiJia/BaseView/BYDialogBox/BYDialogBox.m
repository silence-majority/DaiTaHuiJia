//
//  BYDialogBox.m
//  BYTagView
//
//  Created by xy_yanfa_imac on 2018/1/11.
//

#import "BYDialogBox.h"
@interface BYDialogBox()
@property (nonatomic,strong) CAShapeLayer *arrowMarkLayer;
//BYDialogBox的顶点相对于自己的坐标，通过ratio和bound来计算
@property (nonatomic,assign) CGPoint peakPoint;

@property (nonatomic,strong) UITapGestureRecognizer *gesture;
@end

@implementation BYDialogBox
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor clearColor];
        [self addGestureRecognizer:self.gesture];
        _arrowMarkHeight = 10;
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (UITapGestureRecognizer *)gesture{
    if (!_gesture) {
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchAction)];
        _gesture = gesture;
    }
    return _gesture;
}

- (void)touchAction{
    if (_touchBlock) {
        _touchBlock();
    }
}

- (UIView *)contentView{
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.layer.cornerRadius = 4;
        _contentView = view;
    }
    return _contentView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor whiteColor];
        label.hidden = true;
        label.textAlignment = NSTextAlignmentCenter;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

- (void)setJointPoint:(CGPoint)jointPoint{
    _jointPoint = jointPoint;
    [self setNeedsLayout];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _titleLabel.frame = _contentView.bounds;
    _contentView.frame = CGRectMake(_arrowMarkHeight, _arrowMarkHeight, self.bounds.size.width-_arrowMarkHeight*2, self.bounds.size.height-_arrowMarkHeight*2);
    _contentView.backgroundColor = _themeColor;
    _contentView.alpha = _themeAlpha;
    switch (_orientation) {
        case BYDialogBoxOrientationUP:{
            _peakPoint = CGPointMake((self.frame.size.width-_arrowMarkHeight*2)/(_ratio+1)*_ratio+_arrowMarkHeight, 0);
            CGPoint origin = CGPointMake(_jointPoint.x-_peakPoint.x, _jointPoint.y);
            self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
            break;
        }
        case BYDialogBoxOrientationDown:{
            _peakPoint = CGPointMake((self.frame.size.width-_arrowMarkHeight*2)/(_ratio+1)*_ratio+_arrowMarkHeight, self.frame.size.height);
            CGPoint origin = CGPointMake(_jointPoint.x-_peakPoint.x, _jointPoint.y-_peakPoint.y);
            self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
            break;
        }
        case BYDialogBoxOrientationLeft:{
            _peakPoint = CGPointMake(0, ((self.frame.size.height-_arrowMarkHeight*2)/(_ratio+1)*_ratio)+_arrowMarkHeight);
            CGPoint origin = CGPointMake(_jointPoint.x, _jointPoint.y-_peakPoint.y);
            self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
            break;
        }
        case BYDialogBoxOrientationRight:{
            _peakPoint = CGPointMake(self.bounds.size.width, ((self.frame.size.height-_arrowMarkHeight*2)/(_ratio+1)*_ratio)+_arrowMarkHeight);
            CGPoint origin = CGPointMake(_jointPoint.x-self.bounds.size.width, _jointPoint.y-_peakPoint.y);
             self.frame = CGRectMake(origin.x, origin.y, self.frame.size.width, self.frame.size.height);
            break;
        }
        default:
            break;
    }
    
    [self.layer addSublayer:self.arrowMarkLayer];
    _arrowMarkLayer.opacity = _themeAlpha;
}

- (CAShapeLayer *)arrowMarkLayer{
    if(!_arrowMarkLayer){
        CAShapeLayer *layer = [CAShapeLayer layer];
        UIBezierPath *trianglePath = [UIBezierPath bezierPath];
        switch (_orientation) {
            case BYDialogBoxOrientationUP:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, _arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, _arrowMarkHeight)];// 等腰直角三角形
                break;
            }
            case BYDialogBoxOrientationDown:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, self.frame.size.height - _arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, self.frame.size.height - _arrowMarkHeight)];// 等腰直角三角形
                break;
            }
            case BYDialogBoxOrientationLeft:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, _peakPoint.y+_arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x+_arrowMarkHeight, _peakPoint.y-_arrowMarkHeight)];// 等腰直角三角形
                break;
            }
            case BYDialogBoxOrientationRight:{
                [trianglePath moveToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, _peakPoint.y-_arrowMarkHeight)];//1.732/3.0*_arrowMarkHeight -> 等边三角形
                [trianglePath addLineToPoint:_peakPoint];
                [trianglePath addLineToPoint:CGPointMake(_peakPoint.x-_arrowMarkHeight, _peakPoint.y+_arrowMarkHeight)];// 等腰直角三角形
                break;
            }
            default:
                break;
        }
        [trianglePath closePath];
        layer.path = trianglePath.CGPath;
        layer.backgroundColor = _themeColor.CGColor;
        _arrowMarkLayer = layer;
    }
    return _arrowMarkLayer;
}

@end
