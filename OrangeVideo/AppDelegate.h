//
//  AppDelegate.h
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/7.
//

#import <UIKit/UIKit.h>
#import "ORTabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, weak, readonly) ORTabBarController *tabBarViewController; /**< RootViewController */

// 返回AppDelegate
+ (AppDelegate *)shareDelegate;

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) BOOL isShouldOrientationMaskAll;

@end

