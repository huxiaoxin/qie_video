//
//  ORViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORTabBarController.h"
#import "ORTabBar.h"
#import "GNHNavigationController.h"
#import "ORUMConfig.h"
#import "ORDiscoveryViewController.h"
#import "ORMineViewController.h"
#import "ORLoginViewController.h"
#import "FilmFactoryHomeViewController.h"
#import "FilmFactoryZoneViewController.h"
#import "FilmFactoryMsgViewController.h"
NSString *const kORDoubleClickTabItemNotification = @"ZYDoubleClickTabItemNotification";

@interface ORTabBarController () <UITabBarControllerDelegate, UINavigationControllerDelegate>
@end

@implementation ORTabBarController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.delegate = self;
    
    // 设置通知
    [self setupNotifications];
    
    //自定义TabBar
    [self setValue:[[ORTabBar alloc] init] forKey:@"tabBar"];
    self.tabBar.tintColor = gnh_color_a;
    self.tabBar.translucent = NO;
    // 设置ChildViewController
    [self refreshTabBarViewController];
}

#pragma mark - Notification

- (void)setupNotifications
{
    [[NSNotificationCenter defaultCenter] mdf_safeAddObserver:self selector:@selector(appDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] mdf_safeAddObserver:self selector:@selector(appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] mdf_safeAddObserver:self selector:@selector(forceLogin:) name:ORAccountForceToLoginNotification object:nil];
}

- (void)appDidEnterBackground:(NSNotification *)notification
{

}

- (void)appWillEnterForeground:(NSNotification *)notification
{
    // 后台切换到前台调自动登录
}

- (void)forceLogin:(NSNotification *)notification
{
    if (![[UIViewController mdf_toppestViewController] isKindOfClass:[ORLoginViewController class]]) {
        UIViewController *loginVC = [[ORLoginViewController alloc] init];
        UINavigationController *navVC = [[GNHNavigationController alloc] initWithRootViewController:loginVC];
        navVC.delegate = self;
        navVC.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navVC animated:YES completion:nil];
    }
}

#pragma mark - SetupUIs

- (void)refreshTabBarViewController
{
    NSMutableArray *navArray = [NSMutableArray array];

    // 首页
    FilmFactoryHomeViewController *indexVC = [[FilmFactoryHomeViewController alloc] init];
    UINavigationController *indexNVC = [self produceRootNavigationControllerWithVC:indexVC title:@"首页" normalAttributes:@{NSForegroundColorAttributeName:gnh_color_f} selectAttributes:@{NSForegroundColorAttributeName:gnh_color_theme} normalImage:[UIImage imageNamed:@"M_shouyenomal"] selectImage:[UIImage imageNamed:@"M_shouyesel"]];
    [navArray mdf_safeAddObject:indexNVC];
    
    
    FilmFactoryZoneViewController *interestVC = [[FilmFactoryZoneViewController alloc] init];
    UINavigationController *interestNVC = [self produceRootNavigationControllerWithVC:interestVC title:@"动态" normalAttributes:@{NSForegroundColorAttributeName:gnh_color_f} selectAttributes:@{NSForegroundColorAttributeName:gnh_color_theme} normalImage:[UIImage imageNamed:@"dongtainomal"] selectImage:[UIImage imageNamed:@"dongtaisel"]];
    [navArray mdf_safeAddObject:interestNVC];
    
    
    FilmFactoryMsgViewController *MsgVC = [[FilmFactoryMsgViewController alloc] init];
    UINavigationController *MsgtNVC = [self produceRootNavigationControllerWithVC:MsgVC title:@"消息" normalAttributes:@{NSForegroundColorAttributeName:gnh_color_f} selectAttributes:@{NSForegroundColorAttributeName:gnh_color_theme} normalImage:[UIImage imageNamed:@"xiaoxinomal"] selectImage:[UIImage imageNamed:@"xiaoxisel"]];
    [navArray mdf_safeAddObject:MsgtNVC];

    
    // 发现
    ORDiscoveryViewController *matchVC = [[ORDiscoveryViewController alloc] init];
    UINavigationController *matchNVC = [self produceRootNavigationControllerWithVC:matchVC title:@"发现" normalAttributes:@{NSForegroundColorAttributeName:gnh_color_f} selectAttributes:@{NSForegroundColorAttributeName:gnh_color_theme} normalImage:[UIImage imageNamed:@"fangxiangnomal"] selectImage:[UIImage imageNamed:@"fangxiangsel"]];
    [navArray mdf_safeAddObject:matchNVC];
    
    // 我的
    ORMineViewController *listVC = [[ORMineViewController alloc] init];
    listVC.view.backgroundColor = UIColor.clearColor;
    UINavigationController *listNVC = [self produceRootNavigationControllerWithVC:listVC title:@"我的" normalAttributes:@{NSForegroundColorAttributeName:gnh_color_f} selectAttributes:@{NSForegroundColorAttributeName:gnh_color_theme} normalImage:[UIImage imageNamed:@"wodenomal"] selectImage:[UIImage imageNamed:@"wodesel"]];
    [navArray mdf_safeAddObject:listNVC];

    [self setViewControllers:navArray animated:NO];
    if (navArray.count >= 6) {
        self.moreNavigationController.view.backgroundColor = gnh_color_b;
    }
}

