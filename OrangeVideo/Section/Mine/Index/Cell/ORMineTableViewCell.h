//
//  ORMineTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/15.
//

#import "GNHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ORMineCellType) {
    ORMineCellTypeHistoryRecord = 0, // 观看历史
    ORMineCellTypeDownload, // 我的下载
    ORMineCellTypeMineFavorite, // 我的收藏
    ORMineCellTypeFeedback,     // 意见反馈
    ORMineCellTypeShare,        // 应用分享
    ORMineCellTypeAboutMe,      // 关于我们
    ORMineCellTypeSetting,      // 系统设置
};

@interface ORMineCellItem : GNHBaseItem

@property (nonatomic, assign) ORMineCellType cellType; // 类型
@property (nonatomic, copy) NSString *iconName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *redirectUrl;
@property (nonatomic, assign) BOOL isBeginSeperator;  // 开始分隔
@property (nonatomic, assign) BOOL isEndSeperator;  // 结束分隔

@end

@interface ORMineTableViewCell : GNHBaseTableViewCell

@end

NS_ASSUME_NONNULL_END
