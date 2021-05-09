//
//  FilmFactoryMySendViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/27.
//

#import "FilmFactoryMySendViewController.h"
#import "FilmFactoryZoneTableViewCell.h"
#import "FilmFActorySendZoneConroller.h"
@interface FilmFactoryMySendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView  * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactorydataArr;

@end

@implementation FilmFactoryMySendViewController
-(NSMutableArray *)FilmFactorydataArr{
    if (!_FilmFactorydataArr) {
        _FilmFactorydataArr = [NSMutableArray array];
    }
    return _FilmFactorydataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"我的发布";
    [self.view addSubview:self.FilmFactoryTableView];

    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.FilmFactorydataArr[section] count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(20);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.FilmFactorydataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *  FilmFactoryIdentifer = @"FilmFactoryZoneTableViewCell";
    FilmFactoryZoneTableViewCell * FilmFactoryCell = [tableView dequeueReusableCellWithIdentifier:FilmFactoryIdentifer];
    if (FilmFactoryCell == nil) {
        FilmFactoryCell = [[FilmFactoryZoneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFactoryIdentifer];
    }
    FilmFactoryCell.myIndexpath = indexPath;
    FilmFactoryCell.tag = indexPath.row;
    FilmFactoryCell.filmModel = self.FilmFactorydataArr[indexPath.section][indexPath.row];
    return FilmFactoryCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(180);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStyleGrouped];
        _FilmFactoryTableView.delegate = self;
        _FilmFactoryTableView.dataSource = self;
        _FilmFactoryTableView.showsVerticalScrollIndicator = NO;
        _FilmFactoryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFactoryTableView.backgroundColor =  [UIColor clearColor];
        _FilmFactoryTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmFactoryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFactoryTableViewheaderClick)];
        [_FilmFactoryTableView.mj_header beginRefreshing];
    }
    return _FilmFactoryTableView;
}
-(void)FilmFactoryTableViewheaderClick{
    
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmFactorydataArr.count > 0) {
            [weakSelf.FilmFactorydataArr removeAllObjects];
        }
        [LCProgressHUD showInfoMsg:@"暂无数据"];
        LYEmptyView * emtyView = [LYEmptyView emptyActionViewWithImage:nil titleStr:@"暂无发布动态" detailStr:nil btnTitleStr:@"去发布" target:self action:@selector(FilmFactoryEmtyviewClick)];
        weakSelf.FilmFactoryTableView.ly_emptyView = emtyView;
        [weakSelf.FilmFactoryTableView reloadData];
        [weakSelf.FilmFactoryTableView.mj_header endRefreshing];
    });
}
-(void)FilmFactoryEmtyviewClick{
    FilmFActorySendZoneConroller * FilmSendVc = [[FilmFActorySendZoneConroller alloc]init];
    
    [self presentViewController:FilmSendVc animated:YES completion:nil];
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
