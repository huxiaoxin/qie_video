//
//  ORLaunchAdvertManager.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/27.
//

#import "ORLaunchAdvertManager.h"
#import <BUAdSDK/BUAdSDK.h>

@interface ORLaunchAdvertManager () <BUSplashAdDelegate>
@property (nonatomic, strong) BUSplashAdView *splashView; // 穿山甲开屏广告

@end

@implementation ORLaunchAdvertManager

#pragma mark - Init

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] mdf_safeAddObserver:self selector:@selector(appDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] mdf_safeAddObserver:self selector:@selector(appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
        
        [self setupData];
    }
    return self;
}

#pragma mark - setupData

- (void)setupData
{
    // 展示穿山甲广告
    BUSplashAdView *splashView = [[BUSplashAdView alloc] initWithSlotID:BUAdSDKManagerSortId frame:CGRectMake(0, 0, kScreenWidth, kScreenHeight * (4/5.0))];
    splashView.delegate = self;
    splashView.tolerateTimeout = 5.0f;
    self.splashView = splashView;
    
    UIWindow *keyWindow = [UIApplication sharedApplication].windows.firstObject;
    [splashView loadAdData];
    [keyWindow.rootViewController.view addSubview:splashView];
    splashView.rootViewController = keyWindow.rootViewController;
}

#pragma mark - notification

- (void)appDidEnterBackground:(NSNotification *)notification
{
    
}

- (void)appWillEnterForeground:(NSNotification *)notification
{
    // 后台切换到前台调自动登录
    [self setupData];
}


#pragma mark - 穿山甲SDK  BUSplashAdDelegate

/**
This method is called when splash ad material loaded successfully.
*/
- (void)splashAdDidLoad:(BUSplashAdView *)splashAd
{
    // 广告加载成功
}

/**
This method is called when splash ad material failed to load.
@param error : the reason of error
*/
- (void)splashAd:(BUSplashAdView *)splashAd didFailWithError:(NSError *)error
{
    // 加载失败
    [self.splashView removeFromSuperview];
}

/**
 This method is called when splash ad slot will be showing.
 */
- (void)splashAdWillVisible:(BUSplashAdView *)splashAd
{
    // 广告将展示
}

/**
 This method is called when splash ad is clicked.
 */
- (void)splashAdDidClick:(BUSplashAdView *)splashAd
{
    // 点击广告
}

/**
 This method is called when splash ad is closed.
 */
- (void)splashAdDidClose:(BUSplashAdView *)splashAd
{
    // 关闭广告
    [self.splashView removeFromSuperview];
}


/**
 This method is called when splash ad is about to close.
 */
- (void)splashAdWillClose:(BUSplashAdView *)splashAd
{
    // 广告将关闭
}

/**
 This method is called when another controller has been closed.
 @param interactionType : open appstore in app or open the webpage or view video ad details page.
 */
- (void)splashAdDidCloseOtherController:(BUSplashAdView *)splashAd interactionType:(BUInteractionType)interactionType
{
    
}

/**
 This method is called when spalashAd skip button  is clicked.
 */
- (void)splashAdDidClickSkip:(BUSplashAdView *)splashAd
{
    // 点击跳过
    [self.splashView removeFromSuperview];
}

/**
 This method is called when spalashAd countdown equals to zero
 */
- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd
{
    // 时间到了
    [self.splashView removeFromSuperview];
}


#pragma mark - Handle Data


#pragma mark - Properties


@end
