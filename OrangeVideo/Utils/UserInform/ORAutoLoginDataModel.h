//
//  ORAutoLoginDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/22.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORAutoLoginItem : GNHRootBaseItem

@end

@interface ORAutoLoginDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORAutoLoginItem *autoLoginItem;

- (BOOL)autoLogin;

@end

NS_ASSUME_NONNULL_END
