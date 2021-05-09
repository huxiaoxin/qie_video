//
//  ORPlayerViewController.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "GNHBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoPlayerViewController : GNHBaseTableViewController
@property (nonatomic, copy) NSString *videoId; // 视频ID
@property (nonatomic, copy) NSString *videotype; // 视频类型
@property (nonatomic, copy) NSString *coverUrl; // 视频封面

@end

NS_ASSUME_NONNULL_END
