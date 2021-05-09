//
//  OREditUserInformTableViewCell.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/28.
//

#import "GNHBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface OREditUserInformCellItem : GNHBaseItem

@property (nonatomic, copy) NSString *nickName;

@end


@interface OREditUserInformTableViewCell : GNHBaseTableViewCell
- (NSString *)text;

@end

NS_ASSUME_NONNULL_END
