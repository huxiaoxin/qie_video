//
//  ORDiscoveryMenuDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "ORDiscoveryMenuDataModel.h"

@implementation ORDiscoveryTypeItem

@end

@implementation ORDiscoveryMenuItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"channelTypes"] ||
        [propertyName isEqualToString:@"areaTypes"] ||
        [propertyName isEqualToString:@"yearTypes"]) {
        return [ORDiscoveryTypeItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORDiscoveryMenuDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORDiscoverConfigAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORDiscoveryMenuItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchDiscoveryMenu:(NSString *)type
{
    if (self.isLoading) {
        return NO;
    }
    
    NSString *address = [NSString gnh_addressWithString:ORDiscoverConfigAddress];
    if (type.length) {
        self.address = [address stringByAppendingFormat:@"/%@", type];
    } else {
        self.address = [address stringByAppendingString:@"/all"];
    }
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _discoveryMenuItem = (ORDiscoveryMenuItem *)self.parsedItem;
    }
}


@end
