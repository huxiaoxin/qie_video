//
//  ZYUMConfig.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORUMConfig.h"
#import <UMCommon/MobClick.h>
#import <UMCommon/UMCommon.h>
#import "ORMainAPI.h"
#import "SVProgressHUD+ZY.h"

#import <UMCommon/UMCommon.h>

@implementation ORUMConfig

#pragma mark - LifeCycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self umAnalyticsConfig];
    }
    return self;
}

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)umAnalyticsConfig {
    [UMConfigure initWithAppkey:umengAccesskey channel:ORchannel];
}

+ (void)analytics:(NSString *)event attributes:(NSDictionary *)attributes {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"user_id"] = @([ORAccountComponent sharedInstance].fetchUserID).stringValue;
    if (attributes.count) {
        [dict addEntriesFromDictionary:attributes];
    }
    [MobClick event:event attributes:dict];
#ifdef DEBUG
    if ([ORUMConfig shared].um_deubg) {
        [[[UIAlertView alloc] initWithTitle:nil message:dict.mdf_jsonEncodedKeyValueString delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil] show];
    }
#endif
}

@end

