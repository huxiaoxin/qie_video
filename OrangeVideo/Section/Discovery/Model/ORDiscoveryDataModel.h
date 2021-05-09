//
//  ORDiscoveryDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

@interface ORDiscoveryDataItem : ORVideoBaseItem

@end

@interface ORDiscoveryItem : GNHRootBaseItem

@property (nonatomic, strong) NSMutableArray <__kindof ORDiscoveryDataItem *> *list; // 数据流
@end

@interface ORDiscoveryDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORDiscoveryItem *discoveryItem;

- (BOOL)fetchDiscoverChannelWithPage:(NSInteger)page limit:(NSInteger)limit params:(NSDictionary *)paramDic;

@end
