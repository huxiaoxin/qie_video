//
//  ORChannelDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/21.
//

#import "ORChannelDataModel.h"

@implementation ORChannelItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"list"]) {
        return [ORVideoBaseItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORChannelDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORChannelDataAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORChannelItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchChannelWithPage:(NSInteger)page limit:(NSInteger)limit type:(NSString *)type childtype:(NSString *)childtype
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!type.length) {
        return NO;
    }
    
    NSString *address = [NSString gnh_addressWithString:ORChannelDataAddress];
    self.address = [address stringByAppendingFormat:@"/%@", type];

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @(page);
    params[@"limit"] = limit > 10 ? @(limit) : @(10);
    
    if (childtype.length) {
        params[@"childType"] = childtype;
    }

    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _channelItem = (ORChannelItem *)self.parsedItem;
    }
}

@end
