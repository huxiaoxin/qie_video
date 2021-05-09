//
//  ORFavoriteListDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/3.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORFavoriteListDataItem : ORVideoBaseItem

@end

@interface ORFavoriteListItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray <__kindof ORFavoriteListDataItem *> *list; // 数据流
@property (nonatomic, assign) NSInteger currPage; // 当前页数
@property (nonatomic, assign) NSInteger pageSize; // 每页数据
@property (nonatomic, assign) NSInteger totalCount; // 总页数量
@property (nonatomic, assign) NSInteger totalPage; // 总页数

@end

@interface ORFavoriteListDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORFavoriteListItem *favoriteListItem;

- (BOOL)fetchFavoriteWithPage:(NSInteger)page limit:(NSInteger)limit;

@end

NS_ASSUME_NONNULL_END
