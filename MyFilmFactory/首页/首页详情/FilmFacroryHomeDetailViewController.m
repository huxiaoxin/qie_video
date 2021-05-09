//
//  FilmFacroryHomeDetailViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFacroryHomeDetailViewController.h"
#import "FilmFacoryHomeDetailHeader.h"
@interface FilmFacroryHomeDetailViewController ()
@property(nonatomic,strong) FilmFacoryHomeDetailHeader * FilmDetailMovieView;
@end

@implementation FilmFacroryHomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navBarAlpha = 0;
    [self.view addSubview:self.FilmDetailMovieView];
    // Do any additional setup after loading the view.
}
- (FilmFacoryHomeDetailHeader *)FilmDetailMovieView{
    if (!_FilmDetailMovieView) {
        _FilmDetailMovieView =[[FilmFacoryHomeDetailHeader alloc]initWithFrame:CGRectMake(0, GK_SAFEAREA_TOP, SCREEN_Width, K(180))];
    }
    return _FilmDetailMovieView;
}
-(void)viewWillDisappear:(BOOL)animated{
    [[GKNavigationBarConfigure sharedInstance] updateConfigure:^(GKNavigationBarConfigure *configure) {
        configure.backStyle = GKNavigationBarBackStyleBlack;
        
    }];
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
