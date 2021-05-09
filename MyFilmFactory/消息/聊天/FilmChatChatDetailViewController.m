
#import "FilmChatChatDetailViewController.h"
#import "FilmChatDetailTableCell.h"
#import "FilmChatZoneChatDetailToolsView.h"
#import "FilmChatDetailMoel.h"
@interface FilmChatChatDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * FilmChatZoneChatTabkleView;
@property(nonatomic,strong) NSMutableArray * FilmChatChatDataArr;
@property(nonatomic,strong) FilmChatZoneChatDetailToolsView  * FilmChatChatToolView;
@end

@implementation FilmChatChatDetailViewController
-(NSMutableArray *)FilmChatChatDataArr{
    if (!_FilmChatChatDataArr) {
        _FilmChatChatDataArr = [NSMutableArray array];
    }
    return _FilmChatChatDataArr;
}
-(FilmChatZoneChatDetailToolsView *)FilmChatChatToolView{
    if (!_FilmChatChatToolView) {
        MJWeakSelf;
        _FilmChatChatToolView = [[FilmChatZoneChatDetailToolsView alloc]initWithFrame:CGRectMake(0, SCREEN_Height-RealWidth(65)-NaviH, SCREEN_Width, RealWidth(60)) witheTextViewBlokc:^(UITextView * _Nonnull textView) {
            FilmChatDetailMoel  * models = [[FilmChatDetailMoel alloc]init];
            models.msgname = textView.text;
            models.userID = self.listModel.ChatID;
     
            models.msgisMe = YES;
            models.imgUrl = @"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F17%2F20150517101126_SFy2U.jpeg&refer=http%3A%2F%2Fimg3.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619531738&t=5a22670d588cfd9b0d5f6719b04e22bf";
            models.CellHeight = 0 ;
            [weakSelf.FilmChatChatDataArr addObject:models];
            [WHC_ModelSqlite insert:models];
            NSArray * arr =   [WHC_ModelSqlite query:[FilmChatMsgListModel class] where:[NSString stringWithFormat:@"ChatID ='%ld'",self.listModel.ChatID]];
            if (arr.count == 0) {
                FilmChatMsgListModel * listModl  = [[FilmChatMsgListModel alloc]init];
                listModl.ChatID = self.listModel.ChatID;
                listModl.imgurl = self.listModel.imgurl;
                listModl.topname = self.listModel.topname;
                listModl.content = textView.text;
                [WHC_ModelSqlite insert:listModl];
            }else{
                [WHC_ModelSqlite update:[FilmChatMsgListModel class] value:[NSString stringWithFormat:@"content = '%@'",textView.text] where:[NSString stringWithFormat:@"ChatID ='%ld'",self.listModel.ChatID]];
            }
            [weakSelf.FilmChatZoneChatTabkleView reloadData];
            [weakSelf.FilmChatZoneChatTabkleView selectRowAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.FilmChatChatDataArr.count-1 inSection:0]
                                                           animated:YES
                                                     scrollPosition:UITableViewScrollPositionMiddle];
            textView.text = nil;
            
        }];
    }
    return _FilmChatChatToolView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title  = self.listModel.topname;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#e6e6e6"];
    [self.view addSubview:self.FilmChatZoneChatTabkleView];
    [self.view addSubview:self.FilmChatChatToolView];
    // Do any additional setup after loading the view.
}
-(UITableView *)FilmChatZoneChatTabkleView{
    if (!_FilmChatZoneChatTabkleView) {
        _FilmChatZoneChatTabkleView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Height-NaviH-RealWidth(65)) style:UITableViewStylePlain];
        _FilmChatZoneChatTabkleView.backgroundColor = [UIColor clearColor];
        _FilmChatZoneChatTabkleView.delegate = self;
        _FilmChatZoneChatTabkleView.dataSource = self;
        _FilmChatZoneChatTabkleView.showsVerticalScrollIndicator = NO;
        _FilmChatZoneChatTabkleView.showsHorizontalScrollIndicator = NO;
        _FilmChatZoneChatTabkleView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _FilmChatZoneChatTabkleView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(FilmChatZoneChatTabkleViewClicks)];
        [_FilmChatZoneChatTabkleView.mj_header beginRefreshing];
    }
    return _FilmChatZoneChatTabkleView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FilmChatChatDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * XYZLikeIdentidr = @"FilmChatDetailTableCell";
    FilmChatDetailTableCell * XYZLikeICell = [tableView dequeueReusableCellWithIdentifier:XYZLikeIdentidr];
    if (XYZLikeICell == nil) {
        XYZLikeICell = [[FilmChatDetailTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:XYZLikeIdentidr];
    }
    XYZLikeICell.XYZlikeMdel = self.FilmChatChatDataArr[indexPath.row];
    return XYZLikeICell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FilmChatDetailMoel * listModel  =self.FilmChatChatDataArr[indexPath.row];
    return listModel.CellHeight;
}
-(void)FilmChatZoneChatTabkleViewClicks{
    MJWeakSelf;
    NSArray  * dataArr = [WHC_ModelSqlite query:[FilmChatDetailMoel class] where:[NSString stringWithFormat:@"userID = '%@'",[NSString stringWithFormat:@"%ld",self.listModel.ChatID]]];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.FilmChatChatDataArr.count > 0) {
            [weakSelf.FilmChatChatDataArr removeAllObjects];
        }
        weakSelf.FilmChatChatDataArr  = dataArr.mutableCopy;
        [weakSelf.FilmChatZoneChatTabkleView reloadData];
        [weakSelf.FilmChatZoneChatTabkleView.mj_header endRefreshing];
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

