//
//  ORSearchResultTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "GNHBaseTableViewCell.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ORChannelItemCallBack)(ORVideoBaseItem *dataItem, NSInteger type);

@interface ORSearchResultTableViewCell : GNHBaseTableViewCell
@property (nonatomic, copy) ORChannelItemCallBack channelItemCallBack;

@end

NS_ASSUME_NONNULL_END
