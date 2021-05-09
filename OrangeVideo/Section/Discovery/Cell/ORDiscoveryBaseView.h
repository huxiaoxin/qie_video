//
//  ORDiscoveryCellView.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import <UIKit/UIKit.h>
#import "ORDiscoveryDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORDiscoveryBaseView : UIView

- (void)refreshData:(ORDiscoveryDataItem *)dataItem;

@end

NS_ASSUME_NONNULL_END
