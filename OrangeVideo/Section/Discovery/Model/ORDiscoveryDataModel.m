//
//  ORDiscoveryDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/23.
//

#import "ORDiscoveryDataModel.h"

@implementation ORDiscoveryDataItem

@end

@implementation ORDiscoveryItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"list"]) {
        return [ORDiscoveryDataItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORDiscoveryDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORDiscoverDataAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORDiscoveryItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchDiscoverChannelWithPage:(NSInteger)page limit:(NSInteger)limit params:(NSDictionary *)paramDic
{
    if (self.isLoading) {
        return NO;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @(page);
    params[@"limit"] = limit > 10 ? @(limit) : @(10);
    params[@"keyword"] = paramDic[@"keyword"];
    params[@"videoType"] = paramDic[@"videoType"];
    params[@"yearType"] = paramDic[@"yearType"];
    params[@"areaType"] = paramDic[@"areaType"];
    params[@"childType"] = paramDic[@"childType"];
    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _discoveryItem = (ORDiscoveryItem *)self.parsedItem;
    }
}


@end
