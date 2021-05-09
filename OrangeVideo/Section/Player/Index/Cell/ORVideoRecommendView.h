//
//  ORVideoRecommendView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/26.
//

#import <UIKit/UIKit.h>
#import "ORVideoBaseItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORVideoRecommendView : UIView

- (void)refreshData:(ORVideoBaseItem *)dataItem;

@end

NS_ASSUME_NONNULL_END
