//
//  ORHotChannelDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/19.
//

#import "ORHotChannelDataModel.h"

@implementation ORHotChannelDataItem

@end

@implementation ORHotChannelItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"list"]) {
        return [ORHotChannelDataItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORHotChannelDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORHotChannelAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORHotChannelItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchHotChannelWithPage:(NSInteger)page limit:(NSInteger)limit type:(NSString *)type
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!type.length) {
        return NO;
    }
    
    NSString *address = [NSString gnh_addressWithString:ORHotChannelAddress];
    self.address = [address stringByAppendingFormat:@"/%@", type];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @(page);
    params[@"limit"] = limit > 10 ? @(limit) : @(10);

    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _hotChannelItem = (ORHotChannelItem *)self.parsedItem;        
    }
}


@end
