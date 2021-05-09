//
//  FilmFacorrLoactoinDetailViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/23.
//

#import "FilmFacorrLoactoinDetailViewController.h"
#import "FilmFacotryLocationDetailHeader.h"
#import "FilmFacortLoactionDetailFooter.h"
#import "FilmFacroryLoacitonDetailTableViewCell.h"
#import "FilmLoactionJoinViewController.h"
#import <MapKit/MapKit.h>

@interface FilmFacorrLoactoinDetailViewController ()<UITableViewDelegate,UITableViewDataSource,FilmFacotryLocationDetailHeaderDelegate>
@property(nonatomic,strong) UITableView  * FilmFacotryTableView;
@property(nonatomic,strong) FilmFacotryLocationDetailHeader * FilmDetailHeader;
@property(nonatomic,strong) FilmFacortLoactionDetailFooter  * FilmDetailFooter;
@property(nonatomic,strong) NSMutableArray *  FilmDataArr;
@property(nonatomic,strong) UIButton * FilmJoninbtn;
@end

@implementation FilmFacorrLoactoinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle =  @"详情";
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.FilmFacotryTableView];
    self.FilmDetailHeader.mj_h = self.FilmDetailHeader.FilmFacotryHeight;
    _FilmFacotryTableView.tableHeaderView = self.FilmDetailHeader;
    _FilmFacotryTableView.tableFooterView = self.FilmDetailFooter;
    [self.view addSubview:self.FilmJoninbtn];
    
    //
    
    self.gk_navItemRightSpace = 15;
    UIButton * FilmRightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [FilmRightBtn setImage:[UIImage imageNamed:@"daohang"] forState:UIControlStateNormal];
    [FilmRightBtn addTarget:self action:@selector(FilmRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmRightBtn];
    // Do any additional setup after loading the view.
}
#pragma mark--FilmFacotryLocationDetailHeaderDelegate
-(void)FilmFacotryLocationDetailHeaderBtnClick:(UIButton *)myBtn{
    if (![FilmFactoryToolModel FilmFactoryisLogin]) {
        [self FilmFactoryBaseShowLoginVc];
        return;
    }
    self.filmLoactionModel.isCollted = !self.filmLoactionModel.isCollted;

    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.filmLoactionModel.isCollted) {
            [LCProgressHUD showSuccess:@"关注成功"];
            myBtn.selected = YES;
        }else{
            [LCProgressHUD showInfoMsg:@"取消关注"];
            myBtn.selected = NO;
        }
        
        [WHC_ModelSqlite update:[FilmFactortLoactionModel class] value:[NSString stringWithFormat:@"isCollted ='%@'",[NSNumber numberWithBool:self.filmLoactionModel.isCollted]] where:[NSString stringWithFormat:@"LoactionID ='%ld'",self.filmLoactionModel.LoactionID]];
    });
}
-(void)FilmRightBtnClick{
    //终点坐标
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(30.25445, 120.20884);
    
    
    //用户位置
    MKMapItem *currentLoc = [MKMapItem mapItemForCurrentLocation];
    //终点位置
    MKMapItem *toLocation = [[MKMapItem alloc]initWithPlacemark:[[MKPlacemark alloc]initWithCoordinate:loc addressDictionary:nil] ];
    
    
    NSArray *items = @[currentLoc,toLocation];
    //第一个
    NSDictionary *dic = @{
                          MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
                          MKLaunchOptionsMapTypeKey : @(MKMapTypeStandard),
                          MKLaunchOptionsShowsTrafficKey : @(YES)
                          };
    //第二个，都可以用
//    NSDictionary * dic = @{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,
//                           MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]};
    
    [MKMapItem openMapsWithItems:items launchOptions:dic];
    
}
- (UIButton *)FilmJoninbtn{
    if (!_FilmJoninbtn) {
        _FilmJoninbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_Height-K(50), SCREEN_Width-K(0), K(50))];
        [_FilmJoninbtn setBackgroundColor: LGDMianColor];
        [_FilmJoninbtn setTitle:@"立即参与" forState:UIControlStateNormal];
        [_FilmJoninbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _FilmJoninbtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _FilmJoninbtn.titleLabel.font = [UIFont systemFontOfSize:K(15)];
        [_FilmJoninbtn addTarget:self action:@selector(FilmJoninbtnClick) forControlEvents:UIControlEventTouchUpInside];
        if ([FilmFactoryToolModel FilmFactoryisLogin]) {
            if (self.filmLoactionModel.isBaoming) {
                [_FilmJoninbtn setBackgroundColor:LGDGaryColor];
                [_FilmJoninbtn setTitle:@"已参与" forState:UIControlStateNormal];

                _FilmJoninbtn.enabled = NO;
            }else{
                _FilmJoninbtn.enabled = YES;
                [_FilmJoninbtn setBackgroundColor:LGDMianColor];
                [_FilmJoninbtn setTitle:@"立即参与" forState:UIControlStateNormal];
            }
        }else{
            _FilmJoninbtn.enabled = YES;
            [_FilmJoninbtn setBackgroundColor:LGDMianColor];
            [_FilmJoninbtn setTitle:@"立即参与" forState:UIControlStateNormal];
        }
      
    }
    return _FilmJoninbtn;
}
- (NSMutableArray *)FilmDataArr{
    if (!_FilmDataArr) {
        _FilmDataArr = [NSMutableArray arrayWithArray:@[[NSString stringWithFormat:@"| %@",self.filmLoactionModel.joinTime],[NSString stringWithFormat:@"| %@",self.filmLoactionModel.playTime],[NSString stringWithFormat:@"| %@",self.filmLoactionModel.loaction],[NSString stringWithFormat:@"| %@",self.filmLoactionModel.phone]]];
    }
    return _FilmDataArr;
}
- (FilmFacotryLocationDetailHeader *)FilmDetailHeader{
    if (!_FilmDetailHeader) {
        _FilmDetailHeader = [[FilmFacotryLocationDetailHeader alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(330)) ConfigWithModel:self.filmLoactionModel];
        _FilmDetailHeader.delegate = self;
    }
    return _FilmDetailHeader;
}
- (FilmFacortLoactionDetailFooter *)FilmDetailFooter{
    if (!_FilmDetailFooter) {
    _FilmDetailFooter = [[FilmFacortLoactionDetailFooter alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, K(109+29))];
    }
    return _FilmDetailFooter;
}
- (UITableView *)FilmFacotryTableView{
    if (!_FilmFacotryTableView) {
        _FilmFacotryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-K(80)) style:UITableViewStylePlain];
        _FilmFacotryTableView.showsVerticalScrollIndicator = NO;
        _FilmFacotryTableView.showsHorizontalScrollIndicator = NO;
        _FilmFacotryTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmFacotryTableView.backgroundColor = [UIColor clearColor];
        _FilmFacotryTableView.delegate = self;
        _FilmFacotryTableView.dataSource = self;
    }
    return _FilmFacotryTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmFacoryIdentifer = @"FilmFacroryLoacitonDetailTableViewCell";
    FilmFacroryLoacitonDetailTableViewCell * FilmCell = [tableView dequeueReusableCellWithIdentifier:FilmFacoryIdentifer];
    if (FilmCell == nil) {
        FilmCell = [[FilmFacroryLoacitonDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmFacoryIdentifer];
    }
    FilmCell.FilmStr = self.FilmDataArr[indexPath.row];
    [FilmCell FilmFacroryLoacitonDetailTableViewCellConfig:self.FilmDataArr FilmoIndex:indexPath];
    return FilmCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RealWidth(30);
}
-(void)FilmJoninbtnClick{
    if (![FilmFactoryToolModel FilmFactoryisLogin]) {
        [self FilmFactoryBaseShowLoginVc];
        return;
    }
    FilmLoactionJoinViewController * FilmJoinVc  = [[FilmLoactionJoinViewController alloc]init];
    FilmJoinVc.filmModel = self.filmLoactionModel;
    FilmJoinVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:FilmJoinVc animated:YES];
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
