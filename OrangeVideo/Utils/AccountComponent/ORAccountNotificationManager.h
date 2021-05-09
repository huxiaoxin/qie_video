//
//  ORAccountNotificationManager.h
//  ZhangYuSports
//
//  Created by ChenYuan on 2018/11/3.
//  Copyright © 2018年 ChenYuan. All rights reserved.
//

#import "ORSingleton.h"

@protocol ORAccountObserver <NSObject>

@optional

// 当前登录的用户信息发生改变
- (void)handleLoginUserInfoChanged;

// accessToken失效
- (void)handleAccessTokenInvalidated:(NSNumber *)returnCode;

// 账号切换
- (void)handleAccountChanged:(NSDictionary *)userInfo;

// 账号登出
- (void)handleAccountLogout:(NSDictionary *)userInfo;

// 账号登录
- (void)handleAccountLogin:(NSDictionary *)userInfo;

@end

@interface ORAccountNotificationManager : ORSingleton


// 注册
- (void)registerObserver:(NSObject<ORAccountObserver> *)observer;

// 移除注册
- (void)removeObserver:(NSObject<ORAccountObserver> *)observer;

@end
