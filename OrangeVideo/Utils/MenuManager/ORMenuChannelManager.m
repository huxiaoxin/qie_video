//
//  ORMenuChannelManager.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "ORMenuChannelManager.h"

#define ORMenuChannelKey @"MenuChannelKey"

@interface ORMenuChannelManager ()

@property (nonatomic, strong) NSMutableDictionary *menuDictory;

@end

@implementation ORMenuChannelManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSDictionary *dic =  (NSDictionary *)[ORUserDefaults objectForKey:ORMenuChannelKey];
        self.menuDictory = [dic mutableCopy];
        if (!self.menuDictory) {
            self.menuDictory = [NSMutableDictionary dictionary];
        }
    }
    return self;
}

- (NSInteger)getVideoUserId:(NSString *)key
{
    NSString *value = [self.menuDictory mdf_stringForKey:key];
    if (!value.length) {
        NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
        NSInteger valueId = interval;
        value = @(valueId).stringValue;
        [self.menuDictory mdf_safeSetObject:value forKey:key];
        
        [ORUserDefaults setObject:self.menuDictory forKey:ORMenuChannelKey];
        [ORUserDefaults synchronize];
    }
    
    return [value integerValue];
}


@end
