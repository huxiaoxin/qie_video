//
//  ORRecommendViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/11.
//

#import "ORRecommendViewController.h"
#import "ORFetchSubChanelMenuDataModel.h"
#import "ORBannerDataModel.h"
#import <CWCarousel.h>
#import "ORRecommendTableViewCell.h"
#import "ORH5ViewController.h"
#import "ORChannelMoreViewController.h"
#import "ORChannelNoDataView.h"
#import "ORChannelSenceDataModel.h"

#define kImageViewTag 666
#define kDescViewTag 999

#define kchannelDataSize  18 // 默认请求20条数据

@interface ORRecommendViewController () <CWCarouselDatasource, CWCarouselDelegate>
@property (nonatomic, strong) ORFetchSubChanelMenuDataModel *subChanelMenuDataModel; // 子菜单
@property (nonatomic, strong) ORBannerDataModel *bannerDataModel;
@property (nonatomic, strong) ORChannelSenceDataModel *channelSenceDataModel; // 模块数据

@property (nonatomic, strong) CWCarousel *carousel;
@property (nonatomic, strong) UIView *animationView;

/// 数据源
@property (nonatomic, strong) NSArray *bannerDataArr;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) ORChannelNoDataView *noDataView; // 默认页

@end

@implementation ORRecommendViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupDatas];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.carousel controllerWillAppear];
    
    // 重新滚动
    [self.carousel resumePlay];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.carousel controllerWillDisAppear];
    
    [self.timer invalidate];
    self.timer = nil;
    
    // 暂停banner滚动
    [self.carousel pause];
}

#pragma mark - SetupData

- (void)setupUI
{
    CGRect rect = self.tableView.frame;
    rect.size.height = self.view.size.height;
    rect.origin.x = 0.0f;
    rect.origin.y = 0.0f;
    self.tableView.frame = rect;
    self.bannerDataArr = nil;
    
    self.isNeedPullDownToRefreshAction = YES;
    self.isNeedPullUpToRefreshAction = YES;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = gnh_color_b;
    
    // 配置数据
    GNHTableViewSectionObject *hotspotSectionObject = [[GNHTableViewSectionObject alloc] init];
    GNHTableViewSectionObject *filmSectionObject = [[GNHTableViewSectionObject alloc] init];

    self.sections = [@[hotspotSectionObject, filmSectionObject] mutableCopy];
    [self.tableView reloadData];
    
    // 表头
    self.animationView.backgroundColor = gnh_color_b;
    self.animationView.clipsToBounds = YES;
    self.tableView.tableHeaderView = self.animationView;
    
    UIView *gapView = [UIView ly_ViewWithColor:gnh_color_b];
    [self.animationView addSubview:gapView];
    [gapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.animationView);
        make.height.mas_equalTo(7.5f);
    }];
    
    if(self.carousel) {
        [self.carousel releaseTimer];
        [self.carousel removeFromSuperview];
        self.carousel = nil;
    }
    CWFlowLayout *flowLayout = [[CWFlowLayout alloc] initWithStyle:CWCarouselStyle_H_1];
    flowLayout.itemSpace_H = 20.0f;
    flowLayout.itemWidth = kScreenWidth - 20;
    CWCarousel *carousel = [[CWCarousel alloc] initWithFrame:CGRectZero
                                                    delegate:self
                                                  datasource:self
                                                  flowLayout:flowLayout];
    carousel.translatesAutoresizingMaskIntoConstraints = NO;
    carousel.pageControl.pageIndicatorTintColor = UIColor.lightTextColor;
    carousel.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [carousel.pageControl setTransform:CGAffineTransformMakeScale(0.75, 0.75)];
    [self.animationView addSubview:carousel.pageControl]; // 添加到aniView
    [self.animationView addSubview:carousel];
    [self.animationView bringSubviewToFront:carousel.pageControl];
    [carousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(7.5f);
        make.left.right.equalTo(self.animationView);
        make.bottom.equalTo(self.animationView).offset(-7.5f);
    }];
    carousel.isAuto = YES;
    carousel.autoTimInterval = 2;
    carousel.endless = YES;
    carousel.backgroundColor = UIColor.clearColor;
        
    [carousel registerViewClass:[UICollectionViewCell class] identifier:@"cellId"];
    self.carousel = carousel;
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isKindOfClass:[ORIndexChannelItem class]]) {
        return [ORRecommendTableViewCell class];
    }
    
    return nil;
}

