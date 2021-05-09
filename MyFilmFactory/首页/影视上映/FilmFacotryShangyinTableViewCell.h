//
//  FilmFacotryShangyinTableViewCell.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import <UIKit/UIKit.h>
#import "FilmFacotryHomeModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FilmFacotryShangyinTableViewCellDelegate <NSObject>

-(void)FilmFacotryShangyinTableViewCellWithbtnClick:(NSInteger)cellTag;

@end
@interface FilmFacotryShangyinTableViewCell : UITableViewCell
@property(nonatomic,strong) FilmFacotryHomeModel   * filmHomeModel;
@property(nonatomic,weak) id <FilmFacotryShangyinTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
