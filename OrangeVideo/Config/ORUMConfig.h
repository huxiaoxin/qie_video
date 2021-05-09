//
//  ZYUMConfig.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORUMConfig : ORSingleton
@property (nonatomic, assign) BOOL um_deubg;

+ (void)analytics:(NSString *)event attributes:(NSDictionary *)attributes;

@end

NS_ASSUME_NONNULL_END
