//
//  ORChannelBaseItemView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/20.
//

#import <UIKit/UIKit.h>
#import "ORIndexChannelItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORChannelBaseItemView : UIView
- (void)refreshData:(ORVideoBaseItem *)dataItem;

@end

NS_ASSUME_NONNULL_END
