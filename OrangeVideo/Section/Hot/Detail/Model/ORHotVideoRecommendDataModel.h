//
//  ORHotVideoRecommendDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/22.
//

#import "GNHBaseDataModel.h"
#import "ORHotChannelDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORHotVideoRecommendItem : GNHRootBaseItem

@property (nonatomic, strong) NSMutableArray <__kindof ORHotChannelDataItem *> *data; // 数据流

@end

@interface ORHotVideoRecommendDataModel : GNHBaseDataModel

@property (nonatomic, strong) ORHotVideoRecommendItem *hotVideoRecommendItem; // 推荐

// 获取视频
- (BOOL)fetchHotVideoRecommend;

@end

NS_ASSUME_NONNULL_END
