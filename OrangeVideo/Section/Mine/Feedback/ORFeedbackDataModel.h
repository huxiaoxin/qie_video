//
//  ORFeedbackDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/17.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORFeedbackDataModel : GNHBaseDataModel

- (BOOL)submitWithContent:(NSString *)content;

@end

NS_ASSUME_NONNULL_END
