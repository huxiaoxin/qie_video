
#import "FilmFactorySugestionViewController.h"
#import "FilmFacotroySugestionTableCell.h"
#import "FilmFactoryModel.h"
#import <UITextView+ZWPlaceHolder.h>
@interface FilmFactorySugestionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmItemSugstionTableView;
@property(nonatomic,strong) NSMutableArray * FilmItemSugstionDataArr;
@property(nonatomic,strong) UITextView * FilmItemSugstionTextView;
@end

@implementation FilmFactorySugestionViewController
-(NSMutableArray *)FilmItemSugstionDataArr{
    if (!_FilmItemSugstionDataArr) {
        _FilmItemSugstionDataArr = [NSMutableArray array];
        
        FilmFactoryModel * filmitem = [[FilmFactoryModel alloc]init];
        filmitem.FilmStatus   = YES;
        filmitem.FilmFacrtoryName = @"产品不好用";
        [_FilmItemSugstionDataArr addObject:filmitem];
        
        FilmFactoryModel * filmitem1 = [[FilmFactoryModel alloc]init];
        filmitem1.FilmStatus   = NO;
        filmitem1.FilmFacrtoryName = @"页面不好看";
        [_FilmItemSugstionDataArr addObject:filmitem1];
        
        FilmFactoryModel * filmitem2 = [[FilmFactoryModel alloc]init];
        filmitem2.FilmStatus   = NO;
        filmitem2.FilmFacrtoryName = @"功能bug";
        [_FilmItemSugstionDataArr addObject:filmitem2];
        
        FilmFactoryModel * filmitem3 = [[FilmFactoryModel alloc]init];
        filmitem3.FilmStatus   = NO;
        filmitem3.FilmFacrtoryName = @"内容太少,找不到想要的";
        [_FilmItemSugstionDataArr addObject:filmitem3];
        
        FilmFactoryModel * filmitem4 = [[FilmFactoryModel alloc]init];
        filmitem4.FilmStatus   = NO;
        filmitem4.FilmFacrtoryName = @"其他";
        [_FilmItemSugstionDataArr addObject:filmitem4];
        
        
    }
    return _FilmItemSugstionDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.gk_navTitle = @"意见反馈";
    self.view.backgroundColor = LGDLightGaryColor;
    [self.view addSubview:self.FilmItemSugstionTableView];
    
    UIView * FilmItemAdvicCommitView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, K(80), K(60))];
    UIButton * FilmItemAdvicCommitbtn = [[UIButton alloc]initWithFrame:CGRectMake(K(20), K(12), K(40), K(20))];
    [FilmItemAdvicCommitbtn setTitle:@"提交" forState:UIControlStateNormal];
    [FilmItemAdvicCommitbtn setTitleColor:LGDBLackColor forState:UIControlStateNormal];
    FilmItemAdvicCommitbtn.titleLabel.font =[UIFont systemFontOfSize:14];
    [FilmItemAdvicCommitbtn addTarget:self action:@selector(FilmItemAdvicCommitbtnClick) forControlEvents:UIControlEventTouchUpInside];
    [FilmItemAdvicCommitView addSubview:FilmItemAdvicCommitbtn];
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:FilmItemAdvicCommitView];
}
-(void)FilmItemAdvicCommitbtnClick{
    
    if (self.FilmItemSugstionTextView.text.length == 0) {
        [LCProgressHUD showInfoMsg:@"说点什么吧~"];
        return;
    }
    if (![FilmFactoryToolModel FilmFactoryisLogin]) {
        [self FilmFactoryBaseShowLoginVc];
        return;
    }
    [LCProgressHUD showLoading:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LCProgressHUD showSuccess:@"感谢支持!"];
        [self.navigationController popViewControllerAnimated:YES];
    });
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmItemSugstionDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * FilmItemAdvicCommitbtnIdnetifer = @"FilmFacotroySugestionTableCell";
    FilmFacotroySugestionTableCell * FilmitemCell = [tableView dequeueReusableCellWithIdentifier:FilmItemAdvicCommitbtnIdnetifer];
    if (FilmitemCell == nil) {
        FilmitemCell =[[FilmFacotroySugestionTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FilmItemAdvicCommitbtnIdnetifer];
    }
    FilmitemCell.Filmitems = self.FilmItemSugstionDataArr[indexPath.row];
    return FilmitemCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(50);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return K(50);
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return K(200);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * FilmitemFotter = [UIView new];
    FilmitemFotter.backgroundColor = LGDLightGaryColor;
    UILabel * FilmitemFotterlb =[[UILabel alloc]initWithFrame:CGRectMake(K(15), K(17.5), K(120), K(15))];
    FilmitemFotterlb.font = [UIFont systemFontOfSize:14];
    FilmitemFotterlb.textColor = LGDMianColor;
    FilmitemFotterlb.text = @"详细描述";
    [FilmitemFotter addSubview:FilmitemFotterlb];
    
    
    UITextView * FilmItemSugstionTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, K(50), SCREEN_Width, K(150))];
    FilmItemSugstionTextView.zw_placeHolder=  @"说说哪个功能设计反人类了!";
    FilmItemSugstionTextView.backgroundColor = [UIColor whiteColor];
    FilmItemSugstionTextView.zw_placeHolderColor = LGDLightBLackColor;
    [FilmitemFotter addSubview:FilmItemSugstionTextView];
    _FilmItemSugstionTextView = FilmItemSugstionTextView;
    
    return FilmitemFotter;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView  * FilmitemHeaders = [UIView new];
    FilmitemHeaders.backgroundColor = LGDLightGaryColor;
    UILabel * FilmitemFotterlb =[[UILabel alloc]initWithFrame:CGRectMake(K(15), K(17.5), K(120), K(15))];
    FilmitemFotterlb.font = [UIFont systemFontOfSize:14];
    FilmitemFotterlb.textColor = LGDMianColor;
    FilmitemFotterlb.text = @"吐槽一下";
    [FilmitemHeaders addSubview:FilmitemFotterlb];
    
    return FilmitemHeaders;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    for (FilmFactoryModel * filmitem in self.FilmItemSugstionDataArr) {
        filmitem.FilmStatus = NO;
    }
    FilmFactoryModel * filmitem =  self.FilmItemSugstionDataArr[indexPath.row];
    filmitem.FilmStatus =  YES;
    [self.FilmItemSugstionTableView reloadData];
}
-(UITableView *)FilmItemSugstionTableView{
    if (!_FilmItemSugstionTableView) {
        _FilmItemSugstionTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_Width, SCREEN_Height-NaviH-GK_SAFEAREA_BTM) style:UITableViewStylePlain];
        _FilmItemSugstionTableView.delegate = self;
        _FilmItemSugstionTableView.dataSource =self;
        _FilmItemSugstionTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _FilmItemSugstionTableView.showsVerticalScrollIndicator = NO;
        _FilmItemSugstionTableView.showsHorizontalScrollIndicator = NO;
        _FilmItemSugstionTableView.backgroundColor = [UIColor clearColor];
        _FilmItemSugstionTableView.scrollEnabled = NO;
    }
    return _FilmItemSugstionTableView;
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










