//
//  ORSearchChannelViewController.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "GNHBaseTableViewController.h"
#import "ORSearchDataModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^ORSearchChannelCompleteBlock)(void);

@interface ORSearchChannelViewController : GNHBaseTableViewController
@property (nonatomic, copy) NSString *typeId; // 分类
@property (nonatomic, copy) NSString *keyword; // 关键词

@property (nonatomic, copy) ORSearchChannelCompleteBlock searchChannelCompleteBlock;

@end

NS_ASSUME_NONNULL_END
