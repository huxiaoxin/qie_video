//
//  FilmFactroysysTemViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFactroysysTemViewController.h"
#import "FilmFactroysystemTableViewCell.h"
#import "FilmFacotrysystemDetailViewController.h"
@interface FilmFactroysysTemViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactorySysTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactroyDataArr;
@property(nonatomic,assign) BOOL isLast;
@end

@implementation FilmFactroysysTemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"系统消息";
    self.isLast = NO;
    self.view.backgroundColor = LGDLightGaryColor;
    [self.view addSubview:self.FilmFactorySysTableView];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)FilmFactroyDataArr{
    if (!_FilmFactroyDataArr) {
        _FilmFactroyDataArr = [NSMutableArray array];
    }
    return _FilmFactroyDataArr;
}
-(void)FilmFactorySysTableViewClick{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.isLast = YES;
        [weakSelf.FilmFactorySysTableView reloadData];
        [weakSelf.FilmFactorySysTableView.mj_header endRefreshing];
    });
}
-(UITableView *)FilmFactorySysTableView{
    if (!_FilmFactorySysTableView) {
        _FilmFactorySysTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFactorySysTableView.delegate = self;
        _FilmFactorySysTableView.dataSource = self;
        _FilmFactorySysTableView.showsVerticalScrollIndicator = NO;
        _FilmFactorySysTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactorySysTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFactorySysTableView.backgroundColor = [UIColor clearColor];
        _FilmFactorySysTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactorySysTableViewClick)];
        [_FilmFactorySysTableView.mj_header beginRefreshing];
    }
    return _FilmFactorySysTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.isLast ? 1 : 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacotoryIdentifer = @"FilmFactroysystemTableViewCell";
    FilmFactroysystemTableViewCell * FilmCell = [tableView dequeueReusableCellWithIdentifier:FilmFacotoryIdentifer];
    if (FilmCell == nil) {
        FilmCell =[[FilmFactroysystemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacotoryIdentifer];
    }
    return FilmCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(170);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotrysystemDetailViewController * FilmDetailVc = [[FilmFacotrysystemDetailViewController alloc]init];
    FilmDetailVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmDetailVc animated:YES];
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
