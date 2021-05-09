//
//  ORHotDetailViewController.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/24.
//

#import "GNHBaseViewController.h"
#import "ORHotVideoView.h"
#import "ORHotChannelDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ORHotDetailViewController;

@interface ORHotDetailViewController : GNHBaseViewController

@property (nonatomic, strong) ORHotVideoView *videoView;

// 播放单个视频
- (instancetype)initWithVideoModel:(ORHotChannelDataItem *)videoItem;

// 播放一组视频，并指定播放位置
- (instancetype)initWithVideos:(NSArray *)videos index:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
