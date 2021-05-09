//
//  ORHotDetailViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/24.
//

#import "ORHotDetailViewController.h"
#import "ORLikeView.h"
#import "ORHotVideoDetailDataModel.h"
#import "ORAddFavoriteDataModel.h"
#import "ORDeleteFavoriteDataModel.h"
#import "ORHotVideoPraiseDataModel.h"
#import "ORHotVideoRemovePraiseDataModel.h"
#import "ORVideoReportManager.h"
#import "ORShareTool.h"
#import "ORShareReportDataModel.h"


#define kTitleViewY     (ORKitMacros.statusBarHeight + 20.0f)
// 过渡中心点
#define kTransitionCenter   20.0f

@interface ORHotDetailViewController ()<ORHotVideoViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) ORHotVideoDetailDataModel *hotVideoDetailDataModel;
@property (nonatomic, strong) ORAddFavoriteDataModel *addFavoriteDataModel; // 添加收藏
@property (nonatomic, strong) ORDeleteFavoriteDataModel *deleteFavoriteDataModel; // 取消收藏
@property (nonatomic, strong) ORHotVideoPraiseDataModel *hotVideoPraiseDataModel; // 点赞
@property (nonatomic, strong) ORHotVideoRemovePraiseDataModel *hotVideoRemovePraiseDataModel; // 取消点赞
@property (nonatomic, strong) ORShareReportDataModel *shareReportDataModel; // 分享上报

@property (nonatomic, strong) UIButton              *backBtn;
@property (nonatomic, strong) UIButton              *moreBtn;

@property (nonatomic, strong) NSArray               *videos;
@property (nonatomic, assign) NSInteger             playIndex;
@property (nonatomic, assign) BOOL                  isSingleItem;

@property (nonatomic, copy) NSString *currentVideoId; // 当前视频ID

@property (nonatomic, assign) NSUInteger beginTimeStamp; // 开始时间戳
@property (nonatomic, assign) NSUInteger endTimeStamp; // 开始时间戳

@end

@implementation ORHotDetailViewController

#pragma mark - LifeCycle

- (instancetype)initWithVideoModel:(ORHotChannelDataItem *)videoItem
{
    if (self = [super init]) {
        self.videos = [@[videoItem] copy];
        self.playIndex = 0;
        self.isSingleItem = YES;
    }
    return self;
}

- (instancetype)initWithVideos:(NSArray *)videos index:(NSInteger)index
{
    if (self = [super init]) {
        self.videos = videos;
        self.playIndex = index;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.videoView vc_viewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.videoView vc_viewWillDisappear];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.videoView vc_viewDidDisappear];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - setupUI

- (void)setupUI
{    
    [self.view addSubview:self.videoView];
    [self.videoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
        
    [self.view addSubview:self.backBtn];
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.0f);
        make.top.equalTo(self.view).offset(ORKitMacros.statusBarHeight + 20.0f);
        make.width.height.mas_equalTo(44.0f);
    }];
        
//    [self.view addSubview:self.moreBtn];
//    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.view).offset(-15.0f);
//        make.centerY.equalTo(self.backBtn);
//    }];
}

#pragma mark - setupData

- (void)setupData
{
    self.view.backgroundColor = [UIColor blackColor];
    self.fd_prefersNavigationBarHidden = YES;
    
    // 配置数据
    if (self.isSingleItem) {
        [self.videoView setModels:self.videos index:self.playIndex canRefresh:NO];
    } else {
        [self.videoView setModels:self.videos index:self.playIndex];
    }
}

#pragma mark - ButtonAction

- (void)moreClick:(id)sender
{
    
}

- (void)backClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ORHotVideoViewDelegate

// 点赞
- (void)videoView:(ORHotVideoView *)videoView didClickPraise:(ORHotChannelDataItem *)videoModel
{
    if (![ORAccountComponent checkLogin:YES]) {
        return;
    }
    
    if (videoModel.like) {
        // 已点赞
        [self.hotVideoRemovePraiseDataModel removePraiseWithType:videoModel.idStr type:videoModel.type];
    } else {
        // 未点赞
        [self.hotVideoPraiseDataModel addPraiseWithType:videoModel.idStr type:videoModel.type];
    }
    self.currentVideoId = videoModel.idStr;
}

// 分享
- (void)videoView:(ORHotVideoView *)videoView didClickShare:(ORHotChannelDataItem *)videoModel
{
    if (![ORAccountComponent checkLogin:YES]) {
        return;
    }
    
    // 分享，弹出分享框
    NSString *contentUrl = [@"https://m.iorange99.com/#/pages/hotdot/hotdotDetail?" stringByAppendingFormat:@"id=%@&type=%@", videoModel.idStr, videoModel.type];
    [[ORShareTool sharedInstance] shareWithData:videoModel.videoName
                                       imageUrl:videoModel.coverImg
                                    description:videoModel.videoDesc
                                     contentUrl:contentUrl
                                      miniappId:@""
                                    miniappPath:@""
                                     useMiniapp:NO
                                    resultBlock:^(ShareResultType result) {
        if (result == ShareResultTypeSuccess) {
            [SVProgressHUD showInfoWithStatus:@"分享成功"];
            
            // 分享上报
            [self.shareReportDataModel shareReportWithType:videoModel.idStr type:videoModel.type];
        } else {
            [SVProgressHUD showInfoWithStatus:@"分享失败"];
        }
    }];
}

