//
//  ORUserInformManager.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/22.
//

#import "ORSingleton.h"
#import "ORUserInformDataModel.h"

typedef void(^ORUpdateUserInfoCompleteHandle)(BOOL success, ORUserInformItem *userInfo);

@interface ORUserInformManager : ORSingleton

- (ORUserInformItem *)fetchUserInfo;

- (BOOL)updateUserInfo:(ORUpdateUserInfoCompleteHandle)completeBlock;

- (void)autoLogin;

@end
