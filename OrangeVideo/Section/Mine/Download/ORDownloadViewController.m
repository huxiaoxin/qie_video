//
//  ORDownloadViewController.m
//  OrangeVideo
//
//  Created by chenyuan on 2021/1/15.
//

#import "ORDownloadViewController.h"
#import "ORDownLoadTableViewCell.h"
#import "ORChannelNoDataView.h"

@interface ORDownloadViewController ()

@property (nonatomic, strong) UIButton *editButton;
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) UIButton *deleteBtn;
@property (nonatomic, weak) UIImageView *editView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *deleteArr;
@property (nonatomic, assign) NSInteger deleteNum;

@property (nonatomic, strong) ORChannelNoDataView *noDataView;

@end

@implementation ORDownloadViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 没有数据
    [self checkNoDataView];
}

#pragma mark - setupUI

- (void)setupUI
{
    UIButton *editButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 64, 30)];
    [editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editButton setTitleColor:gnh_color_a forState:UIControlStateNormal];
    editButton.titleLabel.font = zy_mediumSystemFont15;
    [editButton setTitle:@"取消" forState:UIControlStateSelected];
    [editButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    self.editButton = editButton;
    
    // 编辑区域
    UIImageView *editView = [UIImageView ly_ViewWithColor:gnh_color_b];
    [self.view addSubview:editView];
    self.editView = editView;
    editView.userInteractionEnabled = YES;
    [editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@(60 + ORKitMacros.iphoneXSafeHeight));
    }];
    self.editView.hidden = YES;
    
    // 编辑区域
    UIView *toplineView = [UIView ly_ViewWithColor:gnh_color_line];
    toplineView.layer.shadowColor = RGBA_HexCOLOR(0x000000, 0.05).CGColor;
    toplineView.layer.shadowOffset = CGSizeMake(0, -1);
    toplineView.layer.shadowOpacity = 1;
    toplineView.layer.shadowRadius = 4;
    [editView addSubview:toplineView];
    [toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0.0f);
        make.left.right.equalTo(editView);
        make.height.mas_equalTo(@0.5f);
    }];
        
    UIButton *selectedBtn = [UIButton ly_ButtonWithTitle:@"全选" titleColor:gnh_color_a font:zy_mediumSystemFont15 target:self selector:@selector(selectedBtnClick:)];
    [selectedBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    [editView addSubview:selectedBtn];
    self.selectedBtn = selectedBtn;
    [selectedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.centerX.equalTo(editView).offset(-(kScreenWidth/4.0));
        make.size.mas_equalTo(CGSizeMake(140, 45));
    }];
    
    UIView *lineView = [UIView ly_ViewWithColor:gnh_color_line];
    [editView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.size.mas_equalTo(CGSizeMake(0.5, 16.5f));
    }];
    
    UIButton *deleteBtn = [UIButton ly_ButtonWithTitle:@"删除" titleColor:gnh_color_theme font:zy_mediumSystemFont15 target:self selector:@selector(deleteBtnClick:)];
    [editView addSubview:deleteBtn];
    self.selectedBtn = deleteBtn;
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(editView).offset(-ORKitMacros.iphoneXSafeHeight/2.0);
        make.centerX.equalTo(editView).offset((kScreenWidth/4.0));
        make.size.mas_equalTo(CGSizeMake(140, 45));
    }];
}

+ (Class)cellClsForItem:(id)item
{
    if ([item isKindOfClass:[ORDownLoadCellItem class]]) {
        return [ORDownLoadTableViewCell class];
    }
    return nil;
}

#pragma mark - setupData

- (void)setupData
{
    self.navigationItem.title = @"我的下载";
    CGRect rect = self.tableView.frame;
    rect.size.height += ORKitMacros.tabBarHeight + ORKitMacros.iphoneXSafeHeight;
    self.tableView.frame = rect;
    
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.backgroundColor = gnh_color_b;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 配置数据
    GNHTableViewSectionObject *sectionObject = [[GNHTableViewSectionObject alloc] init];
    self.sections = [@[sectionObject] mutableCopy];
}

