//
//  ZYAgreementHints.h
//  ZhangYuSports
//
//  Created by 吴浪 on 2019/12/21.
//  Copyright © 2019 ChenYuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ZYAgreementActionType) {
    ZYAgreementActionTypePrivacyAgreement = 0, // 隐私协议
    ZYAgreementActionTypeUserAgreement,        // 用户协议
    ZYAgreementActionTypeDisagree,             // 不同意
    ZYAgreementActionTypeAgree,                // 同意
};

@interface ZYAgreementHints : UIView

- (instancetype)initWithHints:(NSString *)hints links:(nullable NSDictionary<NSString *, NSString *> *)links;
- (void)showInView:(UIView *)view clickAction:(void(^)(NSString *link, ZYAgreementActionType type))clickAction;
- (void)disMiss;

@end

NS_ASSUME_NONNULL_END
