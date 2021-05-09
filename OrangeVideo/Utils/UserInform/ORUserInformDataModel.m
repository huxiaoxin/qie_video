//
//  ORUserInformDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/22.
//

#import "ORUserInformDataModel.h"

@implementation ORUserInformItem

@end

@implementation ORUserInformDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORUserInformAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORUserInformItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.isAutoShowBusinessErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchUserInform
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!ORShareAccountComponent.accesstoken.length) {
        return NO;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"token"] = ORShareAccountComponent.accesstoken;
    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _userInformItem = (ORUserInformItem *)self.parsedItem;
    }
}


@end
