//
//  ORSearchChannelViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "ORSearchChannelViewController.h"
#import "ORSearchDataModel.h"
#import "ORChannelNoDataView.h"
#import "ORSearchResultTableViewCell.h"

#define kDataSize  20 // 默认请求20条数据

@interface ORSearchChannelViewController ()
@property (nonatomic, strong) ORSearchDataModel *searchDataModel; // 数据
@property (nonatomic, strong) ORChannelNoDataView *noDataView;

@property (nonatomic, assign) NSInteger dataPage; // 数据页码
@property (nonatomic, assign) NSInteger preDataPage;

@end

@implementation ORSearchChannelViewController

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
    
    // 获取数据
    [self pullDownToRefreshAction];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

#pragma mark - SetupData

- (void)setupUI
{
    CGRect rect = self.tableView.frame;
    rect.size.height = self.view.size.height;
    rect.origin.x = 0.0f;
    rect.origin.y = 0.0f;
    self.tableView.frame = rect;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.backgroundColor = gnh_color_c;
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isKindOfClass:[ORVideoBaseItem class]]) {
        return [ORSearchResultTableViewCell class];
    }
    
    return nil;
}

- (void)configForCell:(GNHBaseTableViewCell *)cell item:(id)item
{
    if ([item isKindOfClass:[ORVideoBaseItem class]]) {
        ORSearchResultTableViewCell *channelTableViewCell = (ORSearchResultTableViewCell *)cell;
        channelTableViewCell.channelItemCallBack = ^(ORVideoBaseItem * _Nonnull dataItem, NSInteger type) {
            // 详情
            [[ORPlayerManager sharedInstance] jumpChannelWith:dataItem.idStr type:dataItem.type cover:dataItem.coverImg];
        };
    }
}

#pragma mark - setupData

- (void)setupDatas
{
    // 配置数据
    GNHTableViewSectionObject *sectionObject = [[GNHTableViewSectionObject alloc] init];
    sectionObject.didSelectSelector = NSStringFromSelector(@selector(selectCellWithItem:indexPath:));
    self.sections = [@[sectionObject] mutableCopy];
    [self.tableView reloadData];
}

#pragma mark - UITableview Delegate

- (void)selectCellWithItem:(id<GNHBaseActionItemProtocol>)item indexPath:(NSIndexPath *)indexPath
{
    if ([item isMemberOfClass:[ORVideoBaseItem class]]) {
        ORVideoBaseItem *cellItem = (ORVideoBaseItem *)item;
        // 详情
        [[ORPlayerManager sharedInstance] jumpChannelWith:cellItem.idStr type:cellItem.type cover:cellItem.coverImg];
    };
}

- (BOOL)checkBundleMobile:(NSString *)mobile tips:(NSString *)tips
{
    if (mobile.length) {
        return YES;
    } else {
        [SVProgressHUD showInfoWithStatus:tips];
        
        return NO;
    }
}


#pragma mark - Refresh

- (void)pullDownToRefreshAction
{
    [super pullDownToRefreshAction];
    self.isNeedPullUpToRefreshAction = YES;
        
    self.dataPage = 1;
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    paramDic[@"videoType"] = self.typeId;
    BOOL flag = [self.searchDataModel searchWithKeyword:self.keyword page:self.dataPage limit:kDataSize params:paramDic];
    if (flag) {
        self.searchDataModel.loadType = GNHDataModelLoadTypeRefresh;
    } else {
        self.dataPage = self.preDataPage;
        [self stopPullDownToRefreshAnimation];
    }
}

- (void)pullUpToRefreshAction
{
    [super pullUpToRefreshAction];
    
    self.preDataPage = self.dataPage;

    self.dataPage += 1;
    
    NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
    paramDic[@"videoType"] = self.typeId;
    BOOL flag = [self.searchDataModel searchWithKeyword:self.keyword page:self.dataPage limit:kDataSize params:paramDic];
    if (flag) {
        self.searchDataModel.loadType = GNHDataModelLoadTypeLoadMore;
    } else {
        self.dataPage = self.preDataPage;
        [self stopPullUpToRefreshAnimation];
    }
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
        
    if ([gnhModel isMemberOfClass:[ORSearchDataModel class]]) {
        GNHTableViewSectionObject *sectionObject = self.sections.firstObject;

        if (gnhModel.loadType == GNHDataModelLoadTypeRefresh) {
            // 下拉刷新，数据还原
           [self stopPullDownToRefreshAnimation];
           
           sectionObject.items = [NSMutableArray arrayWithArray:self.searchDataModel.searchItem.list];
        } else {
           // 上拉加载
           NSMutableArray *channelItems = [sectionObject.items mutableCopy];
           [channelItems mdf_safeAddObjectsFromArray:self.searchDataModel.searchItem.list];
           sectionObject.items = [channelItems mutableCopy];
        }

        if (self.searchDataModel.searchItem.list.count < self.searchDataModel.searchItem.pageSize) {
            [self reloadDataWithHasMore:NO];
            
            if (!self.searchDataModel.searchItem.list.count) {
                // 没有数据，刷新页数不变
                self.dataPage = self.preDataPage;
            }
        } else {
            [self reloadDataWithHasMore:YES];
        }
       
        // 没有数据
        [self checkNoDataView];

        [self.tableView reloadData];

        if (self.searchChannelCompleteBlock) {
            self.searchChannelCompleteBlock();
        }
   }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
    if ([gnhModel isMemberOfClass:[ORSearchDataModel class]]) {
        [self stopPullDownToRefreshAnimation];
        
        // 没有数据
        [self checkNoDataView];
    }
}

- (void)checkNoDataView
{
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
    self.noDataView.frame = CGRectMake(0, 0, kScreenWidth,  self.view.height);
}

#pragma mark - Properties

- (ORSearchDataModel *)searchDataModel
{
    if (!_searchDataModel) {
        _searchDataModel = [self produceModel:[ORSearchDataModel class]];
    }
    return _searchDataModel;
}

- (ORChannelNoDataView *)noDataView
{
    if (!_noDataView) {
        _noDataView = [[ORChannelNoDataView alloc] init];
        [self.tableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.tableView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth, self.view.height));
        }];
    }
    return _noDataView;
}

@end
