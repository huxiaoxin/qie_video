//
//  FilmFactoryHomeViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/20.
//

#import "FilmFactoryHomeViewController.h"
#import "FilmFacroyHomeTableViewCell.h"
#import "FilmFactoryHomeHeaderView.h"
#import "FilmFactorHomeMoreViewController.h"
#import "FilmFacroryHomeDetailViewController.h"
#import <AVKit/AVKit.h>
#import "FilmFactoryNewsViewController.h"
#import "FilmFactortLoactionModel.h"
#import "FilmFacorrLoactoinDetailViewController.h"
#import "FilmFacotryShangyinViewController.h"
#import "FilmFacotryHomeModel.h"
#import "FilmFacotryShangyingDetailViewController.h"
#import "FilmFactoryMsgViewController.h"
@interface FilmFactoryHomeViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFactoryHomeHeaderViewDelegate>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@property(nonatomic,strong) FilmFactoryHomeHeaderView * FilmHeader;
@property(nonatomic,strong) NSMutableArray * FilmFactoryDataArr;
@end

@implementation FilmFactoryHomeViewController

-(NSMutableArray *)FilmFactoryDataArr{
    if (!_FilmFactoryDataArr) {
        _FilmFactoryDataArr = [NSMutableArray array];
    }
    return _FilmFactoryDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"企鹅追剧";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmFactoryTableView];
    _FilmFactoryTableView.tableHeaderView =  self.FilmHeader;

    UIImage * img = [UIImage imageNamed:@"messagehome"];
    UIView * rightView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, img.size.width+RealWidth(20), img.size.height)];
    UIButton *searchBtn = [UIButton ly_ButtonWithNormalImageName:@"messagehome" selecteImageName:@"messagehome" target:self selector:@selector(FilmItemAdvicCommitbtnClick)];
    searchBtn.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [rightView addSubview:searchBtn];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightItem;

    // Do any additional setup after loading the view.
}
-(void)FilmItemAdvicCommitbtnClick{
    
    if ([ORAccountComponent checkLogin:YES]){
        FilmFactoryMsgViewController * filmVc = [[FilmFactoryMsgViewController alloc]init];
        [self.navigationController pushViewController:filmVc animated:YES];
    }
}
- (FilmFactoryHomeHeaderView *)FilmHeader{
    if (!_FilmHeader) {
        _FilmHeader = [[FilmFactoryHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(480))];
        _FilmHeader.delegate = self;
    }
    return _FilmHeader;
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _FilmFactoryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource =  self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.backgroundColor = [UIColor clearColor];
        _FilmFactoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactoryHeaderClicks)];
        [_FilmFactoryTableView.mj_header beginRefreshing];
    }
    return _FilmFactoryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmFactoryDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacoryIdentifer = @"FilmFacroyHomeTableViewCell";
    FilmFacroyHomeTableViewCell * FilmFacoryCell = [tableView dequeueReusableCellWithIdentifier:FilmFacoryIdentifer];
    if (FilmFacoryCell == nil) {
        FilmFacoryCell = [[FilmFacroyHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacoryIdentifer];
    }
    FilmFacoryCell.filmHomeMode = self.FilmFactoryDataArr[indexPath.row];
    return FilmFacoryCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(120);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotryShangyingDetailViewController * FilmDetailVc = [[FilmFacotryShangyingDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    FilmDetailVc.filmHomeMode = self.FilmFactoryDataArr[indexPath.row];
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
}

#pragma mark--FilmFactoryHomeHeaderViewDelegate
-(void)FilmFactoryHomeHeaderViewMToMoreVc{
    FilmFactorHomeMoreViewController  * filmmoreVc = [[FilmFactorHomeMoreViewController alloc]init];
    filmmoreVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:filmmoreVc animated:YES];
}
-(void)FilmFactoryHomeHeaderViewDidSeltecdWithBanarIndex:(NSInteger)banarIndex{
    NSString * viewourl;
    if (banarIndex == 0) {
        viewourl = @"https://vd4.bdstatic.com/mda-jeqhnpcwca3hb59p/sc/mda-jeqhnpcwca3hb59p.mp4?v_from_s=sz_haokan_4469&auth_key=1619363477-0-0-3ec8784175db4b1886228c4a8d174414&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=";
    }else if (banarIndex == 1){
        viewourl = @"https://vd2.bdstatic.com/mda-kcgw057saib93hp5/v1-cae/sc/mda-kcgw057saib93hp5.mp4?v_from_s=sz_haokan_4469&auth_key=1619363586-0-0-ddd40dba1dabc1e844e33b1a8aeadf68&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=";

    }else{
        viewourl = @"https://vd3.bdstatic.com/mda-mc9imcv9nv9gh7dv/sc/cae_h264_clips/1615354802/mda-mc9imcv9nv9gh7dv.mp4?auth_key=1619363698-0-0-5fc8819b82f4b091e4392268e597bf61&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=";

    }
    NSURL *url = [NSURL URLWithString:viewourl];
    AVPlayerViewController *ctrl = [[AVPlayerViewController alloc] init];
    ctrl.player= [[AVPlayer alloc]initWithURL:url];
    [self presentViewController:ctrl animated:YES completion:nil];
}
-(void)FilmFactoryHomeHeaderViewWithTopBanarIndex:(NSInteger)topBanarIndex{
    if (topBanarIndex == 2) {
        NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactortLoactionModel class]];
        FilmFacorrLoactoinDetailViewController  * locationDetaioVc  = [[FilmFacorrLoactoinDetailViewController alloc]init];
        locationDetaioVc.hidesBottomBarWhenPushed = YES;
        locationDetaioVc.filmLoactionModel = dataArr.firstObject;
        [self.navigationController pushViewController:locationDetaioVc animated:YES];
    }else if (topBanarIndex == 0){
        NSArray * dataArr =  [WHC_ModelSqlite query:[FilmFacotryHomeModel class] where:[NSString stringWithFormat:@"FilmID ='%d'",0]];
          FilmFacotryShangyingDetailViewController * FilmDetailVc = [[FilmFacotryShangyingDetailViewController alloc]init];
          FilmDetailVc.hidesBottomBarWhenPushed = YES;
          FilmDetailVc.filmHomeMode = dataArr.firstObject;
          [self.navigationController pushViewController:FilmDetailVc animated:YES];

    }
}
-(void)FilmFactoryHomeHeaderViewBtnClickIndex:(NSInteger)btnIndex{
    if (btnIndex == 0) {
        FilmFacotryShangyinViewController * FactoryVc = [[FilmFacotryShangyinViewController alloc]init];
        FactoryVc.FilmIndex = btnIndex;
        FactoryVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FactoryVc animated:YES];
    }else if (btnIndex == 1){
        FilmFacotryShangyinViewController * FactoryVc = [[FilmFacotryShangyinViewController alloc]init];
        FactoryVc.FilmIndex = btnIndex;
        FactoryVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FactoryVc animated:YES];
    }else if (btnIndex == 2){
        FilmFacotryShangyinViewController * FactoryVc = [[FilmFacotryShangyinViewController alloc]init];
        FactoryVc.FilmIndex = btnIndex;
        FactoryVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FactoryVc animated:YES];
    }else if (btnIndex == 3){
        FilmFactoryNewsViewController * FilmFacctoryVc = [[FilmFactoryNewsViewController alloc]init];
        FilmFacctoryVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:FilmFacctoryVc animated:YES];
    }
}
-(void)FilmFactoryHomeHeaderViewToMovieDetail{
  NSArray * dataArr =  [WHC_ModelSqlite query:[FilmFacotryHomeModel class] where:[NSString stringWithFormat:@"FilmID ='%d'",0]];
    FilmFacotryShangyingDetailViewController * FilmDetailVc = [[FilmFacotryShangyingDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    FilmDetailVc.filmHomeMode = dataArr.firstObject;
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
}
-(void)FilmFactoryHeaderClicks{
    [LCProgressHUD showLoading:@""];
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFacotryHomeModel class]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD hide];
        if (weakSelf.FilmFactoryDataArr.count > 0) {
            [weakSelf.FilmFactoryDataArr removeAllObjects];
        }
        
        weakSelf.FilmFactoryDataArr = [dataArr subarrayWithRange:NSMakeRange(5, 10)].mutableCopy;
        weakSelf.FilmHeader.isSet = YES;
        [weakSelf.FilmFactoryTableView reloadData];
        [self->_FilmFactoryTableView.mj_header endRefreshing];
    });
    
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
