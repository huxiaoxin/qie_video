//
//  ORFetchChannelMenuDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/14.
//

#import "ORFetchChannelMenuDataModel.h"

@implementation ORChannelMenuDataItem

@end

@implementation ORChannelMenuItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"data"]) {
        return [ORChannelMenuDataItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORFetchChannelMenuDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORIndexChannelMenuAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORChannelMenuItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchChannelMenuWithScene:(NSString *)scene
{
    if (self.isLoading) {
        return NO;
    }
    
    if (!scene.length) {
        return NO;
    }
    
    NSString *address = [NSString gnh_addressWithString:ORIndexChannelMenuAddress];
    self.address = [address stringByAppendingFormat:@"/%@", scene];
        
//    NSMutableDictionary *params = [NSMutableDictionary dictionary];
//    params[@"scene"] = scene;
//    self.params = params;
    
    return [super load];
}

- (void)handleDataAfterParsed
{
    [super handleDataAfterParsed];
    
    if ([self.parsedItem isKindOfClass:[GNHRootBaseItem class]]) {
        _channelMenuItem = (ORChannelMenuItem *)self.parsedItem;
    }
}


@end

