//
//  ORHotVideoRecommendDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/22.
//

#import "ORHotVideoRecommendDataModel.h"

@implementation ORHotVideoRecommendItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"data"]) {
        return [ORHotChannelDataItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORHotVideoRecommendDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORHotVideoRecommendAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORHotChannelItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchHotVideoRecommend
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
        _hotVideoRecommendItem = (ORHotVideoRecommendItem *)self.parsedItem;
    }
}

@end
