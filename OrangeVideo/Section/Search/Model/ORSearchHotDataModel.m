//
//  ORSearchHotDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "ORSearchHotDataModel.h"

@implementation ORSearchHotKeyItem

@end

@implementation ORSearchHotDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORSearchHotKeyAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORSearchHotKeyItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)hotKeywords
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
        _searchHotKeyItem = (ORSearchHotKeyItem *)self.parsedItem;
    }
}

@end
