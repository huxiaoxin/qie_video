#import "ShuyunHomeNewsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShuyunHomeNewsModel : NSObject
@property(nonatomic,copy) NSString * imgUrl;
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * content;
@property(nonatomic,assign) NSInteger viewsNum;
@property(nonatomic,assign) NSInteger news_ID;
@property(nonatomic,copy) NSString * time;
@end

NS_ASSUME_NONNULL_END
