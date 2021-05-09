//
//  ORMenuChannelManager.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/27.
//

#import "ORSingleton.h"
#import "ORFetchChannelMenuDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORMenuChannelManager : ORSingleton

@property (nonatomic, strong) ORChannelMenuItem *channelMenuItem;

- (NSInteger)getVideoUserId:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
