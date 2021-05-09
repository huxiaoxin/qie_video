//
//  ORVideoIntroView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/26.
//

#import <UIKit/UIKit.h>
#import "ORVideoPlayerDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORVideoIntroCompleteBlock)(void);

@interface ORVideoIntroView : UIView

@property (nonatomic, copy) ORVideoIntroCompleteBlock videoIntroCompleteBlock;

+ (LYCoverView *)showIntroAlertView:(ORVideoDetailItem *)detailItem completeBlock:(ORVideoIntroCompleteBlock)completeBlock;


@end

NS_ASSUME_NONNULL_END
