//
//  ORChannelSenceDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/22.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORChannelSenceDataItem : GNHBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *videoDtoList; // 数据流
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *scene;

@end

@interface ORChannelSenceItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORChannelSenceDataItem *> *data; // 数据流

@end

@interface ORChannelSenceDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORChannelSenceItem *channelSenceItem;

- (BOOL)fetchChannelSenceDataWithType:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
