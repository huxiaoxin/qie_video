//
//  ORHotVideoPraiseDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/3.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORHotVideoPraiseDataModel : GNHBaseDataModel

- (BOOL)addPraiseWithType:(NSString *)videoId type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
