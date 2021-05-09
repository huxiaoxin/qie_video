//
//  FilmFacroryLoacitonDetailTableViewCell.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmFacroryLoacitonDetailTableViewCell : UITableViewCell
@property(nonatomic,copy) NSString * FilmStr;
-(void)FilmFacroryLoacitonDetailTableViewCellConfig:(NSMutableArray *)leftArr FilmoIndex:(NSIndexPath *)index;
@end

NS_ASSUME_NONNULL_END
