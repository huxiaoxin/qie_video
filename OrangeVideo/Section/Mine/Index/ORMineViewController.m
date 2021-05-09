//
//  ORMineViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORMineViewController.h"
#import "ORMineTableViewCell.h"
#import "ORWatchRecordViewController.h"
#import "ORDownloadViewController.h"
#import "ORFavoriteViewController.h"
#import "ORFeedbackViewController.h"
#import "ORAboutMeViewController.h"
#import "ORSettingViewController.h"
#import "ORUserInformManager.h"
#import "ORUserInformViewController.h"
#import "ORShareTool.h"
#import "FilmMyColltecdViewController.h"
@interface ORMineViewController () <ORAccountObserver>

@property (nonatomic, strong) ORUserInformItem *userInfoItem;

@property (nonatomic, strong) UIImageView *portrailImageView; // 头像
@property (nonatomic, strong) UILabel *nickName; // 昵称
@property (nonatomic, strong) UILabel *loginName;
@property (nonatomic, strong) UILabel *editLabel; // 编辑

@end

@implementation ORMineViewController

#pragma mark - LifeCycle

- (void)dealloc
{
    [[ORAccountNotificationManager sharedInstance] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupDatas];
    
    [self setupNotification];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([ORAccountComponent checkLogin:NO]) {
        GNHWeakSelf;
        [[ORUserInformManager sharedInstance] updateUserInfo:^(BOOL success, ORUserInformItem *userInfo) {
            // 刷新数据
            if (success) {
                weakSelf.userInfoItem = userInfo;

                [weakSelf refreshData]; // 刷新界面
            }
        }];
        self.editLabel.hidden = NO;
        self.nickName.hidden = NO;
        
        self.loginName.hidden = YES;
    } else {
        self.editLabel.hidden = YES;
        self.nickName.hidden = YES;
        
        self.loginName.hidden = NO;
    }
}

#pragma mark - SetupData

- (void)setupUI
{
    // 修改tableview高度
    CGRect rect = CGRectMake(0, 0, self.tableView.width, self.tableView.height + ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight + ORKitMacros.iphoneXSafeHeight);
    
    self.isNeedPullDownToRefreshAction = YES;
    self.tableView.frame = rect;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = gnh_color_d;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 配置数据
    GNHTableViewSectionObject *otherSectionObject = [[GNHTableViewSectionObject alloc] init];
    otherSectionObject.didSelectSelector = NSStringFromSelector(@selector(selectCellWithItem:indexPath:));
    otherSectionObject.items = [self dataItems:0];
    
    GNHTableViewSectionObject *settingSectionObject = [[GNHTableViewSectionObject alloc] init];
    settingSectionObject.didSelectSelector = NSStringFromSelector(@selector(selectCellWithItem:indexPath:));
    settingSectionObject.items = [self dataItems:1];
    settingSectionObject.gapTableViewCellHeight = 10.0f;
    settingSectionObject.isNeedGapTableViewCell = YES;
    settingSectionObject.isNeedFooterTableViewCell = YES;

    self.sections = [@[otherSectionObject, settingSectionObject] mutableCopy];
    [self.tableView reloadData];
    
    self.tableView.tableHeaderView = [self setupHeaderView];
}