- (void)configForCell:(GNHBaseTableViewCell *)cell item:(id)item
{
    GNHWeakSelf;
    if ([item isKindOfClass:[ORIndexChannelItem class]]) {
        ORRecommendTableViewCell *recommendTableViewCell = (ORRecommendTableViewCell *)cell;
        recommendTableViewCell.channelItemCallBack = ^(ORVideoBaseItem *dataItem, NSInteger type) {
            if (type == 1) {
                // 今日热门
                ORChannelMoreViewController *channelMoreVC = [[ORChannelMoreViewController alloc] init];
                channelMoreVC.typeId = @"hotspot";
                [weakSelf.navigationController pushViewController:channelMoreVC animated:YES];
            } else if (type == 2) {
                // 精选电影
                ORChannelMoreViewController *channelMoreVC = [[ORChannelMoreViewController alloc] init];
                channelMoreVC.typeId = @"selectedFilms";
                [weakSelf.navigationController pushViewController:channelMoreVC animated:YES];
            } else {
                // 详情
                [[ORPlayerManager sharedInstance] jumpChannelWith:dataItem.idStr type:dataItem.type cover:dataItem.coverImg];

            }
        };
    }
}

#pragma mark - setupData

- (void)setupDatas
{
    // 获取数据
    [self pullDownToRefreshAction];
}

- (void)setTypeId:(NSString *)typeId
{
    _typeId = typeId;
    
    // 刷新
    [self pullDownToRefreshAction];
}

#pragma mark - CWCarouselDelegate Delegate

- (NSInteger)numbersForCarousel
{
    return self.bannerDataArr.count;
}

