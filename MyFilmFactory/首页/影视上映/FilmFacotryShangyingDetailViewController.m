//
//  FilmFacotryShangyingDetailViewController.m
//  FilmFactory
//
//  Created by codehzx on 2021/4/26.
//

#import "FilmFacotryShangyingDetailViewController.h"
#import "FilmFacotryShangyinDetailHeader.h"
#import "FilmFarZoneDetiaCell.h"
#import "FilmFactoryShangyinModel.h"
#import "FilmZoneJbaoController.h"
#import <XHInputView-umbrella.h>
@interface FilmFacotryShangyingDetailViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFacotryShangyinDetailHeaderDelegate,FilmFarZoneDetiaCellDelegate>
@property(nonatomic,strong) UITableView * FilmFacotyTableView;
@property(nonatomic,strong) FilmFacotryShangyinDetailHeader * FilmDetaiHeader;
@property(nonatomic,strong) UIButton  * FilmAddBtn;
@property(nonatomic,strong) NSMutableArray * FilmdataArr;
@end

@implementation FilmFacotryShangyingDetailViewController
- (NSMutableArray *)FilmdataArr{
    if (!_FilmdataArr) {
        _FilmdataArr = [NSMutableArray array];
    }
    return _FilmdataArr;
}
#pragma mark--FilmFacotryShangyinDetailHeaderDelegate
-(void)FilmFacotryShangyinDetailHeaderDidSeltecdWithAction:(UIButton *)myBtn{
    
    if ([ORAccountComponent checkLogin:YES]){
        [LCProgressHUD showLoading:@""];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.filmHomeMode.isColletcd = !self.filmHomeMode.isColletcd;
            if (self.filmHomeMode.isColletcd) {
                [LCProgressHUD showSuccess:@"收藏成功"];
                [myBtn setBackgroundColor:LGDMianColor];
                [myBtn setTitle:@"已收藏" forState:UIControlStateNormal];
                [myBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            }else{
                [LCProgressHUD showInfoMsg:@"取消收藏"];
                [myBtn setBackgroundColor:[UIColor whiteColor]];
                [myBtn setTitle:@"收藏" forState:UIControlStateNormal];
                [myBtn setTitleColor:LGDMianColor forState:UIControlStateNormal];
            }
            [WHC_ModelSqlite update:[FilmFacotryHomeModel class] value:[NSString stringWithFormat:@"isColletcd ='%@'",[NSNumber numberWithBool:self.filmHomeMode.isColletcd]] where:[NSString stringWithFormat:@"FilmID ='%ld'",self.filmHomeMode.FilmID]];
        });

    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    [LCProgressHUD showLoading:@""];
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactoryShangyinModel class] where:[NSString stringWithFormat:@"FilmID ='%ld'",self.filmHomeMode.FilmID]];
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD hide];
        weakSelf.FilmdataArr = dataArr.mutableCopy;
        [self.view addSubview:self.FilmFacotyTableView];
        self.FilmDetaiHeader.height = self.FilmDetaiHeader.FilmFacotryShangyinDetailHeaderHeight;
        self->_FilmFacotyTableView.tableHeaderView = self.FilmDetaiHeader;
        [self.view addSubview:self.FilmAddBtn];
        if (weakSelf.FilmdataArr.count == 0) {
            LYEmptyView * emtyView = [LYEmptyView emptyViewWithImage:nil titleStr:@"暂无数据" detailStr:nil];
            emtyView.contentViewOffset = RealWidth(250);
            weakSelf.FilmFacotyTableView.ly_emptyView = emtyView;
        }

        [weakSelf.FilmFacotyTableView reloadData];

    });
    // Do any additional setup after loading the view.
}
- (UIButton *)FilmAddBtn{
    if (!_FilmAddBtn) {
        _FilmAddBtn  =[[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(50)-NaviH, SCREEN_Width, K(50))];
        [_FilmAddBtn setBackgroundColor:LGDMianColor];
        [_FilmAddBtn setTitle:@"添加评论" forState:UIControlStateNormal];
        _FilmAddBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_FilmAddBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_FilmAddBtn addTarget:self action:@selector(FilmAddBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _FilmAddBtn;
}
- (FilmFacotryShangyinDetailHeader *)FilmDetaiHeader{
    if (!_FilmDetaiHeader) {
        _FilmDetaiHeader = [[FilmFacotryShangyinDetailHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 0) WithConfig:self.filmHomeMode];
        _FilmDetaiHeader.delegate = self;
    }
    return _FilmDetaiHeader;
}
- (UITableView *)FilmFacotyTableView{
    if (!_FilmFacotyTableView) {
        _FilmFacotyTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-K(60)-NaviH) style:UITableViewStylePlain];
        _FilmFacotyTableView.delegate  = self;
        _FilmFacotyTableView.dataSource= self;
        _FilmFacotyTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotyTableView.showsHorizontalScrollIndicator  =NO;
        _FilmFacotyTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFacotyTableView.backgroundColor = [UIColor clearColor];
        _FilmFacotyTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmFacotyTableViewClick)];
    }
    return _FilmFacotyTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmdataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *  FilmzoneIdnetiders = @"FilmFarZoneDetiaCell";
    FilmFarZoneDetiaCell   * FilmzoneCell  =[tableView dequeueReusableCellWithIdentifier:FilmzoneIdnetiders];
    if (FilmzoneCell == nil) {
        FilmzoneCell = [[FilmFarZoneDetiaCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmzoneIdnetiders];
    }
    FilmzoneCell.tag = indexPath.row;
    FilmzoneCell.delegate = self;
    FilmzoneCell.filmShangyinModel = self.FilmdataArr[indexPath.row];
    return FilmzoneCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactoryShangyinModel * filmshangmodel = self.FilmdataArr[indexPath.row];
    return filmshangmodel.CellHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(40);
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * FilmHeader =[UIView new];
    FilmHeader.backgroundColor = [UIColor whiteColor];
    UILabel * FilmSeciotnlb = [[UILabel alloc]initWithFrame:CGRectMake(K(12), 0, SCREEN_Width, K(30))];
    FilmSeciotnlb.textColor = [UIColor blackColor];
    FilmSeciotnlb.font = [UIFont boldSystemFontOfSize:16];
    FilmSeciotnlb.text = @"热门评论";
    [FilmHeader addSubview:FilmSeciotnlb];
    return FilmHeader;
}
-(void)FilmFacotyTableViewClick{
    MJWeakSelf;
    NSArray * dataArr = [WHC_ModelSqlite query:[FilmFactoryShangyinModel class] where:[NSString stringWithFormat:@"FilmID ='%ld'",self.filmHomeMode.FilmID]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1  * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmdataArr.count > 0) {
            [weakSelf.FilmdataArr removeAllObjects];
        }
        weakSelf.FilmdataArr = dataArr.mutableCopy;
        [weakSelf.FilmFacotyTableView reloadData];
        
        if (weakSelf.FilmdataArr.count == 0) {
            LYEmptyView * emtyView = [LYEmptyView emptyViewWithImage:nil titleStr:@"暂无数据" detailStr:nil];
            emtyView.contentViewY = self.FilmDetaiHeader.FilmFacotryShangyinDetailHeaderHeight+RealWidth(20);

            weakSelf.FilmFacotyTableView.ly_emptyView = emtyView;
        }
        [weakSelf.FilmFacotyTableView.mj_header endRefreshing];
    });
}
#pragma mark--FilmFarZoneDetiaCellDelegate
-(void)FilmFarZoneDetiaCellDetailTableViewCellWithIndex:(NSInteger)Cellindex FilmFarZoneDetiaCellbtnTag:(NSInteger)btnIndex{
    
    
    
    FilmFactoryShangyinModel * filmshangyinModel = self.FilmdataArr[Cellindex];
    if (btnIndex == 1) {
        
        if ([ORAccountComponent checkLogin:YES]){
            FilmZoneJbaoController * filmjubaoVc = [[FilmZoneJbaoController alloc]init];
            filmjubaoVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:filmjubaoVc animated:YES];

        }
    }else{
        
        UIAlertController * shuyunAlterVc = [UIAlertController alertControllerWithTitle:@"温馨提示" message:[NSString stringWithFormat:@"您确定要屏蔽(%@)该用户吗？",filmshangyinModel.name] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * sureActoin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self FilmChangeConfiguserModel:filmshangyinModel];
        }];
        
        UIAlertAction * thinkingActoin = [UIAlertAction actionWithTitle:@"再想想" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [shuyunAlterVc addAction:sureActoin];
        [shuyunAlterVc addAction:thinkingActoin];
        [self presentViewController:shuyunAlterVc animated:YES completion:nil];
        
    }
}
-(void)FilmChangeConfiguserModel:(FilmFactoryShangyinModel *)fimModel{
    if ([ORAccountComponent checkLogin:YES]){
        [LCProgressHUD showLoading:@""];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [LCProgressHUD  showSuccess:@"屏蔽成功"];
            [WHC_ModelSqlite delete:[FilmFactoryShangyinModel class] where:[NSString stringWithFormat:@"ComentID ='%ld'",fimModel.ComentID]];
            [self.FilmFacotyTableView.mj_header beginRefreshing];
        });

    }
}
-(void)FilmAddBtnClick{
    if ([ORAccountComponent checkLogin:YES]){
        MJWeakSelf;
        [XHInputView showWithStyle:InputViewStyleLarge configurationBlock:^(XHInputView *inputView) {
            inputView.sendButtonBackgroundColor =  LGDMianColor;
            inputView.sendButtonTitle = @"发送";
        } sendBlock:^BOOL(NSString *text) {
            if (text.length == 0) {
                [LCProgressHUD showInfoMsg:@"请输入评论"];
                return NO;
            }else{
                [weakSelf WindwoundSendComentWith:text];
                return YES;
            }
        }];

    }
}
-(NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}
-(void)WindwoundSendComentWith:(NSString *)Text{
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"评论成功"];
        FilmFactoryShangyinModel * windwoundItem  =[[FilmFactoryShangyinModel alloc]init];
        windwoundItem.imgurl = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201509%2F20%2F20150920105348_38Ewf.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1622122578&t=b958e581d60c7e075d8725af3bbd6127";
        windwoundItem.name = [FilmFactoryToolModel FilmGetuserName];
        windwoundItem.time = [self getCurrentTimes];
        windwoundItem.content  = Text;
        windwoundItem.FilmID = self.filmHomeMode.FilmID;
        windwoundItem.ComentID = (self.FilmdataArr.count+1);
        windwoundItem.CellHeight = 0;
        [WHC_ModelSqlite  insert:windwoundItem];
        [self.FilmdataArr addObject:windwoundItem];
        [self.FilmFacotyTableView reloadData];
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
