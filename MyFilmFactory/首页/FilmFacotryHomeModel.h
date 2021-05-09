//
//  FilmFacotryHomeModel.h
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/27.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmFacotryHomeModel : NSObject
@property(nonatomic,copy) NSString * imgTubUrl;
@property(nonatomic,copy) NSString * famous;
@property(nonatomic,copy)  NSString * englishNae;
@property(nonatomic,copy)  NSString * filmtype;
@property(nonatomic,copy) NSString * articlList;
@property(nonatomic,assign) CGFloat filmStar_five;
@property(nonatomic,assign) CGFloat filmStar_foure;
@property(nonatomic,assign) CGFloat filmStar_three;
@property(nonatomic,assign) CGFloat filmStar_two;
@property(nonatomic,assign) CGFloat filmStar_one;
@property(nonatomic,assign) BOOL isColletcd;
@property(nonatomic,copy) NSArray  *  ListArr;
@property(nonatomic,copy) NSString * intrduce;
@property(nonatomic,assign) NSInteger CoinNum;
@property(nonatomic,assign) CGFloat DoubanNum;
@property(nonatomic,assign) NSInteger FilmID;
@property(nonatomic,copy) NSString * tagOne;
@property(nonatomic,copy) NSString * tagTwo;
@property(nonatomic,copy) NSString * time;
@property(nonatomic,assign) NSInteger Top_filmType;
@property(nonatomic,assign) NSInteger total_Num;
@end

NS_ASSUME_NONNULL_END
