//
//  GNHKitNetworkAddressHeader.h
//  GeiNiHua
//
//  Created by ChenYuan on 17/3/14.
//  Copyright © 2017年 GNH. All rights reserved.
//

#ifndef GNHKitNetworkAddressHeader_h
#define GNHKitNetworkAddressHeader_h

#pragma mark - 信息采集/上报

#pragma mark - 启动
// 上传WiFi信息
static NSString *const GNHUploadWiFiInformationAddress = @"collect/addWifi?";
//上传错误日志
static NSString *const GNHUploadErrorLogAddress = @"help/appErrorLog";
// 字段监控
static NSString *const GNHMonitorParameterAddress = @"user/authentication";
// 启动日志
static NSString *const GNHLaunchLogAddress = @"home/index/applaunchmulti";
// /*1.是否上传通讯录 2.上传通讯录地址  (上传文件)uploadContacts (上传json)uploadredis */
static NSString *const GNHUploadRedisAddress = @"order2/user/uploadredis";
static NSString *const GNHAddressBookAddress = @"tianji-contacts-ms/api/v1/upload";
// 获取用户账单
static NSString *const GNHGetUserCenterBillAddress = @"bill/getUserCenterBill";
// App 启动同步接口
static NSString *const GNHAppSyncAddress = @"appSwitch/appSyncNew";


#endif /* GNHKitNetworkAddressHeader_h */
