//
//  ORVideoReportManager.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/4.
//

#import "ORSingleton.h"
#import "ORWatchRecordDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoModel : ORWatchRecordDataItem
@end

@interface ORVideoReportManager : ORSingleton
@property (nonatomic, strong) NSMutableArray <__kindof ORVideoModel *> *videoItems;

// 存储视频信息
- (void)restoreVideoHistory:(ORVideoModel *)videoItem;
- (void)deleteVideoHistorey:(NSArray *)videos;

- (BOOL)videoReportWithData:(NSString *)type videoId:(NSString *)videoId watchSeconds:(NSInteger)watchSeconds;

@end

NS_ASSUME_NONNULL_END