- (UIView *)setupHeaderView
{
    UIView *headerView = [UIView ly_ViewWithColor:gnh_color_d];
    headerView.frame = CGRectMake(0, 0, kScreenWidth, 37 + kScreenWidth * (240/375.0));
    
    UIImageView *bgImageView = [UIImageView ly_ImageViewWithImageName:@"mine_bg"];
    [headerView addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(headerView);
        make.height.mas_offset(kScreenWidth * (240/375.0));
    }];
    
    // top
    // 头像
    UIImageView *portrailImageView = [UIImageView ly_ImageViewWithImageName:@"logo"];
    [headerView addSubview:portrailImageView];
    portrailImageView.layer.cornerRadius = 30.5f;
    portrailImageView.layer.masksToBounds = YES;
    [portrailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(headerView).offset(90 * (kScreenWidth/375.0));
        make.left.equalTo(headerView).offset(22.0f);
        make.size.mas_equalTo(CGSizeMake(60.0f, 60.0f));
    }];
    self.portrailImageView = portrailImageView;
    
    // 名称
    UILabel *nickName = [UILabel ly_LabelWithTitle:@"影视之王" font:zy_mediumSystemFont22 titleColor:gnh_color_b];
    [headerView addSubview:nickName];
    nickName.textAlignment = NSTextAlignmentLeft;
    [nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(portrailImageView.mas_top).offset(7.5);
        make.left.mas_equalTo(portrailImageView.mas_right).offset(12.0f);
        make.right.equalTo(headerView).offset(-80.0f);
    }];
    self.nickName = nickName;
    
    // 编辑
    UILabel *editLabel = [UILabel ly_LabelWithTitle:@"查看并编辑个人资料" font:zy_fontSize12 titleColor:RGBA_HexCOLOR(0xEEEEEE, 1.0)];
    [headerView addSubview:editLabel];
    editLabel.textAlignment = NSTextAlignmentLeft;
    [editLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nickName);
        make.bottom.mas_equalTo(portrailImageView.mas_bottom).offset(-10.0f);
    }];
    self.editLabel = editLabel;
    
    // 立即登录
    UILabel *loginName = [UILabel ly_LabelWithTitle:@"立即登录" font:zy_mediumSystemFont22 titleColor:gnh_color_b];
    [headerView addSubview:loginName];
    loginName.textAlignment = NSTextAlignmentLeft;
    [loginName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(portrailImageView.mas_right).offset(12.0f);
        make.right.equalTo(headerView).offset(-80.0f);
        make.centerY.equalTo(portrailImageView);
    }];
    self.loginName = loginName;
    
    UIImageView *arrImageView = [UIImageView ly_ImageViewWithImageName:@"com_arrow_white"];
    [headerView addSubview:arrImageView];
    [arrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView).offset(-25.0f);
        make.centerY.equalTo(portrailImageView);
    }];
    
    UIButton *tapBtn = [[UIButton alloc] init];
    [headerView addSubview:tapBtn];
    [tapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.portrailImageView);
            make.left.right.equalTo(headerView);
            make.height.mas_equalTo(100.0f);
    }];
    GNHWeakSelf;
    [tapBtn mdf_whenSingleTapped:^(UIGestureRecognizer *gestureRecognizer) {
        if ([ORAccountComponent checkLogin:YES]) {
            // 编辑资料
            ORUserInformViewController *informVC = [[ORUserInformViewController alloc] init];
            informVC.userInfoItem = weakSelf.userInfoItem;
            [weakSelf.navigationController pushViewController:informVC animated:YES];
        }
    }];
    
    UIView *contentView = [UIView ly_ViewWithColor:gnh_color_b];
    contentView.layer.cornerRadius = 10.0;
    contentView.layer.masksToBounds = YES;
    [headerView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(portrailImageView.mas_bottom).offset(27.5);
        make.left.right.equalTo(headerView).inset(15.0f);
        make.height.mas_offset(100.0f);
    }];
    
    
    // 播放历史
    UIButton *playHistoryButton = [UIButton ly_ButtonWithNormalImageName:@"mine_watchRecord" selecteImageName:@"mine_watchRecord" target:self selector:@selector(watchHistoryAction:)];
    [playHistoryButton setTitle:@"浏览历史" forState:UIControlStateNormal];
    [playHistoryButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    playHistoryButton.titleLabel.font = zy_mediumSystemFont13;
    playHistoryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [playHistoryButton setTitleEdgeInsets:UIEdgeInsetsMake(30 ,-30, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [playHistoryButton setImageEdgeInsets:UIEdgeInsetsMake(-30, 0.0,0.0, -52)]; // 图片高度 （30，30），文字宽度52；
    [contentView addSubview:playHistoryButton];
    [playHistoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(30.0f);
        make.centerY.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(100.0f, 100.0f));
    }];
    
    // 播放历史
    UIButton *collectButton = [UIButton ly_ButtonWithNormalImageName:@"mine_favorite" selecteImageName:@"mine_favorite" target:self selector:@selector(collectAction:)];
    [collectButton setTitle:@"我的收藏" forState:UIControlStateNormal];
    [collectButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    collectButton.titleLabel.font = zy_mediumSystemFont13;
    collectButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [collectButton setTitleEdgeInsets:UIEdgeInsetsMake(30 ,-30, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [collectButton setImageEdgeInsets:UIEdgeInsetsMake(-30, 0.0,0.0, -52)];
    [contentView addSubview:collectButton];
    [collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(100.0f, 100.0f));
    }];
    
    // 我的下载
    UIButton *downloadButton = [UIButton ly_ButtonWithNormalImageName:@"mine_download" selecteImageName:@"mine_download" target:self selector:@selector(downloadAction:)];
    [downloadButton setTitle:@"我的发布" forState:UIControlStateNormal];
    [downloadButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    downloadButton.titleLabel.font = zy_mediumSystemFont13;
    downloadButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    [downloadButton setTitleEdgeInsets:UIEdgeInsetsMake(30 ,-30, 0.0,0.0)];//文字距离上边框的距离增加imageView的高度，距离左边框减少imageView的宽度，距离下边框和右边框距离不变
    [downloadButton setImageEdgeInsets:UIEdgeInsetsMake(-30, 0.0,0.0, -52)];
    [contentView addSubview:downloadButton];
    [downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(contentView).offset(-30.0f);
        make.centerY.equalTo(contentView);
        make.size.mas_equalTo(CGSizeMake(100.0f, 100.0f));
    }];
    
    return headerView;
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isKindOfClass:[ORMineCellItem class]]) {
        return [ORMineTableViewCell class];
    } else if ([item isKindOfClass:[GNHFooterViewTableViewCellItem class]]) {
        return [GNHFooterViewTableViewCell class];
    }
    
    return nil;
}

