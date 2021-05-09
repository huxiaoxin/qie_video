//
//  ORUserInformDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/22.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORUserInformItem : GNHRootBaseItem

@property (nonatomic, assign) NSUInteger userId; // 用户ID
@property (nonatomic, copy) NSString *mobile; // 手机号
@property (nonatomic, assign) NSUInteger deleted; // 是否用户已删除
@property (nonatomic, copy) NSString *avatar; // 用户头像
@property (nonatomic, copy) NSString *username; // 用户昵称
@property (nonatomic, copy) NSString *updateTime; // 更新时间
@property (nonatomic, copy) NSString *createTime; // 创建时间

@end

@interface ORUserInformDataModel : GNHBaseDataModel

@property (nonatomic, strong) ORUserInformItem *userInformItem;

- (BOOL)fetchUserInform;

@end

NS_ASSUME_NONNULL_END
