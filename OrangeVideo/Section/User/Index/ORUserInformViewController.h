//
//  ORUserInformViewController.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "GNHBaseTableViewController.h"
#import "ORUserInformDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORUserInformVCBlock)(void);

@interface ORUserInformViewController : GNHBaseTableViewController
@property (nonatomic, strong) ORUserInformItem *userInfoItem; // 用户信息
@property (nonatomic, copy) ORUserInformVCBlock userInformVCBlock;

@end

NS_ASSUME_NONNULL_END
