//
//  UIButton+CHRegex.h
// codehzx@163.com
//  Created by apple on 2018/4/13.
//  Copyright © 2018年 gch. All rights reserved.
//

#import <UIKit/UIKit.h>
#define defaultInterval .1// 默认间隔时间
@interface UIButton (CHRegex)
/**
 *  设置点击时间间隔
 */
@property (nonatomic, assign) NSTimeInterval timeInterVal;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
