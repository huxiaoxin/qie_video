//
//  FilmFacotryShangyinViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import "FilmFacotryShangyinViewController.h"
#import "FilmFacotryShangyinTableViewCell.h"
#import "FilmFacotryShangyingDetailViewController.h"
#import "FilmFacotryHomeModel.h"
@interface FilmFacotryShangyinViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFacotryShangyinTableViewCellDelegate>
@property(nonatomic,strong) UITableView * FilmFacotryTableView;
@property(nonatomic,strong) NSMutableArray * FilmFacotryDataArr;
@end

@implementation FilmFacotryShangyinViewController

-(NSMutableArray *)FilmFacotryDataArr{
    if (!_FilmFacotryDataArr) {
        _FilmFacotryDataArr = [NSMutableArray array];
    }
    return _FilmFacotryDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.FilmIndex == 0) {
        self.navigationItem.title = @"企鹅好片";
    }else if (self.FilmIndex == 1){
        self.navigationItem.title = @"环球新片";
    }else if (self.FilmIndex == 2){
        self.navigationItem.title = @"即将上映";
    }
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
    FilmmFacoreyCell.tag = indexPath.row;
    FilmmFacoreyCell.delegate = self;
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
    NSArray * dataArr =[WHC_ModelSqlite query:[FilmFacotryHomeModel class] where:[NSString stringWithFormat:@"Top_filmType ='%ld'",self.FilmIndex]];
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
#pragma mark--FilmFacotryShangyinTableViewCellDelegate
-(void)FilmFacotryShangyinTableViewCellWithbtnClick:(NSInteger)cellTag{
    
    FilmFacotryShangyingDetailViewController * FilmShanyinVc = [[FilmFacotryShangyingDetailViewController alloc]init];
    FilmShanyinVc.hidesBottomBarWhenPushed = YES;
    FilmShanyinVc.filmHomeMode = self.FilmFacotryDataArr[cellTag];
    [self.navigationController pushViewController:FilmShanyinVc animated:YES];
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
