//
//  RegionPickerView.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/28.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "RegionPickerView.h"
#import <Masonry/Masonry.h>
#import "ProvinceModel.h"
#import "CityModel.h"
#import "DistrictModel.h"
@interface RegionPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) UIButton *cancelButton;
@property (nonatomic,strong) UIButton *sureButton;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *operateView;
@property (nonatomic,strong) NSArray<ProvinceModel *> *regionList;

@property (nonatomic,assign) NSUInteger provinceIndex;
@property (nonatomic,assign) NSUInteger cityIndex;
@property (nonatomic,assign) NSUInteger districtIndex;
@end

@implementation RegionPickerView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.contentView];
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(0);
            make.height.mas_equalTo(260);
        }];
        
        [_contentView addSubview:self.pickerView];
        [_pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.centerX.offset(0);
            make.top.offset(70);
            make.bottom.offset(-20);
        }];
        
        [_contentView addSubview:self.operateView];
        [_operateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.offset(50);
        }];
        
        [_operateView addSubview:self.cancelButton];
        [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(12);
            make.centerY.offset(0);
        }];
        
        [_operateView addSubview:self.sureButton];
        [_sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-12);
            make.centerY.offset(0);
        }];
        
        [_operateView addSubview:self.titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
        }];
        _contentView.transform = CGAffineTransformMakeTranslation(0, 260);
        __weak typeof(self) weakSelf = self;
        [self setAnimationBlock:^(NSInteger animationId) {
            if (animationId == 0) {
                weakSelf.contentView.transform = CGAffineTransformIdentity;
            } else {
                weakSelf.contentView.transform = CGAffineTransformMakeTranslation(0, 260);
                
            }
        }];
        
        [_cancelButton addTarget:self action:@selector(dismissPopView) forControlEvents:UIControlEventTouchUpInside];
        [_sureButton addTarget:self action:@selector(sureButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    _titleLabel.text = @"请选择省市区";
    
     NSArray *regions = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"regionGroupByThreeLevelUseOringinType" ofType:@"plist"]];
    NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:regions.count];
    for (NSDictionary *dic in regions) {
        ProvinceModel *model = [[ProvinceModel alloc] initWithDic:dic];
        [temp addObject:model];
    }
    _regionList = temp;
    _provinceIndex = 0;
    _cityIndex = 0;
    _districtIndex = 0;
    [_pickerView reloadAllComponents];

    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        _contentView = view;
    }
    return _contentView;
}

- (UIPickerView *)pickerView{
    if (!_pickerView) {
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.showsSelectionIndicator = true;
        _pickerView = pickerView;
    }
    return _pickerView;
}

- (UIView *)operateView {
    if (!_operateView) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithHexString:@"0xEEEEEE"];
        _operateView = view;
    }
    return _operateView;
}

- (UIButton *)cancelButton{
    if (!_cancelButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancelButton = button;
    }
    return _cancelButton;
}

- (UIButton *)sureButton{
    if (!_sureButton) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        _sureButton = button;
    }
    return _sureButton;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor blackColor];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return _regionList.count;
    } else if (component == 1){
        
        return _regionList[_provinceIndex].cityLists.count;
    } else {
        if (_regionList[_provinceIndex].cityLists.count == 0) {
            return 0;
        }
        return _regionList[_provinceIndex].cityLists[_cityIndex].districtLists.count;
    }
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0) {
        return _regionList[row].provinceName;
    } else if (component == 1){
        return _regionList[_provinceIndex].cityLists[row].cityName;
    } else {
        return _regionList[_provinceIndex].cityLists[_cityIndex].districtLists[row].districtName;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:14]];
    }
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        _cityIndex = 0;
        _districtIndex = 0;
        _provinceIndex = row;
    } else if (component == 1) {
        _districtIndex = 0;
        _cityIndex = row;
    } else {
        _districtIndex = row;
    }
    [_pickerView reloadAllComponents];
}

- (void)sureButtonAction{
    if (self.eventBlock) {
        NSString *regionCode;
        NSString *regionName = _regionList[_provinceIndex].provinceName;
        if (_regionList[_provinceIndex].cityLists.count != 0) {
            NSString *cityName = _regionList[_provinceIndex].cityLists[_cityIndex].cityName;
            regionName = [regionName stringByAppendingString:cityName];
            if (_regionList[_provinceIndex].cityLists[_cityIndex].districtLists.count != 0) {
                NSString *districtName = _regionList[_provinceIndex].cityLists[_cityIndex].districtLists[_districtIndex].districtName;
                regionName = [regionName stringByAppendingString:districtName];
                regionCode =  _regionList[_provinceIndex].cityLists[_cityIndex].districtLists[_districtIndex].regionCode;
            } else {
                 regionCode =  _regionList[_provinceIndex].cityLists[_cityIndex].regionCode;
            }
        } else {
            regionCode =  _regionList[_provinceIndex].regionCode;
        }
        
        self.eventBlock(1, @{@"regionName":regionName,
                             @"regionCode":regionCode
                             });
    }
    
    [self dismissPopView];
}

@end
