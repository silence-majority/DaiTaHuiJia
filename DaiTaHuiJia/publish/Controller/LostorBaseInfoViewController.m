//
//  LostorBaseInfoViewController.m
//  DaiTaHuiJia
//
//  Created by 徐小平 on 2018/5/26.
//  Copyright © 2018年 徐谦. All rights reserved.
//

#import "LostorBaseInfoViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "BaseInfoHeader.h"
#import "LostorBaseInfoViewModel.h"
#import <Masonry/Masonry.h>
#import "ContentFillTableViewCell.h"
#import "BaseInfoFooter.h"
#import "LostorHealthInfoViewController.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "TZImagePickerController/TZImagePickerController.h"
#import "DatePickerPopView.h"
#import "GenderPickerPopView.h"
#import "NSDictionary+ValueForKey.h"
#import "RegionPickerView.h"
@interface LostorBaseInfoViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate>
@property (nonatomic,strong) LostorBaseInfoViewModel *viewModel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) BaseInfoHeader *tableHeader;
@property (nonatomic,strong) BaseInfoFooter *tableFooter;
@end

@implementation LostorBaseInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [LostorBaseInfoViewModel new];
    self.navTitle = @"完善信息（1/3）";
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    [self.view bringSubviewToFront:self.by_navigationBar];
    [self.rigthButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.rigthButton setTitleColor:[UIColor colorWithHexString:COLOR_THEME_STR] forState:UIControlStateNormal];
    self.rigthButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.rigthButton addTarget:self action:@selector(nextStepAction) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof(self) weakSelf = self;
    [self.tableHeader setImageBlock:^{
        [weakSelf showImageSelectionAction];
    }];
    [self bindViewModel];
}

- (void)bindViewModel{
    __weak typeof(self) weakSelf = self;
    [RACObserve(self.viewModel, portrait) subscribeNext:^(UIImage *image) {
        if (image) {
            weakSelf.tableHeader.imageView.image = image;
        }
    }];
}

- (void)nextStepAction{
    LostorHealthInfoViewController *target = [[LostorHealthInfoViewController alloc] init];
    [self.navigationController pushViewController:target animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor colorWithHexString:@"0xFEFFFE"];
        tableView.delegate = self;
        tableView.dataSource = self;
        if (@available(iOS 11.0, *)) {
            tableView.estimatedSectionFooterHeight = 0;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        tableView.estimatedRowHeight = 100;
        tableView.rowHeight = UITableViewAutomaticDimension;
        [tableView registerClass:[ContentFillTableViewCell class] forCellReuseIdentifier:@"ContentFillTableViewCellId"];
    
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableHeader = [[BaseInfoHeader alloc] initWithFrame:CGRectMake(0, 0, screenW, 120)];
        [_tableHeader setTitle:@"关于他，\n我们需要多些了解"];
        tableView.tableHeaderView = _tableHeader;
       
        
        _tableFooter = [[BaseInfoFooter alloc] initWithFrame:CGRectMake(0, 0, screenW, 120)];
        tableView.tableFooterView = _tableFooter;
        _tableView = tableView;
        
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentFillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContentFillTableViewCellId" forIndexPath:indexPath];
    if (indexPath.row == 0){
        cell.titleLabel.text = @"姓名";
        cell.indicateLabel.text = @"请填写";
        cell.fillStyle = ContentFillTableViewCellStyleInput;
    } else if (indexPath.row == 1){
        cell.titleLabel.text = @"性别";
        cell.indicateLabel.text = @"请选择";
        cell.fillStyle = ContentFillTableViewCellStylePick;
    } else if (indexPath.row == 2){
        cell.titleLabel.text = @"出生日期";
        cell.indicateLabel.text = @"请选择";
        cell.fillStyle = ContentFillTableViewCellStylePick;
    } else if (indexPath.row == 3){
        cell.titleLabel.text = @"身份证号";
        cell.indicateLabel.text = @"请填写";
        cell.fillStyle = ContentFillTableViewCellStyleInput;
    } else if (indexPath.row == 4){
        cell.titleLabel.text = @"区县";
        cell.indicateLabel.text = @"请选择";
        cell.fillStyle = ContentFillTableViewCellStylePick;
    } else {
        cell.titleLabel.text = @"详细地址";
        cell.indicateLabel.text = @"请填写";
        cell.fillStyle = ContentFillTableViewCellStyleInput;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ContentFillTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.fillStyle == ContentFillTableViewCellStyleInput) {
        [cell.textField becomeFirstResponder];
    }
    if (indexPath.row == 1) {
        GenderPickerPopView *popView = [[GenderPickerPopView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            if (eventId == 1) {
                UserGender gender = [[eventParamDic numberOrNilForKey:@"gender"] integerValue];
                cell.describeText = gender == UserGenderMale ? @"男" : @"女";
            }
        }];
    }
    if (indexPath.row == 2) {
        DatePickerPopView *popView = [[DatePickerPopView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            if (eventId == 1) {
                cell.describeText = [eventParamDic stringOrNilForKey:@"dateText"];
            }
        }];
    }
    if (indexPath.row == 4) {
        RegionPickerView *popView = [[RegionPickerView alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:popView];
        [popView setEventBlock:^(NSInteger eventId, NSDictionary *eventParamDic) {
            if (eventId == 1) {
                cell.describeText = [eventParamDic stringOrNilForKey:@"regionName"];
            }
        }];
    }
}

- (void)showImageSelectionAction{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromCamera];
    }];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从相册中获取" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromAlbum];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [actionSheet addAction:cameraAction];
    [actionSheet addAction:albumAction];
    [actionSheet addAction:cancelAction];
    
    [self presentViewController:actionSheet animated:true completion:nil];
}

- (void)getImageFromCamera{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied){
        //无权限 做一个友好的提示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的相机->设置->隐私->相机" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:true completion:nil];
    } else {
        if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
            return;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = false;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)getImageFromAlbum{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
        //无权限 做一个友好的提示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请您设置允许APP访问您的相册->设置->隐私->照片" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:true completion:nil];
    }else{
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            self.viewModel.portrait = photos.firstObject;
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        self.viewModel.portrait = image;
    }
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
