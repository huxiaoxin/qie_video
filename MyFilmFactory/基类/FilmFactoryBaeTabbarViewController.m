#import "FilmFactoryBaeTabbarViewController.h"

@interface FilmFactoryBaeTabbarViewController ()
@property(nonatomic,strong) NSMutableArray  * XiaoxinPaperClassArr;
@property(nonatomic,strong) NSMutableArray * XiaoxinPaperGlbalClassArr;
@end

@implementation FilmFactoryBaeTabbarViewController

-(NSMutableArray *)XiaoxinPaperClassArr{
    if (!_XiaoxinPaperClassArr) {
        _XiaoxinPaperClassArr = [NSMutableArray arrayWithArray:@[@"FilmFactoryHomeViewController",@"FilmFactoryZoneViewController",@"FilmFactoryMsgViewController",@"FilmFactoryLoactionViewController",@"FilmFactoryMineViewController"]];
    }
    return _XiaoxinPaperClassArr;
}
-(NSMutableArray *)XiaoxinPaperGlbalClassArr{
    if (!_XiaoxinPaperGlbalClassArr) {
        _XiaoxinPaperGlbalClassArr  = [NSMutableArray array];
    }
    return _XiaoxinPaperGlbalClassArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * XiaoxinPaper_nomalArr = @[@"M_shouyenomal",@"dongtainomal",@"xiaoxinomal",@"fangxiangnomal",@"wodenomal"];
    NSArray * XiaoxinPaper_selArr = @[@"M_shouyesel",@"dongtaisel",@"xiaoxisel",@"fangxiangsel",@"wodesel"];
    NSArray  * FilmFactoryTitleArr = @[@"首页",@"动态",@"消息",@"首映",@"我的"];
    for (int index = 0 ; index < self.XiaoxinPaperClassArr.count ; index ++) {
        UIViewController * Xiaoxinpaper_Vc = [(UIViewController *)[NSClassFromString(_XiaoxinPaperClassArr[index]) alloc]init];
        UIImage *Xiaoxinpaper_Nomal = [UIImage imageNamed:XiaoxinPaper_nomalArr[index]];
        UIImage *Xiaoxinpaper_Seltecd = [UIImage imageNamed:XiaoxinPaper_selArr[index]];
        Xiaoxinpaper_Vc.tabBarItem.image = [Xiaoxinpaper_Nomal imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        Xiaoxinpaper_Vc.tabBarItem.selectedImage = [Xiaoxinpaper_Seltecd imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        Xiaoxinpaper_Vc.tabBarItem.title =  FilmFactoryTitleArr[index];
        UINavigationController  *WindwoundNav = [UINavigationController rootVC:Xiaoxinpaper_Vc translationScale:NO];
        [self.XiaoxinPaperGlbalClassArr addObject:WindwoundNav];
    }
    GKNavigationBarConfigure *Xiaoxinpaper_Config = [GKNavigationBarConfigure sharedInstance];
    [Xiaoxinpaper_Config setupDefaultConfigure];
    Xiaoxinpaper_Config.backStyle = GKNavigationBarBackStyleBlack;
    Xiaoxinpaper_Config.backgroundColor = [UIColor whiteColor];
    Xiaoxinpaper_Config.titleColor = [UIColor blackColor];
    Xiaoxinpaper_Config.titleFont = [UIFont boldSystemFontOfSize:18];
    Xiaoxinpaper_Config.gk_navItemLeftSpace = K(15);
  
    self.viewControllers = _XiaoxinPaperGlbalClassArr;
    self.tabBar.barTintColor = [UIColor whiteColor];
    //这里的self是UITabBarController，代码根据各自的TabBar定义而定
    self.tabBar.tintColor = LGDMianColor;
    self.tabBar.translucent =NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end



