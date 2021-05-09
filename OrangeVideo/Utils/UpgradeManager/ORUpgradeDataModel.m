//
//  AQUpgradeDataModel.m
//  AiQiu
//
//  Created by ChenYuan on 2020/6/13.
//  Copyright © 2020 lesports. All rights reserved.
//

#import "ORUpgradeDataModel.h"

@implementation ORUpgradeItem

@end

@implementation ORUpgradeDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORUpgradeAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORUpgradeItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchUpgradeInfo
{
    if (self.isLoading) {
        return NO;
    }
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _upgradeItem = (ORUpgradeItem *)self.parsedItem;
    }
}


@end
