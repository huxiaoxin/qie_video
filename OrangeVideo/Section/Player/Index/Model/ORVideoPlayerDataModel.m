//
//  ORVideoPlayerDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "ORVideoPlayerDataModel.h"

@implementation ORVideoSourceItem

@end

@implementation ORVideoDetailItem

- (NSString *)JSONKeyForProperty:(NSString *)propertyKey
{
    if ([propertyKey isEqualToString:@"idStr"]) {
        return @"id";
    }
    return [super JSONKeyForProperty:propertyKey];;
}

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"sourceList"]) {
        return [ORVideoSourceItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORVideoPlayerDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORVideoDetailAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORVideoDetailItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchVideoDetialWithParams:(NSString *)videoId videoType:(NSString *)type sourceName:(NSString *)sourceName episode:(NSString *)episode
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!videoId.length) {
        return NO;
    }
    
    NSString *address = [NSString gnh_addressWithString:ORVideoDetailAddress];
    self.address = [address stringByAppendingFormat:@"/%@", type];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = videoId;
    params[@"sourceName"] = sourceName;
    if (episode.length) {
        params[@"episode"] = episode;
    }
    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _videoDetailItem = (ORVideoDetailItem *)self.parsedItem;
    }
}

@end
