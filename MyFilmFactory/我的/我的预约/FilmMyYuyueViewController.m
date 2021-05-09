//
//  FilmMyYuyueViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/27.
//

#import "FilmMyYuyueViewController.h"
#import "FilmFactorLoacitonTypeTableViewCell.h"
#import "FilmFacorrLoactoinDetailViewController.h"
@interface FilmMyYuyueViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactoryDataArr;
@end

@implementation FilmMyYuyueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的预约";
    [self.view addSubview:self.FilmFactoryTableView];
    // Do any additional setup after loading the view.
}
- (NSMutableArray *)FilmFactoryDataArr{
    if (!_FilmFactoryDataArr) {
        _FilmFactoryDataArr = [NSMutableArray array];
    }
    return _FilmFactoryDataArr;
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource = self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFactoryTableView.backgroundColor = [UIColor whiteColor];
        _FilmFactoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactoryTableViewClick)];
        [_FilmFactoryTableView.mj_header  beginRefreshing];
    }
    return _FilmFactoryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmFactoryDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  * FilmFactoryIdetifer =  @"FilmFactorLoacitonTypeTableViewCell";
    FilmFactorLoacitonTypeTableViewCell * FilmFactoriCell = [tableView dequeueReusableCellWithIdentifier:FilmFactoryIdetifer];
    if (FilmFactoriCell == nil) {
        FilmFactoriCell = [[FilmFactorLoacitonTypeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFactoryIdetifer];
    }
    FilmFactoriCell.loactionModel = self.FilmFactoryDataArr[indexPath.row];
    return FilmFactoriCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacorrLoactoinDetailViewController  * locationDetaioVc  = [[FilmFacorrLoactoinDetailViewController alloc]init];
    locationDetaioVc.hidesBottomBarWhenPushed = YES;
    locationDetaioVc.filmLoactionModel = self.FilmFactoryDataArr[indexPath.row];
    [self.navigationController pushViewController:locationDetaioVc animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(180);
}
-(void)FilmFactoryTableViewClick{
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactortLoactionModel class] where:[NSString stringWithFormat:@"isBaoming ='%@'",[NSNumber numberWithBool:YES]]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmFactoryDataArr.count > 0) {
            [weakSelf.FilmFactoryDataArr  removeAllObjects];
        }
        weakSelf.FilmFactoryDataArr = dataArr.mutableCopy;
        [weakSelf.FilmFactoryTableView reloadData];
        [weakSelf.FilmFactoryTableView.mj_header endRefreshing];
        
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
