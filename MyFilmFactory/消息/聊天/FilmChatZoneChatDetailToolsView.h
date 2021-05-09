#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^sendToolBlock)(UITextView * textView);
@interface FilmChatZoneChatDetailToolsView : UIView
-(instancetype)initWithFrame:(CGRect)frame witheTextViewBlokc:(sendToolBlock)toolblokc;
@end

NS_ASSUME_NONNULL_END