- (void)checkNoDataView
{
    // 没有数据
    __block BOOL hasData = NO;
    [self.sections enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GNHTableViewSectionObject *section = (GNHTableViewSectionObject *)obj;
        if (section.items.count) {
            hasData = YES;
            *stop = YES;
        }
    }];
    self.noDataView.hidden = hasData;
}

#pragma mark - UITableview Delegate

- (void)selectCellWithItem:(id<GNHBaseActionItemProtocol>)item indexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([item isKindOfClass:[ORDownLoadCellItem class]]) {
        ORDownLoadCellItem *cellItem = (ORDownLoadCellItem *)item;
        if (self.editView.hidden) {
            // 跳转到视频详情
            [[ORPlayerManager sharedInstance] jumpChannelWith:cellItem.idStr type:cellItem.type cover:cellItem.coverImg];
        }
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editView.hidden) {
        [self.deleteArr addObject:[self.dataArr objectAtIndex:indexPath.row]];
        self.deleteNum += 1;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%lu)",self.deleteNum] forState:UIControlStateNormal];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.editView.hidden) {
        [self.deleteArr removeObject:[self.dataArr objectAtIndex:indexPath.row]];
        self.deleteNum -= 1;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%lu)",self.deleteNum] forState:UIControlStateNormal];
    }
}

#pragma mark - buttonAction

- (void)rightButtonAction:(UIButton *)btn
{
    [super rightButtonAction:btn];
    
    btn.selected = !btn.selected;
    self.deleteArr = [[NSMutableArray alloc]init];
    self.deleteNum = 0;

    if (btn.selected) {
        self.tableView.editing = YES;
        self.editView.hidden = NO;
        
        CGRect rect = self.tableView.frame;
        rect.size.height += - (60.0f + ORKitMacros.iphoneXSafeHeight + ORKitMacros.statusBarHeight + ORKitMacros.navigationBarHeight);
        self.tableView.frame = rect;
    } else {
        self.tableView.editing = NO;
        self.editView.hidden = YES;
        
        CGRect rect = self.tableView.frame;
        rect.size.height = kScreenHeight - ORKitMacros.statusBarHeight - ORKitMacros.navigationBarHeight;
        self.tableView.frame = rect;
    }
}

- (void)selectedBtnClick:(UIButton *)btn
{
    if (!self.selectedBtn.selected) {
        self.selectedBtn.selected = YES;
        
        for (int i = 0; i < self.dataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionBottom];
        }
        [self.deleteArr addObjectsFromArray:self.dataArr];
        self.deleteNum = self.dataArr.count;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%lu)",self.deleteNum] forState:UIControlStateNormal];
    } else {
        self.selectedBtn.selected = NO;
        [self.deleteArr removeAllObjects];
        for (int i = 0; i < self.dataArr.count; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
            [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
        }
        self.deleteNum = 0;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%lu)",self.deleteNum] forState:UIControlStateNormal];
    }
}

- (void)deleteBtnClick:(UIButton *)btn
{
    if (self.tableView.editing) {
        //删除

        [self.dataArr removeObjectsInArray:self.deleteArr];
        [self.tableView reloadData];
        
        self.deleteNum = 0;
        [self.deleteBtn setTitle:[NSString stringWithFormat:@"删除(%lu)",self.deleteNum] forState:UIControlStateNormal];
        
        self.selectedBtn.selected = NO;
        //  你的网络请求
    }
}

#pragma mark - Properties

- (ORChannelNoDataView *)noDataView
{
    if (!_noDataView) {
        _noDataView = [[ORChannelNoDataView alloc] init];
        [self.tableView addSubview:_noDataView];
        [_noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.tableView);
            make.size.mas_equalTo(CGSizeMake(kScreenWidth, self.view.height));
        }];
    }
    return _noDataView;
}

@end