- (UICollectionViewCell *)viewForCarousel:(CWCarousel *)carousel indexPath:(NSIndexPath *)indexPath index:(NSInteger)index
{
    UICollectionViewCell *cell = [carousel.carouselView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    cell.contentView.backgroundColor = UIColor.clearColor;
    UIImageView *imgView = [cell.contentView viewWithTag:kImageViewTag];
    if(!imgView) {
        imgView = [[UIImageView alloc] initWithFrame:cell.contentView.bounds];
        imgView.tag = kImageViewTag;
        [cell.contentView addSubview:imgView];
        cell.layer.masksToBounds = YES;
        cell.layer.cornerRadius = 10;
    }
    
    UIImageView *coverImgView = [cell.contentView viewWithTag:200];
    if(!coverImgView) {
        coverImgView = [UIImageView ly_ImageViewWithImageName:@"index_cover_bg"];
        coverImgView.frame = CGRectMake(0, cell.contentView.bounds.size.height - 40.0f, cell.contentView.bounds.size.width, 40.0f);
        coverImgView.tag = 200;
        [cell.contentView addSubview:coverImgView];
    }
        
    UILabel *descLabel = [cell.contentView viewWithTag:kDescViewTag];
    if (!descLabel) {
        descLabel = [UILabel ly_LabelWithTitle:@"" font:zy_blodFontSize17 titleColor:gnh_color_b];
        descLabel.frame = CGRectMake(12, cell.contentView.bounds.size.height - 40.0f, cell.contentView.bounds.size.width, 40.0f);
        descLabel.tag = kDescViewTag;
        [cell.contentView addSubview:descLabel];
    }
    
    ORBannerDataItem *bannerDataItem = (ORBannerDataItem *)[self.bannerDataArr mdf_safeObjectAtIndex:index];
    [imgView sd_setImageWithURL:bannerDataItem.image.urlWithString placeholderImage:[UIImage imageNamed:@"index_banner_cover_default"]];
    descLabel.text = bannerDataItem.desc;

    return cell;
}

- (void)CWCarousel:(CWCarousel *)carousel didSelectedAtIndex:(NSInteger)index
{
    NSLog(@"...%ld...", (long)index);
    ORBannerDataItem *dataItem = (ORBannerDataItem *)[self.bannerDataArr mdf_safeObjectAtIndex:index];
    switch (dataItem.redirectType) {
        case BannerRedirectTypeH5: {
            UIViewController *vc = [[ORH5ViewController alloc] initWithURL:dataItem.redirectLink.urlWithString];
            vc.edgesForExtendedLayout = UIRectEdgeNone;
            [self.navigationController pushViewController:vc animated:YES];
            
            break;
        }
        case BannerRedirectTypeNative: {
            break;
        }
        case BannerRedirectTypeVideoDetail: {
            // 详情
            NSDictionary *paramDic = dataItem.redirectLink.paramsFromURL;
            NSString *videoID = paramDic[@"videoId"];
            NSString *videoType = paramDic[@"videoType"];
            if (videoID.length && videoType.length) {
                [[ORPlayerManager sharedInstance] jumpChannelWith:videoID type:videoType cover:@""];
            }
            break;;
        }
        default:
            break;
    }
}

- (void)CWCarousel:(CWCarousel *)carousel didStartScrollAtIndex:(NSInteger)index indexPathRow:(NSInteger)indexPathRow
{
    NSLog(@"开始滑动: %ld", index);
}

- (void)CWCarousel:(CWCarousel *)carousel didEndScrollAtIndex:(NSInteger)index indexPathRow:(NSInteger)indexPathRow
{
    NSLog(@"结束滑动: %ld", index);
}

#pragma mark - Refresh

- (void)refreshRecommendFilm
{
    // 请求精选电影
    self.recommecListDataModel.scene = @"selectedFilms";
    BOOL flag = [self.recommecListDataModel fetchHomeChannelWithPage:self.dataPage limit:kchannelDataSize scene:@"selectedFilms"]; // 默认一次性请求个
    if (flag) {
        self.recommecListDataModel.loadType = GNHDataModelLoadTypeRefresh;
    } else {
        self.dataPage = self.preDataPage;
    }
}

- (void)pullDownToRefreshAction
{
    [super pullDownToRefreshAction];
    self.isNeedPullUpToRefreshAction = YES;
        
    self.dataPage = 1;
    
    // 请求今日热播，首页默认最多6条
    self.recommecListDataModel.scene = @"hotspot";
    BOOL flag = [self.channelSenceDataModel fetchChannelSenceDataWithType:self.typeId]; // 默认一次性请求个
    if (flag) {
        self.channelSenceDataModel.loadType = GNHDataModelLoadTypeRefresh;
    } else {
        self.dataPage = self.preDataPage;
        [self stopPullDownToRefreshAnimation];
    }

    // 获取banner
    [self.bannerDataModel fetchBannerWithType:self.typeId];
}

- (void)pullUpToRefreshAction
{
    [super pullUpToRefreshAction];
    
    self.preDataPage = self.dataPage;

    self.dataPage += 1;
    self.recommecListDataModel.scene = @"selectedFilms";
    BOOL flag = [self.recommecListDataModel fetchHomeChannelWithPage:self.dataPage limit:kchannelDataSize + 1 scene:@"selectedFilms"];
    if (flag) {
        self.recommecListDataModel.loadType = GNHDataModelLoadTypeLoadMore;
    } else {
        self.dataPage = self.preDataPage;
        [self stopPullUpToRefreshAnimation];
    }
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    
    if ([gnhModel isMemberOfClass:[ORBannerDataModel class]]) {
        self.bannerDataArr = self.bannerDataModel.bannerItem.data;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.carousel freshCarousel];
            
            CGSize pointSize = [self.carousel.pageControl sizeForNumberOfPages:self.bannerDataArr.count];
            [self.carousel.pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.animationView).offset(-15.0f);
                make.right.equalTo(self.animationView).offset(-12.0f);
                make.size.mas_equalTo(CGSizeMake(pointSize.width, 30.0f));
            }];
        });
    } else if ([gnhModel isMemberOfClass:[ORRecommecListDataModel class]]) {

        if (gnhModel.loadType == GNHDataModelLoadTypeRefresh) {
            // 下拉刷新，数据还原
            [self stopPullDownToRefreshAnimation];
            
            if ([self.recommecListDataModel.scene isEqualToString:@"hotspot"]) {
                // 今日热播
                GNHTableViewSectionObject *sectionObject = self.sections.firstObject;
                if (self.recommecListDataModel.hotspotChannelItem.list.count) {
                    ORIndexChannelItem *cellItem = [[ORIndexChannelItem alloc] init];
                    cellItem.list = [NSMutableArray arrayWithArray:self.recommecListDataModel.hotspotChannelItem.list];
                    sectionObject.items = [@[cellItem] mutableCopy];
                } else {
                    sectionObject.items = nil;
                }
                // 获取精选电影
                [self refreshRecommendFilm];
            } else {
                // 精选电影1
                GNHTableViewSectionObject *sectionObject = self.sections.lastObject;

                if (self.recommecListDataModel.filmChannelItem.list.count) {
                    ORIndexChannelItem *cellItem = [[ORIndexChannelItem alloc] init];
                    cellItem.list = [NSMutableArray arrayWithArray:self.recommecListDataModel.filmChannelItem.list];
                    sectionObject.items = [@[cellItem] mutableCopy];
                } else {
                    sectionObject.items = nil;
                }
            }
        } else {
            GNHTableViewSectionObject *sectionObject = self.sections.lastObject;

            // 上拉加载
            NSMutableArray *channelItems = [sectionObject.items mutableCopy];
            if (channelItems.count) {
                ORIndexChannelItem *cellItem = channelItems.firstObject;
                [cellItem.list mdf_safeAddObjectsFromArray:self.recommecListDataModel.filmChannelItem.list];
                sectionObject.items = [@[cellItem] mutableCopy];
            }
            
            if (self.recommecListDataModel.filmChannelItem.list.count < self.recommecListDataModel.filmChannelItem.pageSize) {
                [self reloadDataWithHasMore:NO];
                
                if (!self.recommecListDataModel.filmChannelItem.list.count) {
                    // 没有数据，刷新页数不变
                    self.dataPage = self.preDataPage;
                }
            } else {
                [self reloadDataWithHasMore:YES];
            }
        }
        [self.tableView reloadData];
        
        // 没有数据
        __block BOOL hasData = NO;
        [self.sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GNHTableViewSectionObject *section = (GNHTableViewSectionObject *)obj;
            if (section.items.count) {
                hasData = YES;
                *stop = YES;
            }
        }];
        self.noDataView.hidden = hasData;
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
    if ([gnhModel isMemberOfClass:[ORRecommecListDataModel class]]) {
        if ([self.recommecListDataModel.scene isEqualToString:@"hotspot"]) {
            [self stopPullDownToRefreshAnimation];
        }
        if (gnhModel.loadType == GNHDataModelLoadTypeLoadMore) {
            self.dataPage = self.preDataPage;
            [self stopPullUpToRefreshAnimation];
        }
        
        // 没有数据
        __block BOOL hasData = NO;
        [self.sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            GNHTableViewSectionObject *section = (GNHTableViewSectionObject *)obj;
            if (section.items.count) {
                hasData = YES;
                *stop = YES;
            }
        }];
        self.noDataView.hidden = hasData;
    }
}

