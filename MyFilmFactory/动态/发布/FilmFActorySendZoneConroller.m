#import "FilmFActorySendZoneConroller.h"
#import <UITextView+ZWPlaceHolder.h>
#import <UITextView+ZWLimitCounter.h>
#import "FilmFactorySendZoneCollectionCell.h"
#import <HUPhotoBrowser-umbrella.h>
#import <RITLPhotos/RITLPhotos.h>

@interface FilmFActorySendZoneConroller ()<UICollectionViewDelegate,UICollectionViewDataSource,RITLPhotosViewControllerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong) UICollectionView * FilmFactorySendCollctionView;
@property(nonatomic,strong) NSMutableArray * FilmFactorySendDataArr;
@property(nonatomic,strong) UITextView * FilmFactoedTrenSendTextViews;
@property(nonatomic,strong) UIImagePickerController *FilmFctorTrenSendPickers;
@end

@implementation FilmFActorySendZoneConroller

-(NSMutableArray *)FilmFactorySendDataArr{
    if (!_FilmFactorySendDataArr) {
    _FilmFactorySendDataArr = [[NSMutableArray alloc]init];
    [_FilmFactorySendDataArr addObject:[UIImage imageNamed:@"tianjiatupian"]];
    }
    return _FilmFactorySendDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * FilmChatSenView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    UIButton * FilmChatCacnleBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(15), K(5), K(40), K(20))];
    [FilmChatCacnleBtn setTitle:@"取消" forState:UIControlStateNormal];
    FilmChatCacnleBtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [FilmChatCacnleBtn setTitleColor:LGDGaryColor forState:UIControlStateNormal];
    [FilmChatCacnleBtn addTarget:self action:@selector(FilmChatCacnleBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [FilmChatSenView addSubview:FilmChatCacnleBtn];
//    self.gk_navLeftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmChatSenView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmChatSenView];
    
    
    UIView * FilmChatSendViews =[[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    UIButton * FilmChatSendbtns = [[UIButton alloc]initWithFrame:CGRectMake(K(15), K(5), K(40), K(20))];
    [FilmChatSendbtns setTitle:@"发布" forState:UIControlStateNormal];
    FilmChatSendbtns.titleLabel.font = [UIFont systemFontOfSize:14];
    [FilmChatSendbtns setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [FilmChatSendbtns addTarget:self action:@selector(FilmChatSendbtnsClick) forControlEvents:UIControlEventTouchUpInside];
    [FilmChatSendViews addSubview:FilmChatSendbtns];
//    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmChatSendViews];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmChatSendViews];
    
    
    UITextView * FilmFactoedTrenSendTextViews = [[UITextView alloc]initWithFrame:CGRectMake(K(15), K(15), SCREEN_Width-K(20), K(120))];
    FilmFactoedTrenSendTextViews.zw_placeHolder = @"说点什么吧....";
    FilmFactoedTrenSendTextViews.zw_placeHolderColor = LGDGaryColor;
    FilmFactoedTrenSendTextViews.font = [UIFont systemFontOfSize:14];
    FilmFactoedTrenSendTextViews.textColor = [UIColor blackColor];
    FilmFactoedTrenSendTextViews.zw_limitCount =  1500;
    [self.view addSubview:FilmFactoedTrenSendTextViews];
    _FilmFactoedTrenSendTextViews = FilmFactoedTrenSendTextViews;
    
    
    
    UICollectionViewFlowLayout * FilmChatSenLayout = [[UICollectionViewFlowLayout alloc]init];
    FilmChatSenLayout.sectionInset =  UIEdgeInsetsMake(0, K(15), 0, K(30));
    FilmChatSenLayout.itemSize  = CGSizeMake(K(100), K(100));
    UICollectionView * FilmChatSenLCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(FilmFactoedTrenSendTextViews.frame)+K(20), SCREEN_Width, K(200)) collectionViewLayout:FilmChatSenLayout];
    FilmChatSenLCollectionView.delegate = self;
    FilmChatSenLCollectionView.dataSource = self;
    FilmChatSenLCollectionView.showsVerticalScrollIndicator = NO;
    FilmChatSenLCollectionView.showsHorizontalScrollIndicator = NO;
    FilmChatSenLCollectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:FilmChatSenLCollectionView];
    [FilmChatSenLCollectionView registerClass:[FilmFactorySendZoneCollectionCell class] forCellWithReuseIdentifier:@"FilmFactorySendZoneCollectionCell"];
    _FilmFactorySendCollctionView = FilmChatSenLCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.FilmFactorySendDataArr.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactorySendZoneCollectionCell * FilmChatSenLCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilmFactorySendZoneCollectionCell" forIndexPath:indexPath];
    FilmChatSenLCell.FilmFactoryImgViewIcon.image = self.FilmFactorySendDataArr[indexPath.row];
    return FilmChatSenLCell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactorySendZoneCollectionCell * FilmChatSenLCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FilmFactorySendZoneCollectionCell" forIndexPath:indexPath];
    if (indexPath.row == self.FilmFactorySendDataArr.count -1) {
        [self FilmChatSenPhotVcs];
    }else{
        NSMutableArray * WindwounnTrenSendlDatas = self.FilmFactorySendDataArr;
        [WindwounnTrenSendlDatas removeLastObject];
        [HUPhotoBrowser showFromImageView:FilmChatSenLCell.FilmFactoryImgViewIcon withImages:WindwounnTrenSendlDatas atIndex:indexPath.row];
    }
    
}
- (void)photosViewController:(UIViewController *)viewController
images:(NSArray <UIImage *> *)images
                       infos:(NSArray <NSDictionary *> *)infos{
    [self.FilmFactorySendDataArr addObjectsFromArray:images];
    MJWeakSelf;
    [self.FilmFactorySendDataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImage * WindwounnTrenSendImg = (UIImage *)obj;
     if (WindwounnTrenSendImg == [UIImage imageNamed:@"tianjiatupian"]) {
         [weakSelf.FilmFactorySendDataArr removeObject:WindwounnTrenSendImg];
         *stop = YES;
     }
    }];
    [self.FilmFactorySendDataArr addObject:[UIImage imageNamed:@"tianjiatupian"]];
    [self.FilmFactorySendCollctionView reloadData];
    self.FilmFactorySendCollctionView.height = self.FilmFactorySendCollctionView.collectionViewLayout.collectionViewContentSize.height;
}

