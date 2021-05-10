//
//  ORHotVideoView.h
//  ORHotVideo
//
//  Created by QuintGao on 2018/9/23.
//  Copyright © 2018 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORHotChannelDataModel.h"
#import "ORHotVideoDetailDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@class ORHotVideoView;

@protocol ORHotVideoViewDelegate <NSObject>

@optional

- (void)videoView:(ORHotVideoView *)videoView didClickPraise:(ORHotChannelDataItem *)videoModel;
- (void)videoView:(ORHotVideoView *)videoView didClickShare:(ORHotChannelDataItem *)videoModel;
- (void)videoView:(ORHotVideoView *)videoView didClickCollect:(ORHotChannelDataItem *)videoModel;
- (void)videoView:(ORHotVideoView *)videoView didPanWithDistance:(CGFloat)distance isEnd:(BOOL)isEnd;

@end

typedef void(^ORUpdateVideoDetailCompleteBlock)(NSString *videoId);

@interface ORHotVideoView : UIView

@property (nonatomic, copy) ORUpdateVideoDetailCompleteBlock updateVideoDetailCompleteBlock;

@property (nonatomic, weak) id<ORHotVideoViewDelegate>   delegate;

@property (nonatomic, assign) NSString *videotype; // 视频类型

// 多条数据
- (void)setModels:(NSArray *)models index:(NSInteger)index;
- (void)setModels:(NSArray *)models index:(NSInteger)index canRefresh:(BOOL)canRefresh;

// 刷新UI
- (void)refreshUI:(ORHotVideoDetailItem *)videoDetailItem;

// 收藏
- (void)favorite:(NSString *)videoId actionType:(NSInteger)action; // 0-取消收藏；1-收藏

// 点赞
- (void)praise:(NSString *)videoId actionType:(NSInteger)action; // 0-取消点赞；1-点赞

#pragma mark - class method

- (void)vc_viewDidAppear;
- (void)vc_viewWillDisappear;
- (void)vc_viewDidDisappear;

@end

NS_ASSUME_NONNULL_END
