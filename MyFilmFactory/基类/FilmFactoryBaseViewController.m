//
//  FilmFactoryBaseViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryBaseViewController.h"
#import "FilmFactoryLoginViewController.h"
@interface FilmFactoryBaseViewController ()

@end

@implementation FilmFactoryBaseViewController
-(void)FilmFactoryBaseShowLoginVc{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FilmFactoryLoginViewController * FilmLoginVc = [[FilmFactoryLoginViewController alloc]init];
        UINavigationController * filmNav = [UINavigationController rootVC:FilmLoginVc translationScale:YES];
        [self presentViewController:filmNav animated:YES completion:nil];
    });
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navLineHidden = YES;
    self.view.backgroundColor = LGDLightGaryColor;
    
    // Do any additional setup after loading the view.
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
