//
//  FilmFactoryZanViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFactoryZanViewController.h"

@interface FilmFactoryZanViewController ()
@property(nonatomic,strong) UITableView * FilmFacoryTableView;
@end

@implementation FilmFactoryZanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title =  @"点赞消息";
    [self.view addSubview:self.FilmFacoryTableView];
    // Do any additional setup after loading the view.
}
- (UITableView *)FilmFacoryTableView{
    if (!_FilmFacoryTableView) {
        _FilmFacoryTableView  =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFacoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFacoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacoryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFacoryTableView.backgroundColor = [UIColor clearColor];
        _FilmFacoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFacoryTableViewClick)];
        [_FilmFacoryTableView.mj_header beginRefreshing];
    }
    return _FilmFacoryTableView;
}
-(void)FilmFacoryTableViewClick{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showInfoMsg:@"暂无数据"];
        LYEmptyView * emtyView = [LYEmptyView emptyViewWithImage:nil titleStr:@"暂无数据" detailStr:nil];
        weakSelf.FilmFacoryTableView.ly_emptyView = emtyView;
        [weakSelf.FilmFacoryTableView.mj_header endRefreshing];
        [weakSelf.FilmFacoryTableView reloadData];
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
