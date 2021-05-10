//
//  ORIndexChannelItem.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/20.
//

#import "GNHBaseItem.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORIndexChannelItem : GNHRootBaseItem
@property (nonatomic, assign) NSInteger currPage; // 当前页数
@property (nonatomic, assign) NSInteger pageSize; // 每页数据
@property (nonatomic, assign) NSInteger totalCount; // 总页数量
@property (nonatomic, assign) NSInteger totalPage; // 总页数
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *list; // 数据流

@end

NS_ASSUME_NONNULL_END
