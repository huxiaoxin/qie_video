//
//  ORSettingTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "GNHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ORSettingCellType) {
    ORSettingCellTypeClearMemory = 0, // 清除缓存
    ORSettingCellTypePush, // 消息推送
    ORSettingCellTypeNetwork, // 运营网络下载
    ORSettingCellTypeCheckUpgrade,  // 检查版本
    ORSettingCellTypeLogout,        // 账号注销
};

typedef void(^ORSettingActionBlock)(ORSettingCellType type, BOOL isOn);

@interface ORSettingCellItem : GNHBaseItem

@property (nonatomic, assign) ORSettingCellType cellType; // 类型
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *redirectUrl;
@property (nonatomic, assign) BOOL isOn;  // 开关是否开启

@end

@interface ORSettingTableViewCell : GNHBaseTableViewCell

@property (nonatomic, copy) ORSettingActionBlock settingActionBlock;

@end

NS_ASSUME_NONNULL_END
