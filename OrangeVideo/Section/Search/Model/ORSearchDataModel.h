//
//  ORSearchDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/19.
//

#import "GNHBaseDataModel.h"
#import "ORVideoBaseItem.h"

@interface ORSearchItem : GNHRootBaseItem

@property (nonatomic, strong) NSMutableArray <__kindof ORVideoBaseItem *> *list; // 数据流
@property (nonatomic, assign) NSInteger currPage; // 当前页数
@property (nonatomic, assign) NSInteger pageSize; // 每页数据
@property (nonatomic, assign) NSInteger totalCount; // 总页数量
@property (nonatomic, assign) NSInteger totalPage; // 总页数

@end

@interface ORSearchDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORSearchItem *searchItem;

- (BOOL)searchWithKeyword:(NSString *)keyword page:(NSInteger)page limit:(NSInteger)limit params:(NSDictionary *)paramDic;

@end

