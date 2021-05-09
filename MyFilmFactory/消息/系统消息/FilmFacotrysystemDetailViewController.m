//
//  FilmFacotrysystemDetailViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFacotrysystemDetailViewController.h"

@interface FilmFacotrysystemDetailViewController ()

@end

@implementation FilmFacotrysystemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.gk_navTitle = @"详情";
    
    UILabel * FilmTopTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, NaviH+K(10), SCREEN_Width, K(18))];
    FilmTopTitle.textAlignment = NSTextAlignmentCenter;
    FilmTopTitle.font = [UIFont systemFontOfSize:K(15)];
    FilmTopTitle.text=  @"关于5月3号企鹅追剧维护公告";
    [self.view addSubview:FilmTopTitle];
    
    CGRect filmDetailRect = [@"尊敬的用户，您好～！\n因服务器升级需要，企鹅追剧将于2021年5月3号服务器停机进行升级，届时app将无法访问大概有半个小时左右，还请大家稍安伪造等待一下，感谢各位的配合与支持，谢谢～" cxl_sizeWithMoreString:[UIFont systemFontOfSize:14] maxWidth:SCREEN_Width-K(20)];
    UILabel * FilmDetailb =[[UILabel alloc]initWithFrame:CGRectMake(K(10), CGRectGetMaxY(FilmTopTitle.frame)+K(10), filmDetailRect.size.width, filmDetailRect.size.height)];
    FilmDetailb.numberOfLines = 0;
    FilmDetailb.font = [UIFont systemFontOfSize:14];
    FilmDetailb.textColor = LGDLightBLackColor;
    FilmDetailb.text = @"尊敬的用户，您好～！\n因服务器升级需要，企鹅追剧将于2021年5月3号服务器停机进行升级，届时app将无法访问大概有半个小时左右，还请大家稍安伪造等待一下，感谢各位的配合与支持，谢谢～";
    [self.view addSubview:FilmDetailb];
    
    UILabel *  FilmShulb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_Width-K(130), CGRectGetMaxY(FilmDetailb.frame)+K(10), K(120), K(14))];
    FilmShulb.textAlignment = NSTextAlignmentRight;
    FilmShulb.font = [UIFont systemFontOfSize:12];
    FilmShulb.textColor =LGDLightBLackColor;
    FilmShulb.text = @"企鹅追剧";
    [self.view addSubview:FilmShulb];
    
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
