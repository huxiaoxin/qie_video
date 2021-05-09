//
//  ORVideoRecommendDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/22.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoRecommendItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *data; // 数据流

@end

@interface ORVideoRecommendDataModel : GNHBaseDataModel

@property (nonatomic, strong) ORVideoRecommendItem *videoRecommendItem;

- (BOOL)fetchRecommendVideo:(NSString *)videoId type:(NSString *)videoType;

@end

NS_ASSUME_NONNULL_END
