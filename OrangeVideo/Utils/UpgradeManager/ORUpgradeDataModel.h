//
//  AQUpgradeDataModel.h
//  AiQiu
//
//  Created by ChenYuan on 2020/6/13.
//  Copyright © 2020 lesports. All rights reserved.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, AQUpgradeType) {
    AQUpgradeTypeForce = 0,  // 强制升级
    AQUpgradeTypeRemind,     // 提醒
    AQUpgradeTypeUnUpgrade,  // 不升级
};

@interface ORUpgradeItem : GNHRootBaseItem

@property (nonatomic, copy) NSString *content;  // 内容标题
@property (nonatomic, copy) NSString *downloadUrl;  // 下载地址
@property (nonatomic, copy) NSString *platform;  // app来源 iOS Android
@property (nonatomic, copy) NSString *remark;  // 操作说明
@property (nonatomic, copy) NSString *title;  // 标题
@property (nonatomic, assign) AQUpgradeType upgradeType; // 升级类型: 0:强制 1:提示 2:不升级
@property (nonatomic, copy) NSString *versionCode;  // 版本（Android使用 200）

@end

@interface ORUpgradeDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORUpgradeItem *upgradeItem;

- (BOOL)fetchUpgradeInfo;

@end

NS_ASSUME_NONNULL_END
