//
//  ORWatchRecordViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/15.
//

#import "ORWatchRecordViewController.h"
#import "ORWatchRecordTableViewCell.h"
#import "ORWatchRecordDataModel.h"
#import "ORDeleteWatchRecordDataModel.h"
#import "ORChannelNoDataView.h"
#import "ORVideoReportManager.h"

#define kDataSize  20 // 默认请求20条数据

@interface ORWatchRecordViewController ()

@property (nonatomic, strong) ORWatchRecordDataModel *watchRecordDataModel;
@property (nonatomic, strong) ORDeleteWatchRecordDataModel *deleteWatchRecordDataModel;

@property (nonatomic, assign) NSInteger dataPage; // 数据页码
@property (nonatomic, assign) NSInteger preDataPage;

@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) UIButton *deleteBtn;
@property (nonatomic, weak) UIImageView *editView;
@property (nonatomic, strong) NSMutableArray <__kindof ORWatchRecordDataItem *> *dataArr;
@property (nonatomic, strong) NSMutableArray <__kindof ORWatchRecordDataItem *> *deleteArr;
@property (nonatomic, assign) NSInteger deleteNum;

@property (nonatomic, strong) ORChannelNoDataView *noDataView;

@end

@implementation ORWatchRecordViewController

#pragma mark - LifeCycle

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([ORAccountComponent checkLogin:NO]) {
        [self pullDownToRefreshAction];
    } else {
        GNHTableViewSectionObject *sectionObject = self.sections.firstObject;
        sectionObject.items = [[ORVideoReportManager sharedInstance].videoItems mutableCopy];
        
        // 没有数据
        [self checkNoDataView];
        
        [self.tableView reloadData];
        
        self.dataArr = [sectionObject.items mutableCopy];
    }
}

#pragma mark - setupUI

- (void)setupUI
{
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 30)];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    editButton.titleLabel.font = zy_mediumSystemFont15;
    [editButton setTitle:@"取消" forState:UIControlStateSelected];
    [editButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.editButton = editButton;
    
    // 编辑区域
    UIImageView *editView = [UIImageView ly_ViewWithColor:gnh_color_b];
    [self.view addSubview:editView];
    self.editView = editView;
    editView.userInteractionEnabled = YES;
    [editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@(60 + ORKitMacros.iphoneXSafeHeight));
    }];
    self.editView.hidden = YES;
    
    UIView *toplineView = [UIView ly_ViewWithColor:gnh_color_line];
    toplineView.layer.shadowColor = RGBA_HexCOLOR(0x000000, 0.05).CGColor;
    toplineView.layer.shadowOffset = CGSizeMake(0, -1);
    toplineView.layer.shadowOpacity = 1;
    toplineView.layer.shadowRadius = 4;
    [editView addSubview:toplineView];
    [toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0.0f);
        make.left.right.equalTo(editView);
        make.height.mas_equalTo(@0.5f);
    }];
        
    UIButton *selectedBtn = [UIButton ly_ButtonWithTitle:@"全选" titleColor:gnh_color_a font:zy_mediumSystemFont15 target:self selector:@selector(selectedBtnClick:)];
    [selectedBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    [editView addSubview:selectedBtn];
    self.selectedBtn = selectedBtn;
    [selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.centerX.equalTo(editView).offset(-(kScreenWidth/4.0));
        make.size.mas_equalTo(CGSizeMake(140, 45));
    }];
    
    UIView *lineView = [UIView ly_ViewWithColor:gnh_color_line];
    [editView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.size.mas_equalTo(CGSizeMake(0.5, 16.5f));
    }];
    
    UIButton *deleteBtn = [UIButton ly_ButtonWithTitle:@"删除" titleColor:gnh_color_theme font:zy_mediumSystemFont15 target:self selector:@selector(deleteBtnClick:)];
    [editView addSubview:deleteBtn];
    self.deleteBtn = deleteBtn;
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.centerX.equalTo(editView).offset((kScreenWidth/4.0));
        make.size.mas_equalTo(CGSizeMake(140, 45));
    }];
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isKindOfClass:[ORWatchRecordDataItem class]]) {
        return [ORWatchRecordTableViewCell class];
    }
    return nil;
}

#pragma mark - setupData

