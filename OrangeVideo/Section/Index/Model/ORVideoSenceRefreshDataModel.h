//
//  ORVideoSenceRefreshDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/22.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoSenceItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *data; // 数据流

@end

@interface ORVideoSenceRefreshDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORVideoSenceItem *videoSenceItem;

- (BOOL)fetchChannelSenceDataWithType:(NSString *)senceType videoType:(NSString *)vidoeType;

@end

NS_ASSUME_NONNULL_END
