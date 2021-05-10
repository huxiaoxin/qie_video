//
//  ORLaunchAdvertManager.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/3/27.
//

#import "ORLaunchAdvertManager.h"
#import <BUAdSDK/BUAdSDK.h>

@interface ORLaunchAdvertManager () <BUSplashAdDelegate>
@property (nonatomic, strong)  BUSplashAdView * splashView; // 穿山甲开屏广告
@property(nonatomic,strong)    UIView         * splashBackView;
@property(nonatomic,strong)    UIImageView    * LogoImgView;
@property(nonatomic,strong)    UILabel        * Infolb;
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
- (UIView *)splashBackView{
    if (!_splashBackView) {
        _splashBackView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _splashBackView.backgroundColor = [UIColor whiteColor];
    }
    return _splashBackView;
}
- (UILabel *)Infolb{
    if (!_Infolb) {
        _Infolb = [[UILabel alloc]init];
        _Infolb.text = @"企鹅追剧";
        _Infolb.font = zy_fontSize30;
        _Infolb.textColor = LGDBLackColor;
    }
    return _Infolb;
}
- (UIImageView *)LogoImgView{
    if (!_LogoImgView) {
        _LogoImgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _LogoImgView.image = [UIImage imageNamed:@"logo"];
    }
    return _LogoImgView;
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
//    [keyWindow.rootViewController.view addSubview:splashView];
    [keyWindow.rootViewController.view addSubview:self.splashBackView];
    [_splashBackView addSubview:splashView];
    [_splashBackView addSubview:self.LogoImgView];
    [_splashBackView addSubview:self.Infolb];
    splashView.rootViewController = keyWindow.rootViewController;
    [_LogoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_splashBackView);
        make.top.mas_equalTo(splashView.mas_bottom).offset(RealWidth(20));
        make.size.mas_equalTo(CGSizeMake(RealWidth(50), RealWidth(50)));
    }];
  
    [_Infolb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(_splashBackView);
        make.top.mas_equalTo(_LogoImgView.mas_bottom).offset(RealWidth(5));
        make.height.mas_equalTo(RealWidth(30));
    }];
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
    [self.splashBackView removeFromSuperview];
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
    [self.splashBackView removeFromSuperview];

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
    [self.splashBackView removeFromSuperview];

}

/**
 This method is called when spalashAd countdown equals to zero
 */
- (void)splashAdCountdownToZero:(BUSplashAdView *)splashAd
{
    // 时间到了
    [self.splashView removeFromSuperview];
    [self.splashBackView removeFromSuperview];

}


#pragma mark - Handle Data


#pragma mark - Properties


@end
