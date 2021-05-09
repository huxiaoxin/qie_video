//
//  FilmFactoryShangyinModel.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmFactoryShangyinModel : NSObject
@property(nonatomic,copy) NSString   * imgurl;
@property(nonatomic,copy) NSString   * name;
@property(nonatomic,copy) NSString   * time;
@property(nonatomic,assign) NSInteger FilmID;
@property(nonatomic,assign) NSInteger ComentID;
@property(nonatomic,assign) CGFloat CellHeight;
@property(nonatomic,copy) NSString * content;
@end

NS_ASSUME_NONNULL_END
