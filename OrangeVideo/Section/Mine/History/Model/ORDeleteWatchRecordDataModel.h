//
//  ORDeleteWatchRecordDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/4.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORDeleteWatchRecordDataModel : GNHBaseDataModel

- (BOOL)deleteWatchRecordWithData:(NSMutableArray <__kindof NSDictionary *> *)params;

@end

NS_ASSUME_NONNULL_END
