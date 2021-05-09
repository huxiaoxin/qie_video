//
//  FilmFacotryLocationDetailHeader.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "FilmFactortLoactionModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FilmFacotryLocationDetailHeaderDelegate <NSObject>

-(void)FilmFacotryLocationDetailHeaderBtnClick:(UIButton *)myBtn;

@end
@interface FilmFacotryLocationDetailHeader : UIView
@property(nonatomic,assign) CGFloat FilmFacotryHeight;
@property(nonatomic,weak) id <FilmFacotryLocationDetailHeaderDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame ConfigWithModel:(FilmFactortLoactionModel *)filmModel;
@end

NS_ASSUME_NONNULL_END
