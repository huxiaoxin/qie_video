//
//  OREditUserInformViewController.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "GNHBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^OREditUserInformBlock)(NSString *nickName);

@interface OREditUserInformViewController : GNHBaseTableViewController
@property (nonatomic, copy) NSString *nickname;   // 昵称
@property (nonatomic, copy) NSString *anchorUrl;  // 头像地址

@property (nonatomic, copy) OREditUserInformBlock editUserInformBlock;

@end

NS_ASSUME_NONNULL_END
