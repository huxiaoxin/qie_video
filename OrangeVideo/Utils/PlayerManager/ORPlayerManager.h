//
//  ORPlayerManager.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/26.
//

#import "ORSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORPlayerManager : ORSingleton

- (void)jumpChannelWith:(NSString *)videoId type:(NSString *)channelType cover:(NSString *)coverUrl;

@end

NS_ASSUME_NONNULL_END
