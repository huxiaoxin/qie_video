//
//  ORRecommecListDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/14.
//

#import "GNHBaseDataModel.h"
#import "ORIndexChannelItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoMoreDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORIndexChannelItem *videoMoreItem; // 更多数据

- (BOOL)fetchHomeChannelWithPage:(NSInteger)page limit:(NSInteger)limit scene:(NSString *)scene sceneType:(NSString *)sceneType;

@end

NS_ASSUME_NONNULL_END
