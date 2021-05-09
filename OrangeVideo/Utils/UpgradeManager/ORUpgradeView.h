//
//  AQUpgradeView.h
//  AiQiu
//
//  Created by ChenYuan on 2020/6/13.
//  Copyright © 2020 lesports. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ORUpgradeView : UIView

+ (LYCoverView *)setupView:(NSString *)upgradeContent upgradeUrl:(NSString *)upgradeUrl version:(NSString *)version isForceUpgrade:(BOOL)isforceUpgrade;

@end

NS_ASSUME_NONNULL_END
