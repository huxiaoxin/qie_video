//
//  FilmFactoryAboutusViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFactoryAboutusViewController.h"
#import <WebKit/WebKit.h>

@interface FilmFactoryAboutusViewController ()

@end

@implementation FilmFactoryAboutusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"关于我们";
    WKWebViewConfiguration * FilmFacouCofig  = [[WKWebViewConfiguration alloc]init];
    WKWebView * FilmFacouWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) configuration:FilmFacouCofig];
    FilmFacouWeb.scrollView.showsVerticalScrollIndicator =  NO;
    [self.view addSubview:FilmFacouWeb];
    NSString * FilmFacoStr  = [[NSBundle mainBundle] pathForResource:@"FilmFactory" ofType:@"html"];
    [FilmFacouWeb loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:FilmFacoStr]]];}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
