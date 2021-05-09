//
//  ORDiscoveryMenuDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORDiscoveryTypeItem : GNHBaseItem

@property (nonatomic, copy) NSString *name; // 频道名称
@property (nonatomic, copy) NSString *type; // 频道类型(切换频道时, 更换参数)
@property (nonatomic, copy) NSString *icon; // 图标

@end

@interface ORDiscoveryMenuItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORDiscoveryTypeItem *> *channelTypes; // 视频分类类型 ,
@property (nonatomic, strong) NSMutableArray <__kindof ORDiscoveryTypeItem *> *areaTypes; // 地区 选项类型
@property (nonatomic, strong) NSDictionary *types; // 子分类
@property (nonatomic, strong) NSMutableArray <__kindof ORDiscoveryTypeItem *> *yearTypes; // 年份选项类型

@end

@interface ORDiscoveryMenuDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORDiscoveryMenuItem *discoveryMenuItem;

- (BOOL)fetchDiscoveryMenu:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
