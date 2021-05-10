//
//  ORVideoBaseItem.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "ORVideoBaseItem.h"

@implementation ORVideoBaseItem

- (NSString *)JSONKeyForProperty:(NSString *)propertyKey
{
    if ([propertyKey isEqualToString:@"idStr"]) {
        return @"id";
    }
    return [super JSONKeyForProperty:propertyKey];
}

@end
