//
//  FilmFactortLoactionModel.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmFactortLoactionModel : NSObject
@property(nonatomic,copy) NSString * FilmThubImgView;
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * titleDesc;
@property(nonatomic,copy) NSString * DetailDesc;
@property(nonatomic,copy) NSString * tageOne;
@property(nonatomic,copy) NSString * tagTwo;
@property(nonatomic,assign) BOOL  isStart;
@property(nonatomic,assign) BOOL isCollted;
@property(nonatomic,assign) NSInteger colltecdNum;
@property(nonatomic,copy)  NSString * joinTime;
@property(nonatomic,copy) NSString * playTime;
@property(nonatomic,copy) NSString * loaction;
@property(nonatomic,copy) NSString * phone;
@property(nonatomic,copy) NSArray  * imgArrs;
@property(nonatomic,assign) NSInteger LoactionID;
@property(nonatomic,assign) BOOL isBaoming;
@end

NS_ASSUME_NONNULL_END
