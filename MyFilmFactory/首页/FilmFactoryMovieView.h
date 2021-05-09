//
//  FilmFactoryMovieView.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FilmFactoryMovieViewDelegate <NSObject>

-(void)FilmFactoryMovieViewtap;

@end
@interface FilmFactoryMovieView : UIView
@property(nonatomic,weak) id <FilmFactoryMovieViewDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
