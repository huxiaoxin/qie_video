//
//  ORUserInformViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "ORUserInformViewController.h"
#import "OREditUserInformViewController.h"
#import "ORUserInformTableViewCell.h"
#import "GNHGapTableViewCell.h"
#import "ORImagePickManager.h"
#import "ORUploadFileManager.h"
#import "ORUserInformManager.h"
#import "ORUpdateUserInformDataModel.h"

@interface ORUserInformViewController ()

@property (nonatomic, strong) ORUpdateUserInformDataModel *userInformDataModel; // 更新用户消息
@property (nonatomic, strong) ZYFormData *formImageData;

@end

@implementation ORUserInformViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupDatas];
}

#pragma mark - setupDatas

- (void)setupDatas
{
    self.navigationItem.title = @"编辑资料";
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: gnh_color_a};

    [self configSectionData];
    
    GNHWeakSelf;
    self.userInformVCBlock = ^{
        [weakSelf.tableView reloadData];
    };
}

- (void)configSectionData
{
    // 配置数据
    GNHTableViewSectionObject *sectionObject1 = [[GNHTableViewSectionObject alloc] init];
    sectionObject1.didSelectSelector = NSStringFromSelector(@selector(selectCellWithItem:indexPath:));
    sectionObject1.items = [self productSectionItems:0];
    sectionObject1.gapTableViewCellHeight = 9.0f;
    sectionObject1.isNeedGapTableViewCell = YES;
    
    GNHTableViewSectionObject *sectionObject2 = [[GNHTableViewSectionObject alloc] init];
    sectionObject2.didSelectSelector = NSStringFromSelector(@selector(selectCellWithItem:indexPath:));
    sectionObject2.items = [self productSectionItems:1];
    sectionObject2.gapTableViewCellHeight = 9.0f;
    sectionObject2.isNeedGapTableViewCell = YES;
    
    self.sections = [@[sectionObject1, sectionObject2] mutableCopy];
    [self.tableView reloadData];
}

- (NSMutableArray *)productSectionItems:(NSInteger)sectionType
{
    NSMutableArray *items = [NSMutableArray array];

    if (sectionType == 0) {
        ORUserInformCellItem *portraitItem = [[ORUserInformCellItem alloc] init];
        portraitItem.title = @"头像";
        portraitItem.anchorUrl = self.userInfoItem.avatar;
        portraitItem.cellType = ORUserInformCellTypePortrail;
        [items mdf_safeAddObject:portraitItem];
        
        ORUserInformCellItem *nickNameItem = [[ORUserInformCellItem alloc] init];
        nickNameItem.title = @"昵称";
        nickNameItem.content = self.userInfoItem.username;
        nickNameItem.cellType = ORUserInformCellTypeNickName;
        [items mdf_safeAddObject:nickNameItem];
    }
    
    return items;
}

#pragma mark - setupUIs

- (void)setupUI
{
    self.tableView.backgroundColor = gnh_color_com;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isMemberOfClass:[ORUserInformCellItem class]]) {
        return [ORUserInformTableViewCell class];
    } else if ([item isMemberOfClass:[GNHFooterViewTableViewCellItem class]]) {
        return [GNHGapTableViewCell class];
    }
    
    return nil;
}

#pragma mark - Notification

- (void)setupNotifications
{
    [super setupNotifications];
}

#pragma mark setupDatas

- (void)uploadProtrait
{
    GNHWeakSelf;
    [[ORUploadFileManager sharedInstance] uploadImageManager:self.formImageData completeHandler:^(BOOL isSuccess, NSString *url) {
        if (isSuccess) {
            weakSelf.formImageData = nil;
            [weakSelf.userInformDataModel updateUserInform:weakSelf.userInfoItem.username avatarUrl:url];
        }
    } uploadType:@"AVATAR"];
}

#pragma mark - UITableview Delegate

- (void)selectCellWithItem:(id<GNHBaseActionItemProtocol>)item indexPath:(NSIndexPath *)indexPath
{
    if ([item isMemberOfClass:[ORUserInformCellItem class]]) {
        GNHWeakSelf;
        ORUserInformCellItem *cellItem = (ORUserInformCellItem *)item;
        GNHWeakObj(cellItem);
        switch (cellItem.cellType) {
            case ORUserInformCellTypePortrail: { // 头像
                [[ORImagePickManager sharedInstance] pickCircleImage:^(UIImage *image, ZYFormData *imageData) {
                    if (image && imageData) {
                        weakSelf.formImageData = imageData;
                        weakcellItem.image = image;
                        
                        // 上传头像
                        [weakSelf uploadProtrait];
                        
                        [weakSelf.tableView reloadData];
                        
                        [[UIViewController mdf_toppestViewController] dismissViewControllerAnimated:YES completion:nil];
                    }
                }];
                break;
            }
            case ORUserInformCellTypeNickName: { // 昵称
                OREditUserInformViewController *editUserInformVC = [[OREditUserInformViewController alloc] init];
                editUserInformVC.nickname = weakSelf.userInfoItem.username;
                editUserInformVC.anchorUrl = weakSelf.userInfoItem.avatar;
                [self.navigationController pushViewController:editUserInformVC animated:YES];
                
                GNHWeakSelf;
                editUserInformVC.editUserInformBlock = ^(NSString * _Nonnull nickName) {
                    weakSelf.userInfoItem.username = nickName;
                    GNHTableViewSectionObject *sectionOject = weakSelf.sections.firstObject;
                    [sectionOject.items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        if ([obj isKindOfClass:[ORUserInformCellItem class]]) {
                            ORUserInformCellItem *userInformCellItem = (ORUserInformCellItem *)obj;
                            if (userInformCellItem.cellType == ORUserInformCellTypeNickName) {
                                userInformCellItem.content = nickName;

                                [weakSelf.tableView reloadData];

                                *stop = YES;
                            }
                        }
                    }];
                };
                
                break;
            }
            default:
                break;
        }
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

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isMemberOfClass:[ORUpdateUserInformDataModel class]]) {
         // 修改用户信息
        [[NSNotificationCenter defaultCenter] postNotificationName:ORLoginUserInfoChangedNotification object:nil];
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
    if ([gnhModel isMemberOfClass:[ORUpdateUserInformDataModel class]]) {
    }
}

#pragma mark - Properties

- (ORUpdateUserInformDataModel *)userInformDataModel
{
    if (!_userInformDataModel) {
        _userInformDataModel = [self produceModel:[ORUpdateUserInformDataModel class]];
    }
    return _userInformDataModel;
}


@end
