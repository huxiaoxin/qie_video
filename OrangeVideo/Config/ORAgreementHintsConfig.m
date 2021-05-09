//
//  ZYAgreementHintsConfig.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/8.
//

#import "ORAgreementHintsConfig.h"
#import "ZYAgreementHints.h"
#import "ORH5ViewController.h"
#import "GNHNavigationController.h"
#import "AppDelegate.h"
#import "ORMainAPI.h"

static NSString * const kAgreementHintsKey = @"agreementHints";

@interface ORAgreementHintsConfig ()
@property (nonatomic, weak) ZYAgreementHints *agreementHints;

@end
@implementation ORAgreementHintsConfig

+ (instancetype)shared {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (void)config {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    BOOL isHints = [userDefaults boolForKey:kAgreementHintsKey];
    if (!isHints) {
        ORAgreementHintsConfig *config = [self shared];
        [config.agreementHints disMiss];
        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        ZYAgreementHints *hints =
        [[ZYAgreementHints alloc] initWithHints:@"    熊猫追剧是广大影迷爱好者的短视频、影视聚合平台，在这里您可以短视频、影视。\n\n        我们严格遵守相关法律法规和隐私条款以保护您的个人信息，为提供基本服务，需要联网调用您的“相机相册、麦克风”权限，用于更换头像、声音输入。您也可以在系统中取消授权，或进入熊猫追剧内修改相关权限，但这可能影响到相关功能的正常使用。\n\n    请您阅读并同意《隐私政策》《用户服务协议》《免责声明》" links:@{@"normal://": @"《隐私政策》", @"risk://": @"《用户服务协议》", @"disclaimer://": @"《免责声明》"}];
        [hints showInView:app.tabBarViewController.view clickAction:^(NSString * _Nonnull link, ZYAgreementActionType type) {
            if ([link isEqualToString:@"normal"]) {
                UIViewController *vc = [[ORH5ViewController alloc] initWithURL:orangePrivacyProtocol.urlWithString];
                vc.edgesForExtendedLayout = UIRectEdgeNone;
                UINavigationController *navVC = [[GNHNavigationController alloc] initWithRootViewController:vc];
                navVC.modalPresentationStyle = UIModalPresentationFullScreen;
                [app.tabBarViewController presentViewController:navVC animated:YES completion:nil];
            } else if ([link isEqualToString:@"risk"]) {
                UIViewController *vc = [[ORH5ViewController alloc] initWithURL:orangeUserProtocol.urlWithString];
                vc.edgesForExtendedLayout = UIRectEdgeNone;
                UINavigationController *navVC = [[GNHNavigationController alloc] initWithRootViewController:vc];
                navVC.modalPresentationStyle = UIModalPresentationFullScreen;
                [app.tabBarViewController presentViewController:navVC animated:YES completion:nil];
            }  else if ([link isEqualToString:@"disclaimer"]) {
                UIViewController *vc = [[ORH5ViewController alloc] initWithURL:orangeDisclaimerProtocol.urlWithString];
                vc.edgesForExtendedLayout = UIRectEdgeNone;
                UINavigationController *navVC = [[GNHNavigationController alloc] initWithRootViewController:vc];
                navVC.modalPresentationStyle = UIModalPresentationFullScreen;
                [app.tabBarViewController presentViewController:navVC animated:YES completion:nil];
            }  else {
                [config.agreementHints disMiss];
                if (type == ZYAgreementActionTypeAgree) {
                    [userDefaults setBool:YES forKey:kAgreementHintsKey];
                    [userDefaults synchronize];
                }
            }
        }];
        config.agreementHints = hints;
    }
}

@end