#pragma mark - setupDatas

- (void)setupDatas
{
    // code
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = gnh_color_d;
}

- (NSMutableArray *)dataItems:(NSInteger)sectionType
{
    NSMutableArray *dataItems = [[NSMutableArray alloc] init];
    if (sectionType == 0) {
        ORMineCellItem *cellItem1 = [[ORMineCellItem alloc] init];
        cellItem1.iconName = @"mine_feedback";
        cellItem1.cellType = ORMineCellTypeFeedback;
        cellItem1.title = @"意见反馈";
        cellItem1.isBeginSeperator = YES;
        
        ORMineCellItem *cellItem2 = [[ORMineCellItem alloc] init];
        cellItem2.iconName = @"mine_share";
        cellItem2.cellType = ORMineCellTypeShare;
        cellItem2.title = @"应用分享";
        
        ORMineCellItem *cellItem3 = [[ORMineCellItem alloc] init];
        cellItem3.iconName = @"mine_aboutme";
        cellItem3.cellType = ORMineCellTypeAboutMe;
        cellItem3.title = @"关于我们";
        cellItem3.isEndSeperator = YES;
        
        [dataItems mdf_safeAddObject:cellItem1];
        [dataItems mdf_safeAddObject:cellItem2];
        [dataItems mdf_safeAddObject:cellItem3];
    } else {
        ORMineCellItem *cellItem1 = [[ORMineCellItem alloc] init];
        cellItem1.iconName = @"mine_setting";
        cellItem1.cellType = ORMineCellTypeSetting;
        cellItem1.title = @"设置";
        cellItem1.isBeginSeperator = YES;
        cellItem1.isEndSeperator = YES;
        [dataItems mdf_safeAddObject:cellItem1];
    }
    
    return dataItems;
}

- (void)refreshData
{
    // 1、更新头部
    [self.portrailImageView sd_setImageWithURL:[NSURL URLWithString:self.userInfoItem.avatar] placeholderImage:[UIImage imageNamed:@"logo"]];
    self.nickName.text = self.userInfoItem.username;
    self.editLabel.text = [NSString stringWithFormat:@"UID：%@", @(self.userInfoItem.userId).stringValue];
    
    self.nickName.hidden = NO;
    self.editLabel.hidden = NO;
    
    self.loginName.hidden = YES;
}

#pragma mark - ButtonAction

- (void)watchHistoryAction:(UIButton *)btn
{
    ORWatchRecordViewController *watchRecordVC = [[ORWatchRecordViewController alloc] init];
    [self.navigationController pushViewController:watchRecordVC animated:YES];
}

