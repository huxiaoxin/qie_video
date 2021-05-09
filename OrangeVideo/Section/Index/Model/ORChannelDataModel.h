//
//  ORChannelDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/21.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORChannelItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *list; // 数据流
@property (nonatomic, assign) NSInteger currPage; // 当前页数
@property (nonatomic, assign) NSInteger pageSize; // 每页数据
@property (nonatomic, assign) NSInteger totalCount; // 总页数量
@property (nonatomic, assign) NSInteger totalPage; // 总页数

@end

@interface ORChannelDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORChannelItem *channelItem;

- (BOOL)fetchChannelWithPage:(NSInteger)page limit:(NSInteger)limit type:(NSString *)type childtype:(NSString *)childtype;

@end

NS_ASSUME_NONNULL_END