// 收藏
- (void)videoView:(ORHotVideoView *)videoView didClickCollect:(ORHotChannelDataItem *)videoModel
{
    if (![ORAccountComponent checkLogin:YES]) {
        return;
    }
    
    if (videoModel.favourite) {
        // 已收藏
        NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
        paramDic[@"id"] = videoModel.idStr;
        paramDic[@"type"] = videoModel.type;
        [self.deleteFavoriteDataModel deleteFavoriteWithData:[@[paramDic] mutableCopy]];
    } else {
        // 未收藏
        [self.addFavoriteDataModel addfavoriteWithType:videoModel.idStr type:videoModel.type];
    }
    self.currentVideoId = videoModel.idStr;
}

- (void)videoView:(ORHotVideoView *)videoView didPanWithDistance:(CGFloat)distance isEnd:(BOOL)isEnd
{
    // 手势下来刷新
    if (isEnd) {
        if (distance >= 2 * kTransitionCenter) { // 刷新
            
        } else {
            
        }
    } else {

    }
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isMemberOfClass:[ORHotVideoDetailDataModel class]]) {
        // 更新
        [self.videoView refreshUI:self.hotVideoDetailDataModel.hotVideoDetailItem];
    } else if ([gnhModel isMemberOfClass:[ORAddFavoriteDataModel class]]) {
        [self.videoView favorite:self.currentVideoId actionType:1];
    } else if ([gnhModel isMemberOfClass:[ORDeleteFavoriteDataModel class]]) {
        [self.videoView favorite:self.currentVideoId actionType:0];
    } else if ([gnhModel isMemberOfClass:[ORHotVideoPraiseDataModel class]]) {
        [self.videoView praise:self.currentVideoId actionType:1];
    } else if ([gnhModel isMemberOfClass:[ORHotVideoRemovePraiseDataModel class]]) {
        [self.videoView praise:self.currentVideoId actionType:0];
    } else if ([gnhModel isMemberOfClass:[ORShareReportDataModel class]]) {
        // 分享上报成功
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
}

#pragma mark - 懒加载
- (ORHotVideoView *)videoView
{
    if (!_videoView) {
        _videoView = [[ORHotVideoView alloc] init];
        _videoView.delegate = self;
        
        GNHWeakSelf;
        _videoView.updateVideoDetailCompleteBlock = ^(NSString * _Nonnull videoId) {
            if (ORShareAccountComponent.accesstoken.length) {
                if ([videoId isKindOfClass:[NSString class]]) {
                    [weakSelf.hotVideoDetailDataModel fetchVideoDetialWithId:videoId];
                }
            }
        };
    }
    return _videoView;
}

- (UIButton *)backBtn
{
    if (!_backBtn) {
        _backBtn = [UIButton new];
        [_backBtn setImage:[UIImage imageNamed:@"com_back_white"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
        [_backBtn setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];
    }
    return _backBtn;
}

- (UIButton *)moreBtn
{
    if (!_moreBtn) {
        _moreBtn = [UIButton new];
        [_moreBtn setImage:[UIImage imageNamed:@"com_more_white"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
        [_moreBtn setEnlargeEdgeWithTop:20 right:20 bottom:20 left:20];
    }
    return _moreBtn;
}

- (ORHotVideoDetailDataModel *)hotVideoDetailDataModel
{
    if (!_hotVideoDetailDataModel) {
        _hotVideoDetailDataModel = [self produceModel:[ORHotVideoDetailDataModel class]];
    }
    return _hotVideoDetailDataModel;
}

- (ORAddFavoriteDataModel *)addFavoriteDataModel
{
    if (!_addFavoriteDataModel) {
        _addFavoriteDataModel = [self produceModel:[ORAddFavoriteDataModel class]];
    }
    return _addFavoriteDataModel;
}

- (ORDeleteFavoriteDataModel *)deleteFavoriteDataModel
{
    if (!_deleteFavoriteDataModel) {
        _deleteFavoriteDataModel = [self produceModel:[ORDeleteFavoriteDataModel class]];
    }
    return _deleteFavoriteDataModel;
}

- (ORHotVideoPraiseDataModel *)hotVideoPraiseDataModel
{
    if (!_hotVideoPraiseDataModel) {
        _hotVideoPraiseDataModel = [self produceModel:[ORHotVideoPraiseDataModel class]];
    }
    return _hotVideoPraiseDataModel;
}

- (ORHotVideoRemovePraiseDataModel *)hotVideoRemovePraiseDataModel
{
    if (!_hotVideoRemovePraiseDataModel) {
        _hotVideoRemovePraiseDataModel = [self produceModel:[ORHotVideoRemovePraiseDataModel class]];
    }
    return _hotVideoRemovePraiseDataModel;
}

- (ORShareReportDataModel *)shareReportDataModel
{
    if (!_shareReportDataModel) {
        _shareReportDataModel = [self produceModel:[ORShareReportDataModel class]];
    }
    return _shareReportDataModel;
}

@end
