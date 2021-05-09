//
//  FilmFactoryComentModel.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmFactoryComentModel : NSObject
@property(nonatomic,copy) NSString * imgurl;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * time;
@property(nonatomic,copy) NSString * content;
@property(nonatomic,assign) NSInteger ZoneID;
@property(nonatomic,assign) NSInteger ComentID;
@property(nonatomic,assign) CGFloat CellHeight;
@end

NS_ASSUME_NONNULL_END

