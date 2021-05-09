//
//  ORVideoRecommendTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "GNHBaseTableViewCell.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORRecommendItemCallBack)(ORVideoBaseItem *dataItem);

@interface ORVideoRecommendTableViewCell : GNHBaseTableViewCell

@property (nonatomic, copy) ORRecommendItemCallBack recommendItemCallBack;

@end

NS_ASSUME_NONNULL_END
