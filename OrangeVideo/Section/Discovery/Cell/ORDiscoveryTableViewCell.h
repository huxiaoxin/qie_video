//
//  ORDiscoveryTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "GNHBaseTableViewCell.h"
#import "ORDiscoveryDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORChannelItemCallBack)(ORDiscoveryDataItem *dataItem);

@interface ORDiscoveryTableViewCell : GNHBaseTableViewCell

@property (nonatomic, copy) ORChannelItemCallBack channelItemCallBack;

@end

NS_ASSUME_NONNULL_END
