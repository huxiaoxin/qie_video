//
//  ORUserInformManager.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/22.
//

#import "ORUserInformManager.h"
#import "ORAutoLoginDataModel.h"

@interface ORUserInformManager () <ORAccountObserver>
@property (nonatomic, strong) ORUserInformDataModel *userInfoDataModel; // 获取用户信息
@property (nonatomic, copy) ORUpdateUserInfoCompleteHandle updateUserInfoCompleteBlock;
@property (nonatomic, strong) ORAutoLoginDataModel *loginAutoDataModel; // 自动登录

@end

@implementation ORUserInformManager

#pragma mark - Init

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [[ORAccountNotificationManager sharedInstance] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 获取用户信息
        [self.userInfoDataModel fetchUserInform];
        
        // 自动登录
        [self.loginAutoDataModel autoLogin];
        
        [[ORAccountNotificationManager sharedInstance] registerObserver:self];
        
        // 清除超过3天的数据
        NSMutableDictionary *idDic = [ORUserDefaults objectForKey:ORForbidContentKey];
        NSMutableDictionary *tmpDic = [idDic mutableCopy];
        [idDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSDate *date = (NSDate *)obj;
            if (date.day == [NSDate date].day - 3) {
                // 删除3天以前的
                [tmpDic mdf_safeRemoveObjectForKey:key];
            }
        }];
        [ORUserDefaults setObject:tmpDic forKey:ORForbidContentKey];
        [ORUserDefaults synchronize];
    }
    return self;
}

#pragma mark - setupData

- (ORUserInformItem *)fetchUserInfo
{
    return self.userInfoDataModel.userInformItem;
}

- (BOOL)updateUserInfo:(ORUpdateUserInfoCompleteHandle)completeBlock
{
    self.updateUserInfoCompleteBlock = completeBlock;
    
    // 获取用户信息
    return  [self.userInfoDataModel fetchUserInform];
}

- (void)autoLogin
{
    [self.loginAutoDataModel autoLogin];
}

#pragma mark - Notification

- (void)handleAccountLogin:(NSDictionary *)userInfo
{
    // 获取用户信息
    [self.userInfoDataModel fetchUserInform];
    
    // 自动登录
    [self.loginAutoDataModel autoLogin];
}

- (void)handleAccountLogout:(NSDictionary *)userInfo
{
    self.userInfoDataModel.userInformItem = nil;
}

- (void)handleAccountChanged:(NSDictionary *)userInfo
{
    // 信息已更新，需要重新请求
    [self.userInfoDataModel fetchUserInform];
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isMemberOfClass:[ORUserInformDataModel class]]) {
        if (self.updateUserInfoCompleteBlock) {
            self.updateUserInfoCompleteBlock(YES, self.userInfoDataModel.userInformItem);
        }
        
    [self restoreUserInfo:ORShareAccountComponent.accesstoken
                      uid:self.userInfoDataModel.userInformItem.userId
                    uname:self.userInfoDataModel.userInformItem.username
                avatarUrl:self.userInfoDataModel.userInformItem.avatar];
        
    } else if ([gnhModel isKindOfClass:[ORAutoLoginDataModel class]]) {
        [SVProgressHUD dismiss];
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
    if ([gnhModel isMemberOfClass:[ORUserInformDataModel class]]) {
        if (self.updateUserInfoCompleteBlock) {
            self.updateUserInfoCompleteBlock(NO, self.userInfoDataModel.userInformItem);
        }
    }
}

- (void)restoreUserInfo:(NSString *)token uid:(NSInteger)uid uname:(NSString *)uname avatarUrl:(NSString *)avatarUrl
{
    // 存储用户信息
    ZYBriefMemberItem *memberItem = [[ZYBriefMemberItem alloc] init];
    
    memberItem.uid = uid;
    memberItem.nickName = uname;
    memberItem.portraitUrl = avatarUrl;
    [ORShareAccountComponent storeUserItem:memberItem];
    
    // 存储token
    [ORShareAccountComponent storeAccessToken:token];
}

#pragma mark - Properties

- (ORUserInformDataModel *)userInfoDataModel
{
    if (!_userInfoDataModel) {
        _userInfoDataModel = [self produceModel:[ORUserInformDataModel class]];
    }
    return _userInfoDataModel;
}

- (ORAutoLoginDataModel *)loginAutoDataModel
{
    if (!_loginAutoDataModel) {
        _loginAutoDataModel = [self produceModel:[ORAutoLoginDataModel class]];
    }
    return _loginAutoDataModel;
}

@end