-(UIImagePickerController *)FilmFctorTrenSendPickers{
    if (!_FilmFctorTrenSendPickers) {
        _FilmFctorTrenSendPickers = [[UIImagePickerController alloc] init];
        _FilmFctorTrenSendPickers.delegate = self;
        _FilmFctorTrenSendPickers.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        _FilmFctorTrenSendPickers.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        _FilmFctorTrenSendPickers.allowsEditing = YES;
    }
    return _FilmFctorTrenSendPickers;
}
-(void)FilmChatSenPhotVcs{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        [LCProgressHUD showInfoMsg:errorStr];
        return;
    }
    RITLPhotosViewController *FilmChatSenPhobda = RITLPhotosViewController.photosViewController;
    FilmChatSenPhobda.configuration.maxCount = 5;
    FilmChatSenPhobda.configuration.containVideo = false;
    FilmChatSenPhobda.photo_delegate = self;
    [self presentViewController:FilmChatSenPhobda animated:true completion:^{}];
}

#pragma mark--发布
-(void)FilmChatSendbtnsClick{
    if (_FilmFactoedTrenSendTextViews.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"说点什么吧~"];
        return;
    }
  
    if ([ORAccountComponent checkLogin:YES]) {
        [LCProgressHUD showLoading:@""];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LCProgressHUD showSuccess:@"发布成功,请等待平台审核后显示!"];
            [self dismissViewControllerAnimated:YES completion:nil];
        });

    }    
}
-(void)FilmChatCacnleBtnClick{    
    [self.navigationController popViewControllerAnimated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


