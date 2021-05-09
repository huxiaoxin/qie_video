//
//  FilmFactoryMsgHeaderView.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FilmFactoryMsgHeaderViewDelegate <NSObject>

-(void)FilmFactoryMsgHeaderViewBtnClickWithbtnIndex:(NSInteger)btnIndex;

@end
@interface FilmFactoryMsgHeaderView : UIView
@property(nonatomic,weak) id <FilmFactoryMsgHeaderViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
