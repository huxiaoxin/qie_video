//
//  ORDeleteFavoriteDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/1.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORDeleteFavoriteDataModel : GNHBaseDataModel

- (BOOL)deleteFavoriteWithData:(NSMutableArray <__kindof NSDictionary *> *)params;

@end

NS_ASSUME_NONNULL_END
