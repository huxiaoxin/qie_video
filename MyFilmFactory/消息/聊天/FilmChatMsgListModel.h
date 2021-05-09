

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FilmChatMsgListModel : NSObject
@property(nonatomic,copy) NSString * imgurl;
@property(nonatomic,copy) NSString * topname;
@property(nonatomic,copy) NSString * content;
@property(nonatomic,copy) NSString * time;
@property(nonatomic,assign) NSInteger ChatID;
@property(nonatomic,assign) BOOL isShowRed;
@property(nonatomic,assign) NSInteger redNum;
@end

NS_ASSUME_NONNULL_END
