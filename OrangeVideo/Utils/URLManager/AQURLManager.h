//
//  AQURLManager.h
//  ShouMi
//
//  Created by ChenYuan on 2020/7/15.
//  Copyright © 2020 lesports. All rights reserved.
//

#import "ORSingleton.h"

NS_ASSUME_NONNULL_BEGIN

@interface AQURLManager : ORSingleton
// type  跳转类型 0: 不跳转, 1: H5, 2: 原生界面 3:详情页 
- (void)jumpWithType:(NSString *)urlStr type:(NSInteger)type title:(nonnull NSString *)title;

@end

NS_ASSUME_NONNULL_END
