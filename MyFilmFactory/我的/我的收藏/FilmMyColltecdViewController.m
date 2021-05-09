
#import "FilmMyColltecdViewController.h"
#import "FilmFacotryShangyinTableViewCell.h"
#import "FilmFacotryShangyingDetailViewController.h"
#import "FilmFacotryHomeModel.h"
@interface FilmMyColltecdViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmFacotryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFacotryDataArr;
@end

@implementation FilmMyColltecdViewController

-(NSMutableArray *)FilmFacotryDataArr{
    if (!_FilmFacotryDataArr) {
        _FilmFacotryDataArr = [NSMutableArray array];
    }
    return _FilmFacotryDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的收藏";
    [self.view addSubview:self.FilmFacotryTableView];
    // Do any additional setup after loading the view.
}

- (UITableView *)FilmFacotryTableView{
    if (!_FilmFacotryTableView) {
        _FilmFacotryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmFacotryTableView.delegate = self;
        _FilmFacotryTableView.dataSource = self;
        _FilmFacotryTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacotryTableView.separatorStyle =UITableViewCellSelectionStyleNone;
        _FilmFacotryTableView.backgroundColor = [UIColor clearColor];
        _FilmFacotryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFacotryHeaderClicks)];
        [_FilmFacotryTableView.mj_header beginRefreshing];
    }
    return _FilmFacotryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmFacotryDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacotryIdentifer = @"FilmFacotryShangyinTableViewCell";
    FilmFacotryShangyinTableViewCell * FilmmFacoreyCell =[tableView dequeueReusableCellWithIdentifier:FilmFacotryIdentifer];
    if (FilmmFacoreyCell == nil ) {
        FilmmFacoreyCell = [[FilmFacotryShangyinTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacotryIdentifer];
    }
    FilmmFacoreyCell.filmHomeModel = self.FilmFacotryDataArr[indexPath.row];
    return FilmmFacoreyCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(120);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFacotryShangyingDetailViewController * FilmShanyinVc = [[FilmFacotryShangyingDetailViewController alloc]init];
    FilmShanyinVc.hidesBottomBarWhenPushed = YES;
    FilmShanyinVc.filmHomeMode = self.FilmFacotryDataArr[indexPath.row];
    [self.navigationController pushViewController:FilmShanyinVc animated:YES];
}
-(void)FilmFacotryHeaderClicks{
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFacotryHomeModel class] where:[NSString stringWithFormat:@"isColletcd ='%@'",[NSNumber numberWithBool:YES]]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmFacotryDataArr.count > 0) {
            [weakSelf.FilmFacotryDataArr removeAllObjects];
        }
        weakSelf.FilmFacotryDataArr = dataArr.mutableCopy;
        [weakSelf.FilmFacotryTableView reloadData];
        [weakSelf.FilmFacotryTableView.mj_header endRefreshing];
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

