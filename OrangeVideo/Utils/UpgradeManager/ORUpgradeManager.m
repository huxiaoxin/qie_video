//
//  AQUpgradeManager.m
//  AiQiu
//
//  Created by ChenYuan on 2020/6/13.
//  Copyright © 2020 lesports. All rights reserved.
//

#import "ORUpgradeManager.h"
#import "ORUpgradeView.h"
#import "ORUpgradeDataModel.h"

@interface ORUpgradeManager ()

@property (nonatomic, copy) NSString *version;

@property (nonatomic, weak) LYCoverView *updateBgView;
@property (nonatomic, strong) ORUpgradeDataModel *upgradeDataModel;

@end

@implementation ORUpgradeManager

#pragma mark - LifeCycle

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupDatas];
    }
    return self;
}

#pragma mark - SetupData

- (void)setupDatas
{
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    self.version = dict[@"CFBundleShortVersionString"];
    
    [self.upgradeDataModel fetchUpgradeInfo];
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    GNHWeakSelf;
    if ([gnhModel isMemberOfClass:[ORUpgradeDataModel class]]) {
        if (!weakSelf.updateBgView) {
            ORUpgradeItem *checkViewItem = self.upgradeDataModel.upgradeItem;
            
            if ([self.version compare:checkViewItem.versionCode options:NSNumericSearch] == NSOrderedAscending) {
                // 小于 version 的版本
                if (checkViewItem.upgradeType == AQUpgradeTypeForce) {
                    // 强制升级
                    self.updateBgView = [ORUpgradeView setupView:checkViewItem.content upgradeUrl:checkViewItem.downloadUrl  version:checkViewItem.versionCode isForceUpgrade:YES];
                } else if (checkViewItem.upgradeType == AQUpgradeTypeRemind) {
                    // 普通升级
                    self.updateBgView = [ORUpgradeView setupView:checkViewItem.content upgradeUrl:checkViewItem.downloadUrl  version:checkViewItem.versionCode isForceUpgrade:NO];
                }
            }
        }
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    if ([gnhModel isMemberOfClass:[ORUpgradeDataModel class]]) {
        
    }
}

#pragma mark - Properties

- (ORUpgradeDataModel *)upgradeDataModel
{
    if (!_upgradeDataModel) {
        _upgradeDataModel = [self produceModel:[ORUpgradeDataModel class]];
    }
    return _upgradeDataModel;
}

@end
