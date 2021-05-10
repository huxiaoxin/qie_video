//
//  ORIndexChannelItem.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/20.
//

#import "ORIndexChannelItem.h"

@implementation ORIndexChannelItem

- (Class)classForObject:(id)arrayElement inArrayWithPropertyName:(NSString *)propertyName
{
    if ([propertyName isEqualToString:@"list"]) {
        return [ORVideoBaseItem class];
    }
    return [super classForObject:arrayElement inArrayWithPropertyName:propertyName];
}

@end
