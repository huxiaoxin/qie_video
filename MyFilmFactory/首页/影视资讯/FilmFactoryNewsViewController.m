//
//  FilmFactoryNewsViewController.m
//  FilmFactory
//
//  Created by zjlk03 on 2021/4/26.
//

#import "FilmFactoryNewsViewController.h"
#import "ShuyunHomeNewsModel.h"
#import "ShuyunHomeNewsTableViewCell.h"
#import "FilmFactorynewsDetialViewController.h"
@interface FilmFactoryNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *  ShuyunHomeTableView;
@property(nonatomic,strong) NSMutableArray * shuyunNewsDataArr;

@end

@implementation FilmFactoryNewsViewController
-(NSMutableArray *)shuyunNewsDataArr{
    if (!_shuyunNewsDataArr) {
        _shuyunNewsDataArr  = [NSMutableArray array];
    }
    return _shuyunNewsDataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"影视资讯";
    [self.view addSubview:self.ShuyunHomeTableView];

    // Do any additional setup after loading the view.
}
-(UITableView *)ShuyunHomeTableView{
    if (!_ShuyunHomeTableView) {
        _ShuyunHomeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-GK_SAFEAREA_BTM-NaviH) style:UITableViewStylePlain];
        _ShuyunHomeTableView.delegate = self;
        _ShuyunHomeTableView.dataSource = self;
        _ShuyunHomeTableView.showsVerticalScrollIndicator = NO;
        _ShuyunHomeTableView.showsHorizontalScrollIndicator = NO;
        _ShuyunHomeTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _ShuyunHomeTableView.backgroundColor = [UIColor clearColor];
        _ShuyunHomeTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(ShuyunHomeHeaderClicks)];
        [_ShuyunHomeTableView.mj_header beginRefreshing];
    }
    return _ShuyunHomeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
return self.shuyunNewsDataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  return K(119);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * ShuyunActityIdentifer = @"ShuyunHomeNewsTableViewCell";
    ShuyunHomeNewsTableViewCell * ShuyunNewsCell = [tableView dequeueReusableCellWithIdentifier:ShuyunActityIdentifer];
    if (ShuyunNewsCell == nil) {
        ShuyunNewsCell = [[ShuyunHomeNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ShuyunActityIdentifer];
    }
    ShuyunNewsCell.newsModel = self.shuyunNewsDataArr[indexPath.row];
    return ShuyunNewsCell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmFactorynewsDetialViewController * detailVc = [[FilmFactorynewsDetialViewController alloc]init];
        detailVc.hidesBottomBarWhenPushed = YES;
        detailVc.newsModel = self.shuyunNewsDataArr[indexPath.row];
        [self.navigationController pushViewController:detailVc animated:YES];
}

-(void)ShuyunHomeHeaderClicks{
    
    NSDictionary * reseponeDic = [self getJsonDataJsonname:@"city"];
//    NSLog(@"%@",myStr);
    NSMutableArray * tempArr = [NSMutableArray array];
    NSArray * tempDicArr = [[[reseponeDic objectForKey:@"result"] objectForKey:@"result"] objectForKey:@"list"];
    for (NSDictionary * dic in tempDicArr) {
        ShuyunHomeNewsModel * newsModel = [[ShuyunHomeNewsModel alloc]init];
        [newsModel setValuesForKeysWithDictionary:dic];
        [tempArr addObject:newsModel];
    }
    MJWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.shuyunNewsDataArr.count > 0) {
            [weakSelf.shuyunNewsDataArr removeAllObjects];
        }
        weakSelf.shuyunNewsDataArr = tempArr;
        [weakSelf.ShuyunHomeTableView reloadData];
        [weakSelf.ShuyunHomeTableView.mj_header endRefreshing];
    });

}
- (id)getJsonDataJsonname:(NSString *)jsonname
{
    NSString *path = [[NSBundle mainBundle] pathForResource:jsonname ofType:@"json"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (!jsonData || error) {
        return nil;
    } else {
        return jsonObj;
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
