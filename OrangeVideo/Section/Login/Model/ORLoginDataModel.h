//
//  GNHLoginDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORLoginItem : GNHRootBaseItem

@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *avatarUrl;

@end

@interface ORLoginDataModel : GNHBaseDataModel

@property (nonatomic, strong) ORLoginItem *loginItem;

/// 登录
/// @param phone 手机
/// @param code 验证码
- (BOOL)loginAccount:(NSString *)phone code:(NSString *)code;

@end

NS_ASSUME_NONNULL_END
