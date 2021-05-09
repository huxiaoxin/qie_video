//
//  FilmFactoryZoneModel.h
//  FilmFactory
//
//  Created by codehzx on 2021/4/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface FilmFactoryZoneModel : NSObject
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * times;
@property(nonatomic,copy) NSString * userImgIcon;
@property(nonatomic,copy) NSArray * imgThuburls;
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * detail;
@property(nonatomic,assign) NSInteger ZoneDetrailID;
@property(nonatomic,copy) NSString * SectionTime;
@property(nonatomic,assign) NSInteger SectionID;
@end

NS_ASSUME_NONNULL_END
