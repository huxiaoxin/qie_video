//
//  ORFavoriteListDataModel.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/3.
//

#import "ORFavoriteListDataModel.h"

@implementation ORFavoriteListDataItem

@end

@implementation ORFavoriteListItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"list"]) {
        return [ORFavoriteListDataItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end

@implementation ORFavoriteListDataModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.address = [NSString gnh_addressWithString:ORFavoriteListAddress];
        self.hostType = GNHBaseURLTypeClient;
        self.parseCls = [ORFavoriteListItem class];
        self.isAutoShowNetworkErrorToast = NO;
        self.requestType = MDFRequestTypeGet;
    }
    return self;
}

- (BOOL)fetchFavoriteWithPage:(NSInteger)page limit:(NSInteger)limit
{
    if (self.isLoading) {
        return NO;
    }
    
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
        _favoriteListItem = (ORFavoriteListItem *)self.parsedItem;
    }
}

@end

