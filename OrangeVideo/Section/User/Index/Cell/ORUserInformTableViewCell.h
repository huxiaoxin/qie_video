//
//  ORUserInformTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "GNHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ORUserInformCellType) {
    ORUserInformCellTypePortrail = 0, // 头像
    ORUserInformCellTypeNickName,     // 昵称
};

@interface ORUserInformCellItem : GNHBaseItem

@property (nonatomic, assign) ORUserInformCellType cellType;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *anchorUrl; // 图片url
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end

@interface ORUserInformTableViewCell : GNHBaseTableViewCell

@end

NS_ASSUME_NONNULL_END
