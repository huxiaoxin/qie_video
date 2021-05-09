
#import "FilmZoneJbaoController.h"
#import "FilmZoneJubaoTableviewCell.h"
#import "FilmZoneJubaoModel.h"
@interface FilmZoneJbaoController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView * FilmZoneJbaoTableview;
@property(nonatomic,strong) NSMutableArray * FilmZoneDataArr;
@property(nonatomic,assign) BOOL  FilmZoneStatus;
@end

@implementation FilmZoneJbaoController
-(NSMutableArray *)FilmZoneDataArr{
    if (!_FilmZoneDataArr) {
        _FilmZoneDataArr= [[NSMutableArray alloc]init];
        FilmZoneJubaoModel * FilmZoneitem = [[FilmZoneJubaoModel alloc]init];
        FilmZoneitem.FilmZoneStatus  = NO;
        FilmZoneitem.FilmZoneText = @"内容太水,太垃圾";
        [_FilmZoneDataArr addObject:FilmZoneitem];
        
        FilmZoneJubaoModel * FilmZoneitem2 = [[FilmZoneJubaoModel alloc]init];
        FilmZoneitem2.FilmZoneStatus  = NO;
        FilmZoneitem2.FilmZoneText = @"低俗、传播色情";
        [_FilmZoneDataArr addObject:FilmZoneitem2];
        
        
        FilmZoneJubaoModel * FilmZoneitem3 = [[FilmZoneJubaoModel alloc]init];
        FilmZoneitem3.FilmZoneStatus  = NO;
        FilmZoneitem3.FilmZoneText = @"未经授权侵犯品牌";
        [_FilmZoneDataArr addObject:FilmZoneitem3];
        
        
        FilmZoneJubaoModel * FilmZoneitem4 = [[FilmZoneJubaoModel alloc]init];
        FilmZoneitem4.FilmZoneStatus  = NO;
        FilmZoneitem4.FilmZoneText = @"违禁品传播";
        [_FilmZoneDataArr addObject:FilmZoneitem4];
        
        FilmZoneJubaoModel * FilmZoneitem5 = [[FilmZoneJubaoModel alloc]init];
        FilmZoneitem5.FilmZoneStatus  = NO;
        FilmZoneitem5.FilmZoneText = @"其他";
        [_FilmZoneDataArr addObject:FilmZoneitem5];
        
        
        
    }
    return _FilmZoneDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"举报";
    self.FilmZoneStatus  =NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.FilmZoneJbaoTableview];
    
    
    self.view.backgroundColor = LGDLightGaryColor;
    
    UIView * FilmZoneMoreView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(35))];
    FilmZoneMoreView.backgroundColor = LGDLightGaryColor;
    
    UILabel * FilmZoneMorelb = [[UILabel alloc]initWithFrame:CGRectMake(K(15), K(0), K(200), K(35))];
    FilmZoneMorelb.font = KSysFont(12);
    FilmZoneMorelb.textColor = LGDLightBLackColor;
    FilmZoneMorelb.text = @"可以选择多项";
    [FilmZoneMoreView addSubview:FilmZoneMorelb];
    _FilmZoneJbaoTableview.tableHeaderView = FilmZoneMoreView;
    
    
    UIView * FilmZoneMoreCommiteView  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(40))];
    
    UIButton * FilmZoneMoreCommitebtn  =[[UIButton alloc]initWithFrame:CGRectMake(K(20), K(10), K(40), K(20))];
    [FilmZoneMoreCommitebtn setTitle:@"提交" forState:UIControlStateNormal];
    [FilmZoneMoreCommitebtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    FilmZoneMoreCommitebtn.titleLabel.font = KSysFont(13);
    [FilmZoneMoreCommitebtn addTarget:self action:@selector(FilmZoneMoreCommitebtnClick) forControlEvents:UIControlEventTouchUpInside];
    [FilmZoneMoreCommiteView addSubview:FilmZoneMoreCommitebtn];
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmZoneMoreCommiteView];
    
    
}
-(UITableView *)FilmZoneJbaoTableview{
    if (!_FilmZoneJbaoTableview) {
        _FilmZoneJbaoTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-kTabBarHeight) style:UITableViewStylePlain];
        _FilmZoneJbaoTableview.delegate = self;
        _FilmZoneJbaoTableview.dataSource = self;
        _FilmZoneJbaoTableview.showsVerticalScrollIndicator = NO;
        _FilmZoneJbaoTableview.showsHorizontalScrollIndicator = NO;
        _FilmZoneJbaoTableview.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmZoneJbaoTableview.backgroundColor = [UIColor clearColor];
        _FilmZoneJbaoTableview.mj_header =[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmZoneMoreHeaderClicks)];
        [_FilmZoneJbaoTableview.mj_header beginRefreshing];
    }
    return _FilmZoneJbaoTableview;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmZoneStatus ? self.FilmZoneDataArr.count : 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmZoneMoreIdentifer =  @"FilmZoneJubaoTableviewCell";
    FilmZoneJubaoTableviewCell * FilmZoneMorCell = [tableView dequeueReusableCellWithIdentifier:FilmZoneMoreIdentifer];
    if (FilmZoneMorCell == nil) {
        FilmZoneMorCell = [[FilmZoneJubaoTableviewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmZoneMoreIdentifer];
    }
    FilmZoneMorCell.FilmItem = self.FilmZoneDataArr[indexPath.row];
    return FilmZoneMorCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmZoneJubaoModel * FilmZoneMoreItem = self.FilmZoneDataArr[indexPath.row];
    FilmZoneMoreItem.FilmZoneStatus = !FilmZoneMoreItem.FilmZoneStatus;
    [self.FilmZoneJbaoTableview reloadData];
}
-(void)FilmZoneMoreHeaderClicks{
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        weakSelf.FilmZoneStatus = YES;
        [weakSelf.FilmZoneJbaoTableview reloadData];
        [weakSelf.FilmZoneJbaoTableview.mj_header endRefreshing];
    });
}
-(void)FilmZoneMoreCommitebtnClick{
    int FilmZoneMorIndx = 0;
    for (FilmZoneJubaoModel * FilmZoneMoreItem in self.FilmZoneDataArr) {
        if (FilmZoneMoreItem.FilmZoneStatus) {
            FilmZoneMorIndx+=1;
        }
    }
    if (FilmZoneMorIndx == 0) {
        [LCProgressHUD showInfoMsg:@"请选择举报类型"];
        return;
    }
    
    if ([ORAccountComponent checkLogin:YES]){
        [LCProgressHUD showLoading:@""];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LCProgressHUD showSuccess:@"感谢支持~,举报结果我们核实后会24h内通知到您"];
            [self.navigationController popViewControllerAnimated:YES];
        });

    }

    
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

