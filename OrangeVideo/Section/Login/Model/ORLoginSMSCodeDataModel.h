//
//  ORFetchSMSCodeDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORLoginSMSCodeDataModel : GNHBaseDataModel

- (BOOL)sendSMS:(NSString *)phone;

@end

NS_ASSUME_NONNULL_END
