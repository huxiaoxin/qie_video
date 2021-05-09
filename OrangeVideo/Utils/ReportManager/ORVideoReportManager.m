//
//  ORVideoReportManager.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/2/4.
//

#import "ORVideoReportManager.h"
#import "ORVideoReportDataModel.h"

static NSString *const ORVideoInfoKey = @"UserInfoKey"; //用户数据存储key
static NSString *const ORCurrentVideoInfoKey = @"currentVideoInfoKey"; // 视频信息

@implementation ORVideoModel

@end

@interface ORVideoReportManager ()
@property (nonatomic, strong) ORVideoReportDataModel *videoReportDataModel; // 上报用户观看记录

@property (nonatomic, strong) MDFDBStorage *storage;

@end

@implementation ORVideoReportManager

#pragma mark - Init

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _storage = [[MDFDBStorage alloc] initWithNameSpace:[self nameSpaceString]];
                
        [self refreshAccountData];
    }
    return self;
}

- (NSString *)nameSpaceString
{
    return [NSString stringWithFormat:@"%@",ORVideoInfoKey];
}

- (void)refreshAccountData
{
    if ([self.storage isExistObjectForKey:ORCurrentVideoInfoKey]) {
        self.videoItems = [self.storage objectForKey:ORCurrentVideoInfoKey error:nil];
    } else {
        self.videoItems = [NSMutableArray array];
    }
}

#pragma mark - storeData

- (void)restoreVideoHistory:(ORVideoModel *)videoItem
{
    NSMutableArray <__kindof ORVideoModel *> *tmpVideos = [self.videoItems mutableCopy];
    __block BOOL flag = NO;
    [tmpVideos enumerateObjectsUsingBlock:^(__kindof ORVideoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.idStr isEqualToString:videoItem.idStr] && [obj.type isEqualToString:videoItem.type]) {
            [self.videoItems mdf_safeReplaceObjectAtIndex:idx withObject:videoItem];
            flag = YES;
            *stop = YES;
        }
    }];
    if (!flag) {
        [self.videoItems mdf_safeAddObject:videoItem];
    }
    [self.storage setObject:self.videoItems forKey:ORCurrentVideoInfoKey error:nil];
}

- (void)deleteVideoHistorey:(NSArray *)videos
{
    NSMutableArray <__kindof ORVideoModel *> *tmpVideos = [self.videoItems mutableCopy];
    
    [videos enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ORWatchRecordDataItem *videoItem = (ORWatchRecordDataItem *)obj;
        [tmpVideos enumerateObjectsUsingBlock:^(__kindof ORVideoModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.idStr isEqualToString:videoItem.idStr]) {
                [self.videoItems mdf_safeRemoveObject:obj];
                *stop = YES;
            }
        }];
    }];

    [self.storage setObject:self.videoItems forKey:ORCurrentVideoInfoKey error:nil];
}

#pragma mark - setupData

- (BOOL)videoReportWithData:(NSString *)type videoId:(NSString *)videoId watchSeconds:(NSInteger)watchSeconds
{
    return [self.videoReportDataModel videoReportWithData:videoId type:type time:watchSeconds];
}

#pragma mark - Handle Data

- (void)handleDataModelSuccess:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelSuccess:gnhModel];
    if ([gnhModel isMemberOfClass:[ORVideoReportDataModel class]]) {
 
    }
}

- (void)handleDataModelError:(GNHBaseDataModel *)gnhModel
{
    [super handleDataModelError:gnhModel];
}

#pragma mark - Properties

- (ORVideoReportDataModel *)videoReportDataModel
{
    if (!_videoReportDataModel) {
        _videoReportDataModel = [self produceModel:[ORVideoReportDataModel class]];
    }
    return _videoReportDataModel;
}

@end
