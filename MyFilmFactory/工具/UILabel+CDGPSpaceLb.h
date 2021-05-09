#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^lbTapAction)(id object);
@interface UILabel (CDGPSpaceLb)
-(void)AddlbTapActionWith:(lbTapAction)item;
//设置一行文字相邻间距
- (void)setText:(NSString *)text spacing:(CGFloat)spacing;
//设置行与行之间的距离
- (void)setText:(NSString *)text lineSpacing:(CGFloat)lineSpacing;
-(CGSize)getSpaceLabelSize:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpacing:(CGFloat)lineSpacing;
@end
NS_ASSUME_NONNULL_END
