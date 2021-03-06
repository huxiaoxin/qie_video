//
//  MCSAssetManager.h
//  SJMediaCacheServer_Example
//
//  Created by 畅三江 on 2020/6/3.
//  Copyright © 2020 changsanjiang@gmail.com. All rights reserved.
//

#import "MCSInterfaces.h"
#import "MCSURL.h"
@class FILEAsset, FILEReader, MCSAssetContent;
@class MCSAsset;

NS_ASSUME_NONNULL_BEGIN
@interface MCSAssetManager : NSObject
+ (instancetype)shared;

/// The maximum number of assets the cache should hold.
///
///     If 0, there is no count limit. The default value is 0.
///
///     This is not a strict limit—if the cache goes over the limit, an asset in the cache could be removed instantly, later, or possibly never, depending on the usage details of the asset.
///
@property (nonatomic) NSUInteger cacheCountLimit; // 个数限制

/// The maximum length of time to keep an asset in the cache, in seconds.
///
///     If 0, there is no expiring limit.  The default value is 0.
///
@property (nonatomic) NSTimeInterval maxDiskAgeForCache; // 保存时长限制

/// The maximum size of the disk cache, in bytes.
///
///     If 0, there is no cache size limit. The default value is 0.
///
@property (nonatomic) NSUInteger maxDiskSizeForCache; // 缓存占用的磁盘空间限制

/// The maximum length of free disk space the device should reserved, in bytes.
///
///     When the free disk space of device is less than or equal to this value, some assets will be removed.
///
///     If 0, there is no disk space limit. The default value is 0.
///
@property (nonatomic) NSUInteger reservedFreeDiskSpace; // 剩余磁盘空间限制

/// When checking the cache for asset removing, filters out assets that are read within a specified time.
///
///     The default value is 60s.
///
@property (nonatomic) NSTimeInterval lastTimeLimit; // 在删除资源时, 过滤掉指定的时间内读取过的资源

/// Empties the cache. This method may blocks the calling thread until file delete finished.
///
- (void)removeAllAssets;

- (void)removeAssetForURL:(NSURL *)URL;

- (void)removeAsset:(id<MCSAsset>)asset;

/// The auto trim check time interval in seconds.
///
///     The manager holds an internal timer to check whether the cache reaches. The default value is 30.
///
@property (nonatomic) NSTimeInterval checkInterval;

@property (nonatomic, readonly) UInt64 countOfBytesAllAssets;

/// Decode the read data.
///
///     This block will be invoked when the reader reads the data, where you can perform some decoding operations on the data.
///
@property (nonatomic, copy, nullable) NSData *(^readDataDecoder)(NSURLRequest *request, NSUInteger offset, NSData *data);


- (nullable __kindof id<MCSAsset>)assetWithURL:(NSURL *)URL;

- (nullable __kindof id<MCSAsset>)assetWithName:(NSString *)name type:(MCSAssetType)type;

- (BOOL)isAssetStoredForURL:(NSURL *)URL;

- (nullable id<MCSAssetReader>)readerWithRequest:(NSURLRequest *)proxyRequest networkTaskPriority:(float)networkTaskPriority delegate:(nullable id<MCSAssetReaderDelegate>)delegate;

- (void)willReadAssetForURL:(NSURL *)URL;

- (void)asset:(id<MCSAsset>)asset setShouldHoldCache:(BOOL)shouldHoldCache;
@end

@interface NSURL (MCSAssetManagerExtended)
- (void)mcs_setShouldHoldCache:(BOOL)shouldHoldCache;
@end
NS_ASSUME_NONNULL_END

// 缓存的资源个数超出限制时, 可能会移除某些资源
// 保存的资源过期时, 可能会移除某些资源
// 缓存占用的磁盘空间超出限制时, 可能会移除某些资源
// 剩余磁盘空间小于限制时, 可能会移除某些资源
