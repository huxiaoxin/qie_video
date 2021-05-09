//
//  ORFetchSMSCodeDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/18.
//

#import "ORLoginSMSCodeDataModel.h"
#import <AFNetworking.h>
#import "NSString+AES128.h"
#import "NSData+DES.h"

#define gkey @"1IvFcjTxtXyD8Ki1nPbm1IpfBR9GhOUn"

@implementation ORLoginSMSCodeDataModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORFetchSMSCodeAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [GNHRootBaseItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.isAutoShowBusinessErrorToast = YES;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)sendSMS:(NSString *)phone
{
    if (self.isLoading) {
        return NO;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    phone = [NSData encryptWithText:phone key:gkey];
    params[@"mobile"] = phone;
    
    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
}

@end
