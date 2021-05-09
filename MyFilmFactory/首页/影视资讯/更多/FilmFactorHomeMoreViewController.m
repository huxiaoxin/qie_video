//
//  FilmFactorHomeMoreViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/21.
//

#import "FilmFactorHomeMoreViewController.h"
#import "FilmFacroyHomeTableViewCell.h"
#import "FilmFacotryShangyingDetailViewController.h"
@interface FilmFactorHomeMoreViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFactoryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFactoryDataArr;

@end

@implementation FilmFactorHomeMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"企鹅追剧";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmFactoryTableView];
    // Do any additional setup after loading the view.
}
-(NSMutableArray *)FilmFactoryDataArr{
    if (!_FilmFactoryDataArr) {
        _FilmFactoryDataArr = [NSMutableArray array];
    }
    return _FilmFactoryDataArr;
}

- (UITableView *)FilmFactoryTableView{
    if (!_FilmFactoryTableView) {
        _FilmFactoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, GK_SCREEN_WIDTH, GK_SCREEN_HEIGHT-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
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

-(void)FilmFactoryHeaderClicks{
    
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFacotryHomeModel class]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmFactoryDataArr.count > 0) {
            [weakSelf.FilmFactoryDataArr removeAllObjects];
        }
        weakSelf.FilmFactoryDataArr = dataArr.mutableCopy;
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