- (void)collectAction:(UIButton *)btn
{
    if ([ORAccountComponent checkLogin:YES]) {
        //FilmMyColltecdViewController
        //ORFavoriteViewController
        FilmMyColltecdViewController *favoriteVC = [[FilmMyColltecdViewController alloc] init];
        [self.navigationController pushViewController:favoriteVC animated:YES];
    }
}

- (void)downloadAction:(UIButton *)btn
{
    ORDownloadViewController *downloadVC = [[ORDownloadViewController alloc] init];
    [self.navigationController pushViewController:downloadVC animated:YES];
}


#pragma mark - Notification

- (void)setupNotification
{
    [[ORAccountNotificationManager sharedInstance] registerObserver:self];
}

- (void)handleAccountLogin:(NSDictionary *)userInfo
{
    [self refreshData];
}

- (void)handleAccountLogout:(NSDictionary *)userInfo
{
     // 1、更新头部
    self.nickName.hidden = YES;
    self.editLabel.hidden = YES;
    
    self.loginName.hidden = NO;
}

- (void)handleAccountChanged:(NSDictionary *)userInfo
{
    // 信息已更新，需要重新请求
    GNHWeakSelf;
    [[ORUserInformManager sharedInstance] updateUserInfo:^(BOOL success, ORUserInformItem *userInfo) {
        // 刷新数据
        if (success) {
            weakSelf.userInfoItem = userInfo;

            [weakSelf refreshData]; // 刷新界面
        }
    }];
}

#pragma mark - UITableview Delegate

- (void)selectCellWithItem:(id<GNHBaseActionItemProtocol>)item indexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([item isKindOfClass:[ORMineCellItem class]]) {
        ORMineCellItem *cellItem = (ORMineCellItem *)item;
        switch (cellItem.cellType) {
            case ORMineCellTypeFeedback: { // 意见反馈
                if ([ORAccountComponent checkLogin:YES]) {
                    ORFeedbackViewController *feedbackVC = [[ORFeedbackViewController alloc] init];
                    [self.navigationController pushViewController:feedbackVC animated:YES];
      
                }
                break;
            }
            case ORMineCellTypeShare: {  // 分享
                // 分享，弹出分享框
                [[ORShareTool sharedInstance] shareWithData:@"企鹅追剧"
                                                   imageUrl:@"https://orange-vd.bj.bcebos.com/ota/512.png"
                                                description:@"企鹅追剧是一款短视频APP，同时聚合了影视资源，精选内容超过10w+"
                                                 contentUrl:@"https://m.iorange99.com"
                                                  miniappId:@""
                                                miniappPath:@""
                                                 useMiniapp:NO
                                                resultBlock:^(ShareResultType result) {
                    if (result == ShareResultTypeSuccess) {
                        [SVProgressHUD showInfoWithStatus:@"分享成功"];
                    } else {
                        [SVProgressHUD showInfoWithStatus:@"分享失败"];
                    }
                }];
                break;;
            }
            case ORMineCellTypeAboutMe: { // 关于我们
                ORAboutMeViewController *aboutMeVC = [[ORAboutMeViewController alloc] init];
                [self.navigationController pushViewController:aboutMeVC animated:YES];
                break;
            }
            case ORMineCellTypeSetting: { // 设置
                ORSettingViewController *settingVC = [[ORSettingViewController alloc] init];
                [self.navigationController pushViewController:settingVC animated:YES];
                break;
            }
                
            default:
                break;
        }
    }
}

#pragma mark - Refresh

- (void)pullDownToRefreshAction
{
    [super pullDownToRefreshAction];
    
    GNHWeakSelf;
    BOOL flag = [[ORUserInformManager sharedInstance] updateUserInfo:^(BOOL success, ORUserInformItem *userInfo) {
        // 刷新数据
        if (success) {
            weakSelf.userInfoItem = userInfo;

            [weakSelf refreshData]; // 刷新界面
        }
        [weakSelf stopPullDownToRefreshAnimation];
    }];
    if (!flag) {
        [weakSelf stopPullDownToRefreshAnimation];
    }
}

#pragma mark - Handle Data

#pragma mark - Properties

@end
