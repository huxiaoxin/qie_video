//
//  ORUpdateUserInformDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORUpdateUserInformDataModel : GNHBaseDataModel
- (BOOL)updateUserInform:(NSString *)uname avatarUrl:(NSString *)avatarUrl;

@end

NS_ASSUME_NONNULL_END