- (UINavigationController *)produceRootNavigationControllerWithVC:(UIViewController *)vc title:title normalAttributes:nAttributes selectAttributes:sAttributes normalImage:nImage selectImage:sImage
{
    UIImage *normalImage = [nImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [sImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    if (@available(iOS 13.0, *)) {
        // iOS 13以上
        self.tabBar.tintColor = LGDMianColor;
        self.tabBar.unselectedItemTintColor = gnh_color_f;
    } else {
        // iOS 13以下
        [item setTitleTextAttributes:nAttributes forState:UIControlStateNormal];
        [item setTitleTextAttributes:sAttributes forState:UIControlStateSelected];
    }
    vc.tabBarItem = item;
    
    UINavigationController *navVC = [[GNHNavigationController alloc]initWithRootViewController:vc];
    navVC.delegate = self;
    navVC.view.backgroundColor = gnh_color_b;
    
    return navVC;
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([self checkIsDoubleClick:viewController]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:kORDoubleClickTabItemNotification object:nil];
    }
    return YES;
}

- (BOOL)checkIsDoubleClick:(UIViewController *)viewController
{
    static UIViewController *lastViewController = nil;
    static NSTimeInterval lastClickTime = 0;
    
    if (lastViewController != viewController) {
        lastViewController = viewController;
        lastClickTime = [NSDate timeIntervalSinceReferenceDate];
        return NO;
    }
    
    NSTimeInterval clickTime = [NSDate timeIntervalSinceReferenceDate];
    if (clickTime - lastClickTime > 0.5) {
        lastClickTime = clickTime;
        return NO;
    }
    lastClickTime = clickTime;
    
    return YES;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isHiddenNavBar = ([NSStringFromClass(viewController.class) isEqualToString:@"ORIndexViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORMineViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORLoginViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORHotViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORCategoryViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORHotDetailViewController"] ||
                           [NSStringFromClass(viewController.class) isEqualToString:@"ORVideoPlayerViewController"]);
    [navigationController setNavigationBarHidden:isHiddenNavBar animated:YES];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    #ifdef DEBUG
        if (event.subtype == UIEventSubtypeMotionShake && DEBUG) {
            [ORUMConfig sharedInstance].um_deubg = ![ORUMConfig sharedInstance].um_deubg;
        }
    #else
        if (event.subtype == UIEventSubtypeMotionShake) {
            [ORUMConfig sharedInstance].um_deubg = ![ORUMConfig sharedInstance].um_deubg;
        }
    #endif
}

@end
