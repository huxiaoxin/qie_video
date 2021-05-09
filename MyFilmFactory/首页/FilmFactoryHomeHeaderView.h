//
//  FilmFactoryHomeHeaderView.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FilmFactoryHomeHeaderViewDelegate <NSObject>

-(void)FilmFactoryHomeHeaderViewMToMoreVc;
-(void)FilmFactoryHomeHeaderViewDidSeltecdWithBanarIndex:(NSInteger)banarIndex;
-(void)FilmFactoryHomeHeaderViewBtnClickIndex:(NSInteger)btnIndex;
-(void)FilmFactoryHomeHeaderViewWithTopBanarIndex:(NSInteger)topBanarIndex;
-(void)FilmFactoryHomeHeaderViewToMovieDetail;
@end
@interface FilmFactoryHomeHeaderView : UIView
@property(nonatomic,assign) BOOL isSet;
@property(nonatomic,weak) id <FilmFactoryHomeHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
