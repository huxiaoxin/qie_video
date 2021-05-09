//
//  ORAddFavoriteDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/1.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORAddFavoriteDataModel : GNHBaseDataModel

- (BOOL)addfavoriteWithType:(NSString *)videoId type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
