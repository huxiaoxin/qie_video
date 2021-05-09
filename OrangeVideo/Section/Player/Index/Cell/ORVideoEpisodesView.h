//
//  ORVideoEpisodesView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/26.
//

#import <UIKit/UIKit.h>
#import "ORVideoPlayerDataModel.h"
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ORVideoEpisodesCompleteBlock)(NSInteger index); // 第几集

@interface ORVideoEpisodesView : UIView

@property (nonatomic, copy) ORVideoEpisodesCompleteBlock videoEpisodesCompleteBlock;

+ (LYCoverView *)showIntroAlertView:(ORVideoDetailItem *)detailItem completeBlock:(ORVideoEpisodesCompleteBlock)completeBlock;

@end

NS_ASSUME_NONNULL_END