- (void)setupData
{
    self.navigationItem.title = @"观看历史";
    
    CGRect rect = CGRectMake(0, ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight, kScreenWidth, kScreenHeight - ORKitMacros.navigationBarHeight - ORKitMacros.statusBarHeight);
    self.tableView.frame = rect;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = gnh_color_b;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if ([ORAccountComponent checkLogin:NO]) {
        self.isNeedPullDownToRefreshAction = YES;
        self.isNeedPullUpToRefreshAction = YES;
    }
    
    // 配置数据
    GNHTableViewSectionObject *sectionObject = [[GNHTableViewSectionObject alloc] init];
    self.sections = [@[sectionObject] mutableCopy];
}

#pragma mark - UITableview Delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing) {
        [self.deleteArr mdf_safeAddObject:[self.dataArr mdf_safeObjectAtIndex:indexPath.row]];
        self.deleteNum += 1;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%@)", @(self.deleteNum)] forState:UIControlStateNormal];
    } else {
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

        ORWatchRecordDataItem *cellItem = (ORWatchRecordDataItem *)[self.dataArr mdf_safeObjectAtIndex:indexPath.row];
        if (self.editView.hidden) {
            // 跳转到视频详情
            [[ORPlayerManager sharedInstance] jumpChannelWith:cellItem.idStr type:cellItem.type cover:cellItem.coverImg];
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editView.hidden) {
        [self.deleteArr mdf_safeRemoveObject:[self.dataArr mdf_safeObjectAtIndex:indexPath.row]];
        self.deleteNum -= 1;
        
        if (self.deleteNum > 0) {
            [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%@)", @(self.deleteNum)] forState:UIControlStateNormal];
        } else {
            [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        }
    }
}

#pragma mark - buttonAction

- (void)rightButtonAction:(UIButton *)btn
{
    [super rightButtonAction:btn];
    
    btn.selected = !btn.selected;
    self.deleteArr = [[NSMutableArray alloc]init];
    self.deleteNum = 0;
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    self.selectedBtn.selected = NO;

    if (btn.selected) {
        self.tableView.editing = YES;
        self.editView.hidden = NO;
        
        CGRect rect = CGRectMake(0, ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight, kScreenWidth, kScreenHeight - ORKitMacros.navigationBarHeight - ORKitMacros.statusBarHeight - ORKitMacros.iphoneXSafeHeight - 60);
        self.tableView.frame = rect;
    } else {
        self.tableView.editing = NO;
        self.editView.hidden = YES;
        
        CGRect rect = CGRectMake(0, ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight, kScreenWidth, kScreenHeight - ORKitMacros.navigationBarHeight - ORKitMacros.statusBarHeight);
        self.tableView.frame = rect;
    }
}

- (void)selectedBtnClick:(UIButton *)btn
{
    if (!self.selectedBtn.selected) {
        self.selectedBtn.selected = YES;
        
        for (int i = 0; i < self.dataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
        }
        [self.deleteArr addObjectsFromArray:self.dataArr];
        self.deleteNum = self.dataArr.count;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%@)", @(self.deleteNum)] forState:UIControlStateNormal];
    } else {
        self.selectedBtn.selected = NO;
        [self.deleteArr removeAllObjects];
        for (int i = 0; i < self.dataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
        }
        self.deleteNum = 0;
        [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    }
}

- (void)deleteBtnClick:(UIButton *)btn
{
    if (self.tableView.editing) {
        //  你的网络请求
        NSMutableArray *tmpDeleteArr = [NSMutableArray array];
        [self.deleteArr enumerateObjectsUsingBlock:^(__kindof ORWatchRecordDataItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSMutableDictionary *paramDic = [NSMutableDictionary dictionary];
            paramDic[@"videoId"] = obj.idStr;
            paramDic[@"type"] = obj.type;
            paramDic[@"watchSeconds"] = @(obj.watchSeconds);
            [tmpDeleteArr mdf_safeAddObject:paramDic];
        }];
        
        if ([ORAccountComponent checkLogin:NO]) {
            [self.deleteWatchRecordDataModel deleteWatchRecordWithData:tmpDeleteArr];
        } else {
            [[ORVideoReportManager sharedInstance] deleteVideoHistorey:self.deleteArr];
            
            [self refreshUI];
        }
    }
}

- (void)refreshUI
{
    [self.dataArr removeObjectsInArray:self.deleteArr];
    GNHTableViewSectionObject *sectionObject = self.sections.firstObject;
    sectionObject.items = [self.dataArr mutableCopy];
    [self.tableView reloadData];
    
    // 刷新UI
    self.tableView.editing = NO;
    self.editView.hidden = YES;
    self.editButton.selected = NO;
    CGRect rect = CGRectMake(0, ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight, kScreenWidth, kScreenHeight - ORKitMacros.navigationBarHeight - ORKitMacros.statusBarHeight);
    self.tableView.frame = rect;
    
    [self checkNoDataView];
}

#pragma mark - Refresh

- (void)pullDownToRefreshAction
{
    [super pullDownToRefreshAction];
    self.isNeedPullUpToRefreshAction = YES;
        
    self.dataPage = 1;
    
    BOOL flag = [self.watchRecordDataModel fetchWatchRecordWithPage:self.dataPage limit:kDataSize]; // 默认一次性请求个
    if (flag) {
        self.watchRecordDataModel.loadType = GNHDataModelLoadTypeRefresh;
        self.watchRecordDataModel.isShowDefaultView = YES;
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
    BOOL flag = [self.watchRecordDataModel fetchWatchRecordWithPage:self.dataPage limit:kDataSize]; // 默认一次性请求个
    if (flag) {
        self.watchRecordDataModel.loadType = GNHDataModelLoadTypeLoadMore;
    } else {
        self.dataPage = self.preDataPage;
        [self stopPullUpToRefreshAnimation];
    }
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    
    if ([gnhModel isMemberOfClass:[ORWatchRecordDataModel class]]) {
        GNHTableViewSectionObject *sectionObject = self.sections.firstObject;
        if (gnhModel.loadType == GNHDataModelLoadTypeRefresh) {
            
             // 下拉刷新，数据还原
            [self stopPullDownToRefreshAnimation];
            
            sectionObject.items = [self.watchRecordDataModel.watchRecordItem.list mutableCopy];
        } else {
            // 上拉加载
            NSMutableArray *channelItems = [sectionObject.items mutableCopy];
            [channelItems mdf_safeAddObjectsFromArray:self.watchRecordDataModel.watchRecordItem.list];
            sectionObject.items = [channelItems mutableCopy];
            
            if (self.watchRecordDataModel.watchRecordItem.list.count < self.watchRecordDataModel.watchRecordItem.pageSize) {
                [self reloadDataWithHasMore:NO];
                
                if (!self.watchRecordDataModel.watchRecordItem.list.count) {
                    // 没有数据，刷新页数不变
                    self.dataPage = self.preDataPage;
                }
            } else {
                [self reloadDataWithHasMore:YES];
            }
            
            // 还原选中
            self.selectedBtn.selected = NO;
            [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
            [self.deleteArr removeAllObjects];
        }
        self.dataArr = [sectionObject.items mutableCopy];
        
        // 没有数据
        [self checkNoDataView];
        
        [self.tableView reloadData];
    } else if ([gnhModel isMemberOfClass:[ORDeleteWatchRecordDataModel class]]) {
        //删除
        [self refreshUI];
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
    if ([gnhModel isMemberOfClass:[ORWatchRecordDataModel class]]) {
       [self stopPullDownToRefreshAnimation];
        
        if (gnhModel.loadType == GNHDataModelLoadTypeLoadMore) {
            self.dataPage = self.preDataPage;
            [self stopPullUpToRefreshAnimation];
        }
        
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
}


#pragma mark - Properties

- (ORWatchRecordDataModel *)watchRecordDataModel
{
    if (!_watchRecordDataModel) {
        _watchRecordDataModel = [self produceModel:[ORWatchRecordDataModel class]];
    }
    return _watchRecordDataModel;;
}

- (ORDeleteWatchRecordDataModel *)deleteWatchRecordDataModel
{
    if (!_deleteWatchRecordDataModel) {
        _deleteWatchRecordDataModel = [self produceModel:[ORDeleteWatchRecordDataModel class]];
    }
    return _deleteWatchRecordDataModel;
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
