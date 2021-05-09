//
//  ORVideoReportDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/4.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoReportDataModel : GNHBaseDataModel

- (BOOL)videoReportWithData:(NSString *)videoId type:(NSString *)type time:(NSInteger)watchSeconds;

@end

NS_ASSUME_NONNULL_END
