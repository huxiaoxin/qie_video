//
//  ORHotChannelDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/19.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"
#import <YYModel/NSObject+YYModel.h>

NS_ASSUME_NONNULL_BEGIN

@interface ORHotChannelDataItem : ORVideoBaseItem

@property (nonatomic, assign) NSInteger favourite;  // 是否收藏 0: 未收藏, 1-已收藏
@property (nonatomic, assign) NSInteger like;  // 是否点赞 0: 未点赞, 1-已点赞

@end

@interface ORHotChannelItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORHotChannelDataItem *> *list; // 数据流
@property (nonatomic, assign) NSInteger currPage; // 当前页数
@property (nonatomic, assign) NSInteger pageSize; // 每页数据
@property (nonatomic, assign) NSInteger totalCount; // 总页数量
@property (nonatomic, assign) NSInteger totalPage; // 总页数

@end


@interface ORHotChannelDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORHotChannelItem *hotChannelItem;

- (BOOL)fetchHotChannelWithPage:(NSInteger)page limit:(NSInteger)limit type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