#pragma mark - Properties

- (UIView *)animationView
{
    if(!_animationView) {
        _animationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 195*(kScreenWidth/375.0))]; // 高度 = 180 + 上下间距7.5
        _animationView.layer.cornerRadius = 10.0f;
        _animationView.layer.masksToBounds = YES;
        
        // 遮罩层
        UIImageView *topCoverImageView = [UIImageView ly_ImageViewWithImageName:@"index_cover_top"];
        [_animationView addSubview:topCoverImageView];
        [topCoverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(_animationView);
            make.height.mas_offset(100.0f);
        }];
    }
    return _animationView;
}

- (ORChannelNoDataView *)noDataView
{
    if (!_noDataView) {
        _noDataView = [[ORChannelNoDataView alloc] init];
        [self.tableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.tableView).offset(165*(kScreenWidth/375.0));
            make.left.equalTo(self.tableView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth, self.tableView.height - 165*(kScreenWidth/375.0)));
        }];
    }
    return _noDataView;
}

- (ORBannerDataModel *)bannerDataModel
{
    if (!_bannerDataModel) {
        _bannerDataModel = [self produceModel:[ORBannerDataModel class]];
    }
    return _bannerDataModel;;
}

- (ORFetchSubChanelMenuDataModel *)subChanelMenuDataModel
{
    if (!_subChanelMenuDataModel) {
        _subChanelMenuDataModel = [self produceModel:[ORFetchSubChanelMenuDataModel class]];
    }
    return _subChanelMenuDataModel;
}

- (ORChannelSenceDataModel *)channelSenceDataModel
{
    if (!_channelSenceDataModel) {
        _channelSenceDataModel = [self produceModel:[ORChannelSenceDataModel class]];
    }
    return _channelSenceDataModel;
}

@end
