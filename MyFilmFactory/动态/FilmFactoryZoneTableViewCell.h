//
//  FilmFactoryZoneTableViewCell.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import <UIKit/UIKit.h>
#import "FilmFactoryZoneModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FilmFactoryZoneTableViewCellDelegate <NSObject>

-(void)FilmFactoryZoneTableViewCellWithBtnClickIndex:(NSInteger)btnIndex CellConfigIndex:(NSIndexPath *)cellIndex;

@end
@interface FilmFactoryZoneTableViewCell : UITableViewCell
@property(nonatomic,strong) NSIndexPath * myIndexpath;
@property(nonatomic,strong)FilmFactoryZoneModel * filmModel;
@property(nonatomic,weak) id <FilmFactoryZoneTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
