//
//  ORHotVideoDetailDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/2.
//

#import "ORHotVideoDetailDataModel.h"

@implementation ORHotVideoDetailItem

- (NSString *)JSONKeyForProperty:(NSString *)propertyKey
{
    if ([propertyKey isEqualToString:@"idStr"]) {
        return @"id";
    }
    return [super JSONKeyForProperty:propertyKey];;
}

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"episodes"]) {
        return [ORVideoBaseItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORHotVideoDetailDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORHotDetailAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORHotVideoDetailItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchVideoDetialWithId:(NSString *)videoId
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!videoId.length) {
        return NO;
    }
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = videoId;
    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _hotVideoDetailItem = (ORHotVideoDetailItem *)self.parsedItem;
    }
}

@end
