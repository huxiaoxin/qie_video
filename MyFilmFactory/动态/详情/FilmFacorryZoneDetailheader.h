//
//  FilmFacorryZoneDetailheader.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "FilmFactoryZoneModel.h"
NS_ASSUME_NONNULL_BEGIN
@protocol FilmFacorryZoneDetailheaderDelegate <NSObject>

-(void)FilmFacorryZoneDetailheaderWithBtnIndex:(NSInteger)btnIndex;
@end
@interface FilmFacorryZoneDetailheader : UIView
@property(nonatomic,assign) CGFloat FilmViewHeight;
@property(nonatomic,weak) id <FilmFacorryZoneDetailheaderDelegate>delegate;
-(instancetype)initWithFrame:(CGRect)frame ConfigZoneModel:(FilmFactoryZoneModel *)zoneModel;
@end

NS_ASSUME_NONNULL_END
