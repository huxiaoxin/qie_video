//
//  UIView+frame.h
//  cltios
//
//  Created by zjlk32 on 2021/3/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView(frame)

- (CGFloat)kleft;
- (void)setKleft:(CGFloat)x;
- (CGFloat)ktop;
- (void)setKtop:(CGFloat)y;
- (CGFloat)kright;
- (void)setKright:(CGFloat)right;
- (CGFloat)kbottom;
- (void)setKbottom:(CGFloat)bottom;
- (CGFloat)kcenterX;
- (void)setKcenterX:(CGFloat)centerX;
- (CGFloat)kcenterY;
- (void)setKcenterY:(CGFloat)centerY;
- (CGFloat)kwidth;
- (void)setKwidth:(CGFloat)width;
- (CGFloat)kheight;
- (void)setKheight:(CGFloat)height;
- (CGPoint)korigin;
- (void)setKorigin:(CGPoint)origin;
- (CGSize)ksize;
- (void)setKsize:(CGSize)size;


/**
 *  移除所有的subViews
 */
- (void)removeAllSubviews;

/**
 *  得到当前屏幕的截图
 *
 *  @return 当前屏幕截图的image
 */
- (UIImage *)screenshot;

@end

NS_ASSUME_NONNULL_END
