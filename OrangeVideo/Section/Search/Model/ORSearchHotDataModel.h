//
//  ORSearchHotDataModel.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/25.
//

#import "GNHBaseDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ORSearchHotKeyItem : GNHRootBaseItem
@property (nonatomic, strong) NSMutableArray *data;

@end

@interface ORSearchHotDataModel : GNHBaseDataModel
@property (nonatomic, strong) ORSearchHotKeyItem *searchHotKeyItem;

- (BOOL)hotKeywords;

@end

NS_ASSUME_NONNULL_END
